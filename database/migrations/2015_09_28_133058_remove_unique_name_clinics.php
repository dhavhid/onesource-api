<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class RemoveUniqueNameClinics extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('requesting_offices', function(Blueprint $table)
		{
			$table->dropUnique('requesting_offices_name_unique');
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
			$table->unique('name');
		});
	}

}
