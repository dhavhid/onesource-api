<?php namespace OneSource;

use Illuminate\Database\Eloquent\Model;

class Activity extends Model {

	protected $table = 'logs';
    public $fillable = ['user_id','action','entity','entity_id'];
    protected $hidden = ['created_at','updated_at'];
    public $fields = ['user_id','action'=>0,'entity'=>1,'entity_id'=>2];

}
