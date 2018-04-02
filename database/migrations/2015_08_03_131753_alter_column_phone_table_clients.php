<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AlterColumnPhoneTableClients extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('clients', function(Blueprint $table)
		{
			DB::statement("ALTER TABLE clients ALTER COLUMN phone TYPE VARCHAR(30);");
			DB::statement("ALTER TABLE clients ALTER COLUMN alt_phone TYPE VARCHAR(30);");
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
