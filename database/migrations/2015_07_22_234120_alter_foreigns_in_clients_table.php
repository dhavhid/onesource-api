<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AlterForeignsInClientsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('clients', function(Blueprint $table)
		{
			DB::statement("ALTER TABLE clients ALTER COLUMN region_id DROP NOT NULL;");
			DB::statement("ALTER TABLE clients ALTER COLUMN referral_source_id DROP NOT NULL;");
            DB::statement("ALTER TABLE clients ALTER COLUMN attorney_id DROP NOT NULL;");
            DB::statement("ALTER TABLE clients ALTER COLUMN is_doctor_mpn SET DEFAULT 1;");
            DB::statement("ALTER TABLE clients ALTER COLUMN patient_treating SET DEFAULT 1;");
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
