<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePostsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('posts', function(Blueprint $table){
            $table->increments('id')->unsigned();
            $table->text('title');
            $table->text('body');

            $table->integer('user_id')->unsigned();
          //  $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');

            $table->integer('pub_status');
            $table->integer('upvotes');
            $table->timestamps();
            $table->timestamp('published_on');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('posts');
    }
}
