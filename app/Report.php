<?php namespace OneSource;

use Illuminate\Database\Eloquent\Model;

class Report extends Model {

	protected $table = 'reports';

    public $fillable = ['owner','name','options','access'];
    protected $hidden = ['created_at','updated_at'];

}
