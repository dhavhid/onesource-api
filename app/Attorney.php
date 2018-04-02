<?php namespace OneSource;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Attorney extends Model {

    use SoftDeletes;
    protected $dates = ['deleted_at'];

	protected $table = 'attorneys_doctors';
    public $fillable = ['name','phone','fax','email'];
    protected $hidden = ['is_attorney','requesting_office_id','created_at','updated_at'];
    public $fields = ['name'=>0,'phone'=>1,'fax'=>2,'email'=>3];

}
