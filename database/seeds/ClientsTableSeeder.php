<?php
/**
 * Created by PhpStorm.
 * User: david
 * Date: 7/13/15
 * Time: 9:58 PM
 */

use Illuminate\Support\Facades\DB;
use Faker\Factory as Faker;
use OneSource\Client;
use OneSource\Passenger;

class ClientsTableSeeder extends \Illuminate\Database\Seeder {

    protected $dates = ['2014-01-','2014-02-','2014-03-','2014-04-','2014-05-','2014-06-','2014-07-','2014-08-','2014-09-','2014-10-','2014-11-','2014-12-'];
    protected $clinics;
    protected $law_offices;
    protected $insurances;
    protected $reasons_cancel;
    protected $reasons_confirmation;
    protected $regions;
    protected $case_type = ['Personal Injury','Workers Compensation'];

    public function run()
    {
        // get all related data to push content.
        $this->setForeigns();
        $faker = Faker::create();
        foreach($this->dates as $date) {
            foreach (range(1,500) as $index) {
                $new_date = $date . rand(1,28);
                $appt_date = date('Y-m-d '.rand(8,18).':00:00',strtotime($new_date)+172800);
                $doi = date('Y-m-d',strtotime($new_date)-86400);
                $casetype = $this->case_type[rand(0,1)];
                $law_office = $this->law_offices[rand(0,9)];
                $law_office = $law_office->id;
                $clinic = $this->clinics[rand(0,9)];
                $clinic = $clinic->id;
                $region = $this->regions[rand(0,50)];
                $region = $region->id;
                $confirmation = $this->reasons_confirmation[rand(0,6)];
                $confirmation = $confirmation->id;
                $attorney = DB::table('attorneys_doctors')->where('is_attorney',1)->where('requesting_office_id',$law_office)->first();
                $doctor = DB::table('attorneys_doctors')->where('is_attorney',0)->where('requesting_office_id',$clinic)->first();
                $new_record = [
                    'date_of_referral' => $new_date,
                    'date_received' => $new_date,
                    'case_type' => $casetype,
                    'firstname' => $faker->firstName,
                    'lastname' => $faker->lastName,
                    'dob' => $faker->date('Y-m-d','1990-01-01'),
                    'ssn' => $faker->ean13,
                    'phone' => $faker->phoneNumber,
                    'alt_phone' => $faker->phoneNumber,
                    'address' => $faker->streetName . ' ' . $faker->streetAddress,
                    'city' => $faker->city,
                    'region_id' => $region,
                    'zipcode' => rand(10000,99999),
                    'doi' => $doi,
                    'body_parts' => $this->getBodyParts(),
                    'referral_source_id' => $law_office,
                    'attorney_id' => $attorney->id,
                    'attorney_notes' => $faker->sentence(10),
                    'clinic_id' => $clinic,
                    'doctor_id' => $doctor->id,
                    'scheduled_with' => $faker->name,
                    'appt_date' => $appt_date,
                    'appt_confirmed_id' => $confirmation,
                    'clinic_notes' => $faker->sentence(10),
                    'patient_treating' => rand(0,1),
                    'next_appt' => $faker->sentence(5),
                    'verified_with' => $faker->name,
                    'first_seen' => $appt_date,
                    'is_doctor_mpn' => 0
                ];
                if ($casetype == 'Workers Compensation') {
                    $insurance_id = $this->insurances[rand(0,9)];
                    $insurance_company = [
                        'insurance_company_id' => $insurance_id->id,
                        'is_doctor_mpn' => rand(0,1),
                        'employer_name' => $faker->name,
                    ];
                    $new_record = array_merge($new_record,$insurance_company);
                } /* end of casetype */
                //print_r($new_record);
                //die();
                $new_client = Client::create($new_record);
                if ($casetype == 'Personal Injury') {
                    $limit = rand(1,3);
                    for ($i=0;$i<$limit;$i++):
                        Passenger::create([
                            'name' => $faker->name,
                            'dob' => $faker->date('Y-m-d','2005-01-01'),
                            'phone' => $faker->phoneNumber,
                            'address' => $faker->address,
                            'ibp' => $this->getBodyParts(),
                            'appt_date' => $appt_date,
                            'client_id' => $new_client->id
                        ]);
                    endfor;
                } /* end of casetype */
            }
        } /* end of dates */

    }

    protected function setForeigns()
    {
        $this->clinics = DB::table('requesting_offices')->where('is_clinic',1)->select('id')->skip(0)->take(10)->get();
        $this->insurances = DB::table('requesting_offices')->where('is_insurance',1)->select('id')->skip(0)->take(10)->get();
        $this->law_offices = DB::table('requesting_offices')->where('is_lawoffice',1)->select('id')->skip(0)->take(10)->get();
        $this->reasons_cancel = DB::table('reasons')->where('is_confirmation',0)->select('id')->get();
        $this->reasons_confirmation = DB::table('reasons')->where('is_confirmation',1)->select('id')->get();
        $this->regions = DB::table('regions')->select('id')->get();
    }

    protected function getBodyParts()
    {
        $skip = rand(40,47);
        $take = 48 - $skip; // 48 is the number of bodyparts so far.
        $bodyparts = DB::table('bodyparts')->select('name')->skip($skip)->take($take)->get();
        $bp = array();
        foreach ($bodyparts as $body) {
            array_push($bp,$body->name);
        }
        return implode(',',$bp);
    }
}