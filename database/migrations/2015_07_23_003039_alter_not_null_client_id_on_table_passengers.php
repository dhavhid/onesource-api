<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AlterNotNullClientIdOnTablePassengers extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('passengers', function(Blueprint $table)
		{
			DB::statement("ALTER TABLE passengers ALTER COLUMN client_id DROP NOT NULL;");
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
