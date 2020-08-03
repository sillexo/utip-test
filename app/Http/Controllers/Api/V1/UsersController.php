<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Resources\UserResource;
use App\User;
use App\Role;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Gate;
use Validator;

class UsersController extends APIController
{
    public function __construct()
    {
        $this->middleware('can:users-manage');
    }

    /**
     * Return the users.
     *
     * @param Request $request
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request)
    {
        $limit = $request->get('paginate') ? $request->get('paginate') : 25;
        $orderBy = $request->get('orderBy') ? $request->get('orderBy') : 'ASC';
        $sortBy = $request->get('sortBy') ? $request->get('sortBy') : 'created_at';

        $users = \Cache::remember('users', 900, function() use ($request, $sortBy, $orderBy, $limit) {
            return User::filter($request->get('filter'))->orderBy($sortBy, $orderBy)->paginate($limit);
        });

        return UserResource::collection($users);
    }

    /**
     * Return the specified resource.
     *
     * @param User $user
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function show(User $user)
    {
        $userCached = \Cache::remember('user_' . $user->id, 900, function() use ($user) {
            return User::findOrFail($user->id);
        });

        UserResource::withoutWrapping();
        return new UserResource($userCached);
    }

    /**
     * Create User.
     *
     * @param Request $request
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request)
    {
        $validation = $this->validateUser($request);

        if ($validation->fails()) {
            return $this->throwValidation($validation->messages()->first());
        }

        $user = User::create([
            'email'    => $request->email,
            'password' => Hash::make($request->password),
            'name'     => $request->name,
        ]);

        $role = Role::find($request->role_id);
        $role->users()->save($user);

        return new UserResource($user);
    }

    /**
     * Update User.
     *
     * @param Request $request
     * @param User    $user
     *
     * @return Validator object
     */
    public function update(Request $request, User $user)
    {
        $validation = $this->validateUser($request, 'edit', $user->id);

        if ($validation->fails()) {
            return $this->throwValidation($validation->messages()->first());
        }

        $data = [
            'email'    => $request->email,
            'password' => Hash::make($request->password),
            'name'     => $request->name,
        ];
        $user->update($data);

        $user->roles()->detach();
        $user->roles()->attach($request->role_id);

        return new UserResource($user);
    }

    /**
     * Delete User.
     *
     * @param User    $user
     *
     * @return mixed
     */
    public function destroy(User $user)
    {
        $user->delete();

        return response()->json([], 204);
    }

    /**
     * validateUser User Requests.
     *
     * @param $request
     * @param $action
     * @param $id
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function validateUser(Request $request, $action = '', $id = 0)
    {
        $password = ($action == 'edit') ? '' : 'required|min:6|confirmed';

        $validation = Validator::make($request->all(), [
            'name'     => 'required|max:191',
            'email'    => 'required|max:191|email|unique:users,email,'. $id,
            'password' => $password,
            'role_id'  => 'required|integer',
        ]);

        return $validation;
    }
}
