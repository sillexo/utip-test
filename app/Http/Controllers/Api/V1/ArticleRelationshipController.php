<?php

namespace App\Http\Controllers\Api\V1;

use App\Article;
use App\Http\Resources\CommentsResource;
use App\Http\Resources\UserResource;

class ArticleRelationshipController extends APIController
{
    public function __construct()
    {
        $this->middleware('can:articles-manage');
    }

    public function author(Article $article)
    {
        return new UserResource($article->author);
    }

    public function comments(Article $article)
    {
        return new CommentsResource($article->comments);
    }
}
