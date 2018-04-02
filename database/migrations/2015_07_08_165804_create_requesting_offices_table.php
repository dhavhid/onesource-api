<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateRequestingOfficesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('requesting_offices', function(Blueprint $table)
		{
			$table->increments('id');
            $table->string('name',250)->unique();
            $table->string('address1',250);
            $table->string('address2',250)->nullable();
            $table->string('city',250);
            $table->string('zipcode',5);
            $table->string('phone',20);
            $table->string('fax',20)->nullable();
            $table->string('contact',250);
            $table->string('email',250)->nullable();
            $table->string('alt_phone',20)->nullable();
            $table->text('notes')->nullable();
            $table->tinyInteger('is_lawoffice')->default(1);
            $table->index('name');
            $table->index('address1');
            $table->index('city');
            $table->index('zipcode');
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
		Schema::drop('requesting_offices');
	}

}
