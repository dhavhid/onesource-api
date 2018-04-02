<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddLoginInfoToInsurances extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('requesting_offices', function(Blueprint $table)
		{
			$table->string('insurance_url',255)->nullable();
			$table->string('insurance_login',255)->nullable();
            $table->string('insurance_pass',255)->nullable();
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
			$table->dropColumn('insurance_url');
            $table->dropColumn('insurance_login');
            $table->dropColumn('insurance_pass');
		});
	}

}
