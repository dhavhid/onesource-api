<?php namespace OneSource;

use Illuminate\Database\Eloquent\Model;

class Rol extends Model {

	protected $table = 'roles';
    public $fillable = ['name','write'];
    protected $hidden = ['user_id','created_at','updated_at'];
    public $fields = ['name'=>0,'write'=>1];
}
