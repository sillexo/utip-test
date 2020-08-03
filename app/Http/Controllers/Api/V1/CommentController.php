<?php

namespace App\Http\Controllers\Api\V1;

use App\Comment;
use App\Http\Resources\CommentResource;
use App\Http\Resources\CommentsResource;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Gate;
use Validator;

class CommentController extends APIController
{
    /**
     * Display a listing of the resource.
     *
     */
    public function index(Request $request)
    {
        $limit = $request->get('paginate') ? $request->get('paginate') : 25;
        $orderBy = $request->get('orderBy') ? $request->get('orderBy') : 'ASC';
        $sortBy = $request->get('sortBy') ? $request->get('sortBy') : 'created_at';

        $comments = \Cache::remember('comments', 900, function() use ($request, $sortBy, $orderBy, $limit) {
            return Comment::filter($request->get('filter'))->with(['author'])->orderBy($sortBy, $orderBy)->paginate($limit);
        });

        return new CommentsResource($comments);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if ( ! Gate::allows('create-comment')) {
            return response()->json([
                'error' => true,
                'message' => 'Forbidden to blocked users',
            ], 403);
        }

        $validation = $this->validateComment($request);

        if ($validation->fails()) {
            return $this->throwValidation($validation->messages()->first());
        }

        $comment = Comment::create($request->all());

        return response()->json($comment, 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Comment $comment
     *
     * @return CommentResource
     */
    public function show(Comment $comment)
    {
        $commentCached = \Cache::remember('comment_' . $comment->id, 900, function() use ($comment) {
            return Comment::findOrFail($comment->id);
        });

        CommentResource::withoutWrapping();
        return new CommentResource($commentCached);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Comment  $comment
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Comment $comment)
    {
        if ( ! Gate::allows('update-comment')) {
            return response()->json([
                'error' => true,
                'message' => 'Forbidden to blocked users',
            ], 403);
        }

        $validation = $this->validateComment($request);

        if ($validation->fails()) {
            return $this->throwValidation($validation->messages()->first());
        }

        $comment->update($request->all());

        return response()->json($comment, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Comment  $comment
     * @return \Illuminate\Http\Response
     */
    public function destroy(Comment $comment)
    {
        $comment->delete();

        return response()->json([], 204);
    }

    /**
     * validateComment Comment Requests.
     *
     * @param $request
     * @param $id
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function validateComment(Request $request)
    {
        $validation = Validator::make($request->all(), [
            'body'       => 'required',
            'author_id'  => 'required|integer',
            'article_id' => 'required|integer',
        ]);

        return $validation;
    }
}
