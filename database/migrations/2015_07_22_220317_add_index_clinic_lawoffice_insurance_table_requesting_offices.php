<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddIndexClinicLawofficeInsuranceTableRequestingOffices extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('requesting_offices', function(Blueprint $table)
		{
			$table->index('is_lawoffice');
			$table->index('is_insurance');
			$table->index('is_clinic');
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
