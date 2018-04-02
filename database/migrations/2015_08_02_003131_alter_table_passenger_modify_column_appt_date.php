<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AlterTablePassengerModifyColumnApptDate extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('passengers', function(Blueprint $table)
		{
			DB::statement("ALTER TABLE passengers ALTER COLUMN appt_date TYPE date;");
			DB::statement("ALTER TABLE passengers ALTER COLUMN phone TYPE varchar(30);");
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
