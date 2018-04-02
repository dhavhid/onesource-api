<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AlterColumnApptDate extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('clients', function(Blueprint $table)
		{
			DB::statement("ALTER TABLE clients ALTER COLUMN appt_date TYPE TIMESTAMP;");
			DB::statement("ALTER TABLE clients ALTER COLUMN date_moved TYPE TIMESTAMP;");
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('clients', function(Blueprint $table)
		{
			//
		});
	}

}
