<?php namespace OneSource;

use Illuminate\Database\Eloquent\Model;

class ClinicShell extends Model {

    protected $table = 'requesting_offices';
    public $fillable = ['name','address1','address2','city','zipcode','phone','fax','contact','email','alt_phone','notes','county','is_lawoffice','is_insurance','is_clinic'];

}
