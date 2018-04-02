<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateLogsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('logs', function(Blueprint $table)
		{
			$table->increments('id');
            $table->string('action',250);
            $table->string('entity',100);
            $table->integer('entity_id');
            $table->integer('user_id');
            $table->foreign('user_id')->references('id')->on('users');
            $table->index('action');
            $table->index(['entity','entity_id']);
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
		Schema::drop('logs');
	}

}
