<?php

use Illuminate\Database\Seeder;
use App\User;
use Faker\Factory as Faker;
use Illuminate\Support\Str;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Faker::create();

        $password = Hash::make('password');

        User::create([
            'name'      => 'Administrator',
            'email'     => 'admin@test.com',
            'password'  => $password,
        ]);

        User::create([
            'name'      => 'Manager',
            'email'     => 'manager@test.com',
            'password'  => $password,
        ]);

        User::create([
            'name'      => 'User',
            'email'     => 'user@test.com',
            'password'  => $password,
        ]);

        User::create([
            'name'      => 'Blocked User',
            'email'     => 'blocked_user@test.com',
            'password'  => $password,
            'status'    => '0',
        ]);

        // And now let's generate a few dozen users for our app:
        for ($i = 0; $i < 12; $i++) {
            User::create([
                'name'      => $faker->name,
                'email'     => $faker->email,
                'password'  => $password,
            ]);
        }
    }
}
