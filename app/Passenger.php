<?php namespace OneSource;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class Passenger extends Model {

	protected $table = 'passengers';
    public $fillable = ['name','dob','phone','phone_ext','address','ibp','appt_date'];
    protected $hidden = ['client_id','created_at','updated_at'];
    public $fields = ['name'=>0,'dob'=>1,'phone'=>2,'phone_ext'=>3,'address'=>4,'ibp'=>5,'appt_date'=>6];

    public function getDobAttribute($dob)
    {
        return Carbon::createFromFormat('Y-m-d',$dob)->toIso8601String();
    }

    public function getApptDateAttribute($appt_date)
    {
        if (!isset($appt_date)) {
            return null;
        } else {
            return Carbon::createFromFormat('Y-m-d G:i:s',$appt_date)->toIso8601String();
        }
    }
}
