<?php namespace OneSource;

use Illuminate\Database\Eloquent\Model;

class LawOfficeShell extends Model {

    protected $table = 'requesting_offices';
    public $fillable = [
        'name',
        'address1',
        'address2',
        'city',
        'zipcode',
        'phone',
        'fax',
        'contact',
        'email',
        'alt_phone',
        'notes',
        'is_lawoffice',
        'is_insurance',
        'is_clinic'
    ];

}
