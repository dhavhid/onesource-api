<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePassengersTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('passengers', function(Blueprint $table)
		{
			$table->increments('id');
            $table->string('name',250);
            $table->date('dob')->nullable();
            $table->string('phone',20)->nullable();
            $table->string('phone_ext',20)->nullable();
            $table->string('address',250)->nullable();
            $table->text('ibp')->nullable();
            $table->dateTime('appt_date')->nullable();
            $table->integer('client_id');
            $table->foreign('client_id')->references('id')->on('clients');
            $table->index('name');
            $table->index('client_id');
			$table->timestamps();
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('passengers');
	}

}
