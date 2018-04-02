<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateClientsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('clients', function(Blueprint $table)
		{
			$table->increments('id');
            $table->date('date_of_referral');
            $table->date('date_received');
            $table->string('case_type',250);
            $table->string('firstname',250);
            $table->string('lastname',250);
            $table->date('dob');
            $table->string('ssn',80);
            $table->string('phone',20);
            $table->string('phone_ext',20)->nullable();
            $table->string('alt_phone',20)->nullable();
            $table->string('address',250);
            $table->string('address1',250)->nullable();
            $table->string('address2',250)->nullable();
            $table->string('city',250);
            $table->integer('region_id');
            $table->foreign('region_id')->references('id')->on('regions');
            $table->string('zipcode',5);
            $table->date('doi');
            $table->text('body_parts');
            $table->text('other_ibp')->nullable();
            $table->integer('insurance_company_id')->nullable();
            $table->foreign('insurance_company_id')->references('id')->on('requesting_offices');
            $table->tinyInteger('is_doctor_mpn')->defaults(0);
            $table->string('employer_name',250)->nullable();
            $table->integer('referral_source_id');
            $table->foreign('referral_source_id')->references('id')->on('requesting_offices');
            $table->integer('attorney_id');
            $table->foreign('attorney_id')->references('id')->on('attorneys_doctors');
            $table->text('attorney_notes')->nullable();
            $table->integer('clinic_id')->nullable();
            $table->foreign('clinic_id')->references('id')->on('requesting_offices');
            $table->integer('doctor_id')->nullable();
            $table->foreign('doctor_id')->references('id')->on('attorneys_doctors');
            $table->string('scheduled_with',250)->nullable();
            $table->dateTime('appt_date')->nullable();
            $table->integer('appt_confirmed_id')->nullable();
            $table->foreign('appt_confirmed_id')->references('id')->on('reasons');
            $table->integer('appt_reason_cancel_id')->nullable();
            $table->foreign('appt_reason_cancel_id')->references('id')->on('reasons');
            $table->date('date_moved')->nullable();
            $table->text('clinic_notes')->nullable();
            $table->tinyInteger('patient_treating')->defaults(0);
            $table->string('next_appt')->nullable();
            $table->string('verified_with')->nullable();
            $table->date('first_seen')->nullable();
            $table->index('firstname');
            $table->index('lastname');
            $table->index(['firstname','lastname']);
            $table->index('ssn');
            $table->index('case_type');
            $table->index('city');
            $table->index('zipcode');
            $table->index('insurance_company_id');
            $table->index('referral_source_id');
            $table->index('attorney_id');
            $table->index('clinic_id');
            $table->index('doctor_id');
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
		Schema::drop('clients');
	}

}
