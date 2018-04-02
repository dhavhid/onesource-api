<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAttorneysDoctorsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('attorneys_doctors', function(Blueprint $table)
		{
			$table->increments('id');
            $table->string('name',250);
            $table->string('phone',20);
            $table->string('fax',20)->nullable();
            $table->string('email',250)->nullable();
            $table->tinyInteger('is_attorney')->default(1);
            $table->integer('requesting_office_id')->unsigned()->nullable();
            $table->foreign('requesting_office_id')->references('id')->on('requesting_offices');
            $table->index('name');
            $table->index('phone');
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
		Schema::drop('attorneys_doctors');
	}

}
