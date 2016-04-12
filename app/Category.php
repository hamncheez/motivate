<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $fillable = array('name');

     /***
     * Each category has a single admin(user), but  
     * each admin(user) can have many categories
`   ***/

	public function users(){
		return $this->belongsTo('App\User');
	}
}
