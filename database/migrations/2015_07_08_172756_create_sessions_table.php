<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateSessionsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('sessions', function(Blueprint $table)
		{
			$table->increments('id');
            $table->timestamp('start_time');
            $table->timestamp('end_time');
            $table->string('ip',32);
            $table->tinyInteger('is_closed')->default(0);
            $table->integer('user_id');
            $table->foreign('user_id')->references('id')->on('users');
            $table->index('start_time');
            $table->index('end_time');
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
		Schema::drop('sessions');
	}

}
