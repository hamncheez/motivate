<?php

namespace App;

use Illuminate\Foundation\Auth\User as Authenticatable;
use App\User;

class User extends Authenticatable
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'firstname', 'lastname', 'tagline', 'email', 'password', 'role'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /***
     * Each user has many posts, but 
     * each post can only have one user (author)
`   ***/

    public function posts(){
        return $this->hasMany('App\Post');
    }

     /***
     * Each user has many categories, but 
     * each category can only have one user (Admin author)
`   ***/

    public function categories(){
        return $this->hasMany('App\Category');
    }
}
