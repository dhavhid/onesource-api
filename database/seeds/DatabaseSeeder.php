<?php

use Illuminate\Support\Facades\DB;
use Illuminate\Database\Seeder;
use Illuminate\Database\Eloquent\Model;

class DatabaseSeeder extends Seeder {

	/**
	 * Run the database seeds.
	 *
	 * @return void
	 */
	public function run()
	{
        //DB::delete("delete from users;");
        //DB::delete("delete from attorneys_doctors");
        //DB::delete("delete from requesting_offices");
        //DB::delete("delete from passengers");
        //DB::delete("delete from clients");
		Model::unguard();

		//$this->call('UserTableSeeder');
        //$this->call('RequestingOfficesSeeder');
        //$this->call('ClientsTableSeeder');
	}

}
