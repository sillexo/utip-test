<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Resources\RoleResource;
use App\Role;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Gate;
use Validator;

class RolesController extends APIController
{
    public function __construct()
    {
        $this->middleware('can:roles-manage');
    }

    /**
     * Return the roles.
     *
     * @param Request $request
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request)
    {
        $limit = $request->get('paginate') ? $request->get('paginate') : 25;
        $orderBy = $request->get('orderBy') ? $request->get('orderBy') : 'ASC';
        $sortBy = $request->get('sortBy') ? $request->get('sortBy') : 'name';

        $roles = \Cache::remember('roles', 900, function() use ($request, $sortBy, $orderBy, $limit) {
            return Role::filter($request->get('filter'))->orderBy($sortBy, $orderBy)->paginate($limit);
        });

        return RoleResource::collection($roles);
    }

    /**
     * Return the specified resource.
     *
     * @param Role $role
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function show(Role $role)
    {
        $roleCached = \Cache::remember('role_' . $role->id, 900, function() use ($role) {
            return Role::findOrFail($role->id);
        });

        RoleResource::withoutWrapping();
        return new RoleResource($roleCached);
    }

    /**
     * Creates the Resource for Role.
     *
     * @param Request $request
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request)
    {
        $validation = $this->validateRole($request);

        if ($validation->fails()) {
            return $this->throwValidation($validation->messages()->first());
        }

        $role = Role::create($request->all());

        return response()->json($role, 201);
    }

    /**
     * Update Role.
     *
     * @param Request $request
     * @param Role    $role
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(Request $request, Role $role)
    {
        $validation = $this->validateRole($request, $role->id);

        if ($validation->fails()) {
            return $this->throwValidation($validation->messages()->first());
        }

        $role->update($request->all());

        return response()->json($role, 200);
    }

    /**
     *  Delete Role.
     *
     * @param Role    $role
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function destroy(Role $role)
    {
        $role->delete();

        return response()->json([], 204);
    }

    /**
     * validateRole Role Requests.
     *
     * @param Request $request
     * @param int     $id
     *
     * @return Validator object
     */
    public function validateRole(Request $request, $id = 0)
    {
        $permissions = '';

        $validation = Validator::make($request->all(), [
            'name'         => 'required|max:191|unique:roles,name,'. $id,
            'display_name' => 'required|max:191',
        ]);

        return $validation;
    }
}
