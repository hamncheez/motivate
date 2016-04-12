<?php

use Illuminate\Database\Seeder;
use App\User;
use App\Category;
use App\Post;
class DatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
    	Eloquent::unguard();

    	$this->call('PostsTableSeeder');
       // $this->call(UsersTableSeeder::class);
    }
}
    class PostsTableSeeder extends Seeder{
    	public function run(){
    		DB::table('posts')->delete();
    		DB::table('categories')->delete();
    		DB::table('users')->delete();

    		$keola = User::create(array(
    			'firstname'=>'Keola',
    			'lastname'=>'Ho',
    			'email'=>'keola.oh@gmail.com',
    			'password'=>Hash::make('123password'),
    			'role'=>1,
    			'tagline'=>'I htink im cool, but I just pose'

    		));
    		$ivan = User::create(array(
    			'firstname'=>'Ivan',
    			'lastname'=>'Ho',
    			'email'=>'ivankealiiho@gmail.com',
    			'password'=>hash('md5','123password'),
    			'role'=>1,
    			'tagline'=>'I made everything'
    		));
    		$cami = User::create(array(
    			'firstname'=>'Cami',
    			'lastname'=>'Ho',
    			'email'=>'cami@gmail.com',
    			'password'=>hash('md5','123password'),
    			'role'=>2,
    			'tagline'=>'I got a new job in Lehi'
    		));
    		$whitney = User::create(array(
    			'firstname'=>'whitney',
    			'lastname'=>'Ho',
    			'email'=>'britlitwhit17@aol.com',
    			'password'=>hash('md5','123password'),
    			'role'=>2,
    			'tagline'=>'I love animals. and Ivan.'

    		));
    		$this->command->info('users created');
			
			//categories

    		$cars = Category::create(array(
    			'name'=>'car repair',
    			'user_id'=>$hoku->id
    		));
    		$plants = Category::create(array(
    			'name'=>'plants',
    			'user_id'=>$whitney->id
    		));
    		$bikes = Category::create(array(
    			'name'=>'bikes',
    			'user_id'=>$ivan->id
    		));
    		$this->command->info('categories created.');

    		//posts
    		$secondpost = Post::create(array(
    			'title'=>'I fixed my headlight',
    			'body'=>'Bacon ipsum dolor amet brisket fatback filet mignon, beef ribs rump sint shoulder andouille enim voluptate cupidatat capicola t-bone. Est capicola qui pork chop t-bone, quis irure. Tongue beef sint fatback, commodo landjaeger ex pork belly. Sunt excepteur pork tempor reprehenderit.

Ut ham hock prosciutto consequat, aliqua quis tempor kevin sed voluptate ut. Ribeye brisket leberkas, fugiat nisi hamburger magna anim swine qui jowl pancetta t-bone quis. Veniam cow tenderloin eu tongue occaecat meatball eiusmod t-bone tri-tip reprehenderit tempor ut. Salami corned beef ut nisi jerky non. Pork loin lorem picanha ut.',
				'user_id'=>$hoku->id,
				'pubstatus'=>0,
    		));
    		$firstpost = Post::create(array(
    			'title'=>'Planted a plant',
    			'body'=>'Tongue in kielbasa exercitation shoulder, tri-tip bresaola ut frankfurter mollit bacon non. Dolor frankfurter tempor landjaeger duis proident jowl, biltong et tail consectetur venison shankle. Sed velit biltong tail ad ea jerky sint kielbasa chicken ex pancetta. Reprehenderit swine pig bresaola nostrud minim cupidatat veniam fugiat mollit officia hamburger ground round eiusmod. Cupidatat fugiat occaecat hamburger pork chop aliquip capicola alcatra meatball consequat sed cow ground round.

Consequat fugiat ut shoulder dolor doner ham aute aliquip esse aliqua labore in. Sirloin alcatra dolore, esse fatback capicola pork chop pork loin aliquip leberkas pork belly. Quis ribeye prosciutto do velit pork ut lorem duis. Aute pariatur cupim, ut rump flank venison. Pastrami duis cow cillum sausage esse pork chop ea capicola swine exercitation. Nostrud id beef, sirloin et fugiat veniam.',
				'user_id'=>$whitney->id
    		));
    		$thirdpost = POST::create(array(
    			'title'=>'how I found a good mechanic',
    			'body'=>'Pancetta eu veniam est chuck. Eiusmod reprehenderit bacon porchetta do minim dolor alcatra chicken veniam beef shoulder pastrami boudin. Ullamco drumstick laborum duis porchetta velit tail short ribs salami elit. Elit exercitation excepteur id sint consectetur laborum pancetta quis.

Porchetta occaecat flank, ut swine strip steak pork deserunt consequat. Proident ham duis pork flank dolore. Corned beef jowl pastrami dolore commodo ground round cupidatat brisket turducken bacon kielbasa pork chop. Qui meatball fugiat irure drumstick. Jowl occaecat filet mignon officia. Aute turkey bresaola, ribeye pork belly sirloin non esse meatloaf fatback short loin quis. Ham adipisicing elit officia porchetta.

Lorem biltong ex t-bone beef ribs, ribeye minim velit non. Nisi shankle sunt, pariatur aute andouille landjaeger excepteur minim. Pork officia prosciutto ball tip, consectetur irure consequat ad do meatball non cillum turducken adipisicing ham hock. Sausage et short loin, id esse consequat capicola excepteur kielbasa duis pork swine andouille.',
			'user_id'=>$hoku->id
    		));

    		//many to many; attach post to category

    		$firstpost->categories()->attach($cars->id);
    		$secondpost->categories()->attach($plants->id);
    		$thirdpost->categories()->attach($cars->id);

    		$this->command->info('Cateories linked to posts.');
    		
    	}
    }

