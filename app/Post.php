<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    protected $fillable = array('title','body','pubstatus', 'user_id');

	/*    many to many relation to categories; 
 	*    a post can be in plural categories and 
 	*    a category can have plural posts
 	*/

    public function categories(){
    	return $this->belongsToMany('App\Category');
    }

    /* Many to one; each post belongs to a single author(user), 
     * but a user can have many posts
     *
     */

    public function user(){
    	return $this->belongsTo('App\User');
    }
}
