<?php

use Illuminate\Database\Seeder;
use Faker\Factory as Faker;
use App\Comment;

class CommentsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Faker::create();

        // And now let's generate a few dozen users for our app:
        for ($i = 0; $i < 15; $i++) {
            Comment::create([
                'article_id' => $faker->randomElement([1, 3, 5, 7, 9]),
                'author_id'  => $faker->randomElement([1, 3, 5, 7, 9]),
                'body'       => $faker->text,
            ]);
        }
    }
}
