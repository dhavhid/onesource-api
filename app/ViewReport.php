<?php namespace OneSource;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class ViewReport extends Model {

	protected $table = 'view_reports';
    public $fillable = [
        'date_of_referral',
        'id',
        'date_received',
        'case_type',
        'firstname',
        'lastname',
        'dob',
        'ssn',
        'phone',
        'phone_ext',
        'alt_phone',
        'address',
        'address1',
        'address2',
        'city',
        'zipcode',
        'doi',
        'body_parts',
        'other_ibp',
        'is_doctor_mpn',
        'employer_name',
        'attorney_notes',
        'scheduled_with',
        'appt_date',
        'date_moved',
        'clinic_notes',
        'patient_treating',
        'next_appt',
        'verified_with',
        'first_seen',
        'created_at',
        'updated_at',
        'created_by',
        'updated_by',
        'appt_reason_cancel_id',
        'appt_confirmed_id',
        'referral_source_id',
        'clinic_id',
        'insurance_company_id',
        'attorney_id',
        'doctor_id',
        'clinic_name',
        'clinic_address1',
        'clinic_address2',
        'clinic_city',
        'doctor_name',
        'attorney_name',
        'lawoffice_name',
        'insurance_name',
        'confirmed',
        'cancelled',
        'createdBy',
        'updatedBy'
    ];

    public $field_type = [
        'id'=>'string',
        'date_of_referral'=>'date',
        'date_received'=>'date',
        'case_type'=>'string',
        'firstname'=>'string',
        'lastname'=>'string',
        'dob'=>'date',
        'ssn'=>'string',
        'phone'=>'string',
        'phone_ext'=>'string',
        'alt_phone'=>'string',
        'address'=>'string',
        'address1'=>'string',
        'address2'=>'string',
        'city'=>'string',
        'zipcode'=>'string',
        'doi'=>'string',
        'body_parts'=>'string',
        'other_ibp'=>'string',
        'is_doctor_mpn'=>'string',
        'employer_name'=>'string',
        'attorney_notes'=>'string',
        'scheduled_with'=>'string',
        'appt_date'=>'date',
        'date_moved'=>'date',
        'clinic_notes'=>'string',
        'patient_treating'=>'string',
        'next_appt'=>'string',
        'verified_with'=>'string',
        'first_seen'=>'date',
        'created_at'=>'date',
        'updated_at'=>'date',
        'appt_reason_cancel_id'=>'select',
        'appt_confirmed_id'=>'select',
        'referral_source_id'=>'select',
        'clinic_id'=>'select',
        'insurance_company_id'=>'select',
        'attorney_id'=>'select',
        'doctor_id'=>'select',
        'clinic_name'=>'select',
        'clinic_address1'=>'string',
        'clinic_address2'=>'string',
        'clinic_city'=>'string',
        'doctor_name'=>'select',
        'attorney_name'=>'select',
        'lawoffice_name'=>'select',
        'insurance_name'=>'select',
        'confirmed'=>'select',
        'cancelled'=>'select',
        'created_by'=>'select',
        'updated_by'=>'select'
    ];

    public $field_date_format = [
        'date_of_referral'=>'m-d-Y',
        'date_received'=>'m-d-Y',
        'dob'=>'m-d-Y',
        'appt_date'=>'m-d-Y H:m',
        'date_moved'=>'m-d-Y',
        'first_seen'=>'m-d-Y',
        'created_at'=>'m-d-Y H:m',
        'updated_at'=>'m-d-Y H:m',
    ];

    public $default_fields_for_search = [
        "date_of_referral" => "Date of Case",
        "id" => "Record ID#",
        "firstname" => "First Name",
        "lastname" => "Last Name",
        "dob" => "Date of Birth",
        "clinic_name" => "Clinic",
        "doctor_name" => "Dr. Scheduled with:",
        "appt_date" => "Appt. Date",
        "attorney_name" => "Attorney Name",
        "updatedBy" => "Last Updated By"
    ];

    public $grouping_date_fields = [
        'date_of_referral'=>'date',
        'date_received'=>'date',
        'appt_date'=>'date',
        'date_moved'=>'date',
        'next_appt'=>'date'
    ];

    public function getDateOfReferralAttribute($date_of_referral)
    {
        return $date_of_referral . 'T00:00:00';
    }

    public function getDateReceivedAttribute($date_received)
    {
        return $date_received . 'T00:00:00';
    }

    public function getDobAttribute($dob)
    {
        return $dob . 'T00:00:00';
    }


    public function getApptDateAttribute($appt_date)
    {
        if (!isset($appt_date)) {
            return null;
        } else {
            return str_replace(' ','T',$appt_date);
        }
    }

    public function getDateMovedAttribute($date_moved)
    {
        if (!isset($date_moved) || strlen(chop($date_moved)) < 6) {
            return null;
        } else {
            return str_replace(' ','T',$date_moved);
        }
    }


    public function getFirstSeenAttribute($first_seen)
    {
        if (!isset($first_seen)) {
            return null;
        } else {
            return $first_seen . 'T00:00:00';
        }
    }

    public function getCreatedAtAttribute($created_at)
    {
        return str_replace(' ','T',$created_at);
    }

    public function getUpdatedAtAttribute($updated_at)
    {
        return str_replace(' ','T',$updated_at);
    }
}
