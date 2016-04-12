<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;

use App\Post;

use App\User;

class PostsController extends Controller
{

    public function __construct(){
        $this->middleware('jwt.auth');
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $posts = Post::paginate('3');
        //return $posts;
        return \Response::json([
            'posts_data'=>$this->transformCollection($posts)
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if(! $request->title){
            return Response::json([
                'error' => [
                    'message' => 'Your post needs a title.'
                ]
            ], 422);
        }
        elseif (! $request->user_id) {
            return Response::json([
                'error' => [
                    'message' => 'You need to be logged in.'
                ]
            ], 422);
        }
        else{
            $post = Post::create($request->all());
            return \Response::json([
                'message'=>'Post saved.',
                'post_data'=>$this->transform($post)
            ]);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $post = Post::with(
                array('User'=>function($query){
                $query->select('id','firstname', 'lastname');
            })
            )->find($id);
        if(!$post){
            return \Response::json([
                'error'=>[
                    'message'=>'Post not found.'
                ]
            ], 404);
        }

        $previous = Post::where('id','<',$post->id)->max('id');//need ot think this through. Good UI would say that it would only show next/previous in the same category, but a post can belong to plural categories
        $next = Post::where('id','>',$post->id)->min('id');

        return \Response::json([
            'post_data'=>$this->transform($post),
            'previous_post_id'=>$previous,
            'next_post_id'=>$next
        ], 200);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
         if(! $request->title){
            return \Response::json([
                'error' => [
                    'message' => 'Your post needs a title.'
                ]
            ], 422);
        }
        elseif (! $request->user_id) {
            return \Response::json([
                'error' => [
                    'message' => 'You need to be logged in.'
                ]
            ], 422);
        }
        else{
            $post = Post::find($id);
            $post->title = $request->title;
            $post->body = $request->body;
            $post->pubstatus = $request->pubstatus;
            $post->save();
            return \Response::json([
                'message'=>'Post updated.',
                'post_data'=>$this->transform($post)
            ]);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $post = Post::find($id);
        $post->pubstatus = 2;
        $post->save();
        return \Response::json([
            'message'=>'Post removed.'
        ]);
    }

    /*build json data from model
     *
     */

    private function transformCollection($posts){
        $postData = [];
        foreach($posts as $post){
            $post = $this->transform($post);
            array_push($postData, $post);
        }
        return $postData;
    }

    private function transform($post){
        return [
                'post_id'=>$post->id,
                'post_title'=>$post->title,
                'post_content'=>$post->body,
                'post_fav_count'=>$post->favoritescount,
                'publish_date'=>$post->published_on,
                'last_edited_date'=>$post->updated_at,
                'author_firstname'=>$post->user->firstname,
                'author_lastname'=>$post->user->lastname
            ];
    }
}
