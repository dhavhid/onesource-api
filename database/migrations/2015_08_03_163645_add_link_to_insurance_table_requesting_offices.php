<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddLinkToInsuranceTableRequestingOffices extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('requesting_offices', function(Blueprint $table)
		{
			$table->string('link',250)->nullable();
			$table->string('username',100)->nullable();
			$table->string('pass',100)->nullable();
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
			$table->dropColumn('link');
            $table->dropColumn('username');
            $table->dropColumn('pass');
		});
	}

}
