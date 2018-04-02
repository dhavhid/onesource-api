<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AlterTimestamp extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('passengers', function(Blueprint $table)
		{
			DB::statement('ALTER TABLE passengers ALTER COLUMN appt_date TYPE TIMESTAMP;');
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('passengers', function(Blueprint $table)
		{
			//
		});
	}

}
