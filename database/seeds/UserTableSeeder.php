<?php
/**
 * Created by PhpStorm.
 * User: david
 * Date: 6/1/15
 * Time: 6:59 PM
 */
use Faker\Factory as Faker;
use OneSource\User;
class UserTableSeeder extends \Illuminate\Database\Seeder {
    public function run()
    {
        $faker = Faker::create();

        foreach (range(1,100) as $index) {
            User::create([
                'name' => $faker->name,
                'email' => $faker->unique()->email,
                'password' => $faker->password(6,10)
            ]);
        }
    }
}