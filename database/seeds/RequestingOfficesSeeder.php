<?php
/**
 * Created by PhpStorm.
 * User: david
 * Date: 7/13/15
 * Time: 3:11 PM
 */

use Faker\Factory as Faker;
use OneSource\RequestingOffice;
use OneSource\AttorneyDoctor;
class RequestingOfficesSeeder extends \Illuminate\Database\Seeder {
    public function run()
    {
        $faker = Faker::create();

        foreach (range(1,25) as $index) {
            /*$is_lawoffice = rand(0,1);
            if ($is_lawoffice == 0){
                $law_office = '';
                $title = 'Dr. ';
            }
            else {
                $law_office = 'Law Office of ';
                $title = '';
            }*/
            $law_office = '';
            $is_lawoffice = 0;
            $r_office = RequestingOffice::create([
                'name' => $law_office . $faker->unique()->company,
                'address1' => $faker->streetAddress,
                'address2' => $faker->streetName,
                'city'=> $faker->city,
                'zipcode' => rand(10000,99999),
                'phone' => $faker->phoneNumber,
                'fax' => $faker->phoneNumber,
                'contact' => $faker->name,
                'email' => $faker->unique()->email,
                'alt_phone' => $faker->phoneNumber,
                'notes' => $faker->sentence(6),
                'is_lawoffice' => $is_lawoffice,
                'is_insurance' => 1
            ]);
            /*AttorneyDoctor::create([
                'name' => $title . $faker->firstName . ' ' . $faker->lastName,
                'phone' => $faker->phoneNumber,
                'fax' => $faker->phoneNumber,
                'email' => $faker->unique()->email,
                'is_attorney' => $is_lawoffice,
                'requesting_office_id' => $r_office->id
            ]);*/
        }
    }
}