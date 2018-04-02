<?php namespace OneSource;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class Client extends Model {

	protected $table = 'clients';
    public $fillable = [
        'date_of_referral', // not null
        'date_received', // not null
        'case_type', // not null
        'firstname', // not null
        'lastname', // not null
        'dob', // not null
        'ssn', // not null
        'phone', // not null
        'phone_ext',
        'alt_phone',
        'address', // not null
        'address1',
        'address2',
        'city', // not null
        'zipcode', // not null
        'doi', // not null
        'body_parts', // not null
        'other_ibp',
        'is_doctor_mpn', // not null
        'employer_name',
        'attorney_notes',
        'scheduled_with',
        'appt_date',
        'date_moved',
        'clinic_notes',
        'patient_treating', // not null
        'next_appt',
        'verified_with',
        'first_seen',
        'created_at',
        'updated_at',
        'created_by',
        'updated_by'
    ];
    protected $hidden = [
        'region_id',
        'insurance_company_id',
        'referral_source_id',
        'attorney_id',
        'clinic_id',
        'doctor_id',
        'appt_confirmed_id',
        'appt_reason_cancel_id'/*,
        'created_by',
        'updated_by'*/
    ];
    public $fields = [
        'date_of_referral' => 'Date of Case', // not null
        'date_received' => 'Date Received', // not null
        'case_type' => 'Case Type', // not null
        'firstname' => 'Firstname', // not null
        'lastname' => 'Lastname', // not null
        'dob' => 'DOB', // not null
        'ssn' => 'SSN', // not null
        'phone' => 'Phone', // not null
        'phone_ext' => 'Phone Extension',
        'alt_phone' => 'Alternative Phone',
        'address' => 'Address', // not null
        'address1' => 'Address Extension 1',
        'address2' => 'Address Extension 2',
        'city' => 'City', // not null
        'zipcode' => 'Zipcode', // not null
        'doi' => 'DOI', // not null
        'body_parts' => 'Body Parts', // not null
        'other_ibp' => 'Other Body Parts',
        'is_doctor_mpn' => 'Doctor MPN', // not null
        'employer_name' => 'Employer Name',
        'attorney_notes' => 'Attorney notes',
        'scheduled_with' => 'Scheduled with',
        'appt_date' => 'Appointment date',
        'date_moved' => 'Date moved',
        'clinic_notes' => 'Clinic notes',
        'patient_treating' => 'Patient treating', // not null
        'next_appt' => 'Next Appointment',
        'verified_with' => 'Verified with',
        'first_seen' => 'Firs seen by Dr.'
    ];

    public $fields_for_search = [
        "date_of_referral" => "Date of Case",
        "id" => "Record ID#",
        "date_received" => "Date Received",
        "case_type" => "Case Type",
        "firstname" => "First Name",
        "lastname" => "Last Name",
        "dob" => "Date of Birth",
        "ssn" => "SSN",
        "phone" => "Phone Number",
        "address" => "Address",
        "address1" => "Address Extension 1",
        "address2" => "Address Extension 2",
        "city" => "City",
        "zipcode" => "Zipcode",
        "doi" => "Date of Injury",
        "body_parts" => "Injured Body Parts",
        "appt_date" => "Appt. Date",
        "date_moved" => "Date Moved",
        "next_appt" => "Next Appt. Date",
        "first_seen" => "First Seen",
        "patient_treating" => "Patient Treating",
        "clinic_name" => "Clinic",
        "is_doctor_mpn" => "is Doctor MPN",
        "doctor_name" => "Dr. Scheduled with:",
        "attorney_name" => "Attorney Name",
        "lawoffice_name" => "Law Office",
        "confirmed" => "Reason to confirm",
        "cancelled" => "Reason to cancel",
        "created_by" => "Created By",
        "updated_by" => "Last Updated By"
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
