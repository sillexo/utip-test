<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Article extends Model
{
    protected $fillable = [
        'id',
        'title',
        'image',
        'author_id',
    ];

    public function author()
    {
        return $this->belongsTo(User::class);
    }

    public function comments()
    {
        return $this->hasMany(Comment::class);
    }

    public function scopeFilter($query, $filters)
    {
        if (isset($filters['title'])) {
            $query->where('articles.title', 'like', '%' . $filters['title'] . '%');
        }

        if (isset($filters['author_id'])) {
            $query->where('articles.author_id', $filters['author_id']);
        }
    }
}
