<?php

use Illuminate\Database\Seeder;
use App\Profile;
use Faker\Factory as Faker;

class UserProfileSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Faker::create();

        for ($i = 1; $i < 17; $i++) {
            Profile::create([
                'user_id' => $i,
                'phone'   => $faker->e164PhoneNumber,
                'address' => $faker->address,
            ]);
        }
    }
}
