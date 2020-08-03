<?php

use Carbon\Carbon as Carbon;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

/**
 * Class RoleTableSeeder.
 */
class RoleTableSeeder extends Seeder
{
    /**
     * Run the database seed.
     *
     * @return void
     */
    public function run()
    {
        $roles = [
            [
                'name'         => 'admin',
                'display_name' => 'Администратор',
            ],
            [
                'name'         => 'manager',
                'display_name' => 'Менеджер',
            ],
            [
                'name'         => 'user',
                'display_name' => 'Пользователь',
            ],
        ];

        DB::table('roles')->insert($roles);
    }
}
