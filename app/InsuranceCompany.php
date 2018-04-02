<?php namespace OneSource;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class InsuranceCompany extends Model {

    use SoftDeletes;
    protected $dates = ['deleted_at'];

    protected $table = 'requesting_offices';
    public $fillable = ['name','address1','address2','city','zipcode','phone','fax','contact','email','alt_phone','notes','insurance_url','insurance_login','insurance_pass'];
    protected $hidden = ['is_lawoffice','is_insurance','is_clinic','created_at','updated_at'];
    public $fields = ['name'=>0,'address1'=>1,'address2'=>2,'city'=>3,'zipcode'=>4,'phone'=>5,'fax'=>6,'contact'=>7,'email'=>8,'alt_phone'=>9,'notes'=>10,'insurance_url'=>11,'insurance_login'=>12,'insurance_pass'=>13];

}
