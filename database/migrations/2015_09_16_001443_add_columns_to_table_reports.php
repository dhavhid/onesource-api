<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddColumnsToTableReports extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('reports', function(Blueprint $table)
		{
			//
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('reports', function(Blueprint $table)
		{
            DB::statement("ALTER TABLE reports ADD COLUMN name VARCHAR(250);");
            DB::statement("ALTER TABLE reports ADD COLUMN options JSONB;");
            DB::statement("ALTER TABLE reports ADD COLUMN access INTEGER[];");
		});
	}

}
