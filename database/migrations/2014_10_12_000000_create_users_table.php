<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->increments('id')->index()->unsigned();
            $table->string('firstname');
            $table->string('lastname');
            $table->string('email')->unique();
            $table->string('password');
            $table->string('gravatar')->unique();

            $table->integer('role')->unsigned();


            $table->rememberToken();
            $table->timestamps();
        });

        Schema::create('roles', function (Blueprint $table){
            $table->increments('id');
            $table->string('type')->unique();
        });
        Schema::table('users', function(Blueprint $table){
            $table->foreign('role')->references('id')->on('roles');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('users');
        Schema::drop('roles');
    }
}
