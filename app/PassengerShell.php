<?php namespace OneSource;

use Illuminate\Database\Eloquent\Model;

class PassengerShell extends Model {

    protected $table = 'passengers';
    public $fillable = ['name','dob','phone','phone_ext','address','ibp','appt_date','client_id'];

}
