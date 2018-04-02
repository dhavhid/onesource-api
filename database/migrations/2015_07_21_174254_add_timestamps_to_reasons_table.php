<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddTimestampsToReasonsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('reasons', function(Blueprint $table)
		{
			$table->dateTime('created_at')->default('2015-07-20 00:00:00');
			$table->dateTime('updated_at')->default('2015-07-20 00:00:00');
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('reasons', function(Blueprint $table)
		{
			//
		});
	}

}
