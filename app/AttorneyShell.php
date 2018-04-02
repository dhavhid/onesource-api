<?php namespace OneSource;

use Illuminate\Database\Eloquent\Model;

class AttorneyShell extends Model {

    protected $table = 'attorneys_doctors';
    public $fillable = ['name','phone','fax','email','is_attorney','requesting_office_id'];

}
