<?php namespace OneSource;

use Illuminate\Database\Eloquent\Model;

class ClientShell extends Model {

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
        'region_id',
        'insurance_company_id',
        'insurance_notes',
        'referral_source_id',
        'attorney_id',
        'clinic_id',
        'doctor_id',
        'appt_confirmed_id',
        'appt_reason_cancel_id',
        'created_by',
        'updated_by'
    ];

}
