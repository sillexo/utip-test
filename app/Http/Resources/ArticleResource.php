<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\Resource;

class ArticleResource extends Resource
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
            'type'          => 'articles',
            'id'            => $this->id,
            'attributes'    => [
                'title' => $this->title,
            ],
            'relationships' => new ArticleRelationshipResource($this),
            'links'         => [
                'self' => route('api.articles.show', ['article' => $this->id]),
            ],
        ];
    }
}
