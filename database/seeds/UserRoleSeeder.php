<?php

use Illuminate\Database\Seeder;

/**
 * Class UserRoleSeeder.
 */
class UserRoleSeeder extends Seeder
{
    /**
     * Run the database seed.
     *
     * @return void
     */
    public function run()
    {
        $data = [
            [
                'user_id' => 1,
                'role_id' => 1,
            ],
            [
                'user_id' => 2,
                'role_id' => 2,
            ],
            [
                'user_id' => 3,
                'role_id' => 3,
            ],
            [
                'user_id' => 4,
                'role_id' => 3,
            ],
            [
                'user_id' => 5,
                'role_id' => 3,
            ],
            [
                'user_id' => 6,
                'role_id' => 3,
            ],
            [
                'user_id' => 7,
                'role_id' => 3,
            ],
            [
                'user_id' => 8,
                'role_id' => 3,
            ],
            [
                'user_id' => 9,
                'role_id' => 3,
            ],
            [
                'user_id' => 10,
                'role_id' => 3,
            ],
            [
                'user_id' => 11,
                'role_id' => 3,
            ],
            [
                'user_id' => 12,
                'role_id' => 3,
            ],
            [
                'user_id' => 13,
                'role_id' => 3,
            ],
            [
                'user_id' => 14,
                'role_id' => 3,
            ],
            [
                'user_id' => 15,
                'role_id' => 3,
            ],
            [
                'user_id' => 16,
                'role_id' => 3,
            ],

        ];

        DB::table('user_role')->insert($data);
    }
}
