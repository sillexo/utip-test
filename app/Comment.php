<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Comment extends Model
{
    protected $fillable = [
        'id',
        'body',
        'author_id',
        'article_id',
    ];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function author()
    {
        return $this->belongsTo(User::class);
    }

    /**
     * Comment belongs to Article.
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function article()
    {
        return $this->belongsTo(Article::class);
    }

    public function scopeFilter($query, $filters)
    {
        if (isset($filters['author_id'])) {
            $query->where('comments.author_id', $filters['author_id']);
        }

        if (isset($filters['article_id'])) {
            $query->where('comments.article_id', $filters['article_id']);
        }
    }
}
