<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Profile extends Model
{
    protected $fillable = [
        'user_id',
        'address',
        'phone',
    ];

    protected $table = 'user_profile';

    public $timestamps = false;

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
