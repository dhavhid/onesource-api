<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class DropNotNullOnAddressPhoneReqOffices extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('requesting_offices', function(Blueprint $table)
		{
			DB::statement("ALTER TABLE requesting_offices ALTER COLUMN address1 DROP NOT NULL;");
            DB::statement("ALTER TABLE requesting_offices ALTER COLUMN city DROP NOT NULL;");
            DB::statement("ALTER TABLE requesting_offices ALTER COLUMN zipcode DROP NOT NULL;");
			DB::statement("ALTER TABLE requesting_offices ALTER COLUMN phone DROP NOT NULL;");
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('requesting_offices', function(Blueprint $table)
		{
			//
		});
	}

}
