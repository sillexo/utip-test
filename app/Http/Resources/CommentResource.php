<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\Resource;

class CommentResource extends Resource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request
     *
     * @return array
     */
    public function toArray($request)
    {
        return [
            'type'  => 'comments',
            'id'    => $this->id,
            'attributes' => [
                'body' => $this->body,
            ],
            'relationships' => new CommentRelationshipResource($this),
            'links' => [
                'self' => route('api.comments.show', ['comment' => $this->id]),
            ],
        ];
    }
}
