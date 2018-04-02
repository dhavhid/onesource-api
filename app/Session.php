<?php namespace OneSource;

use Illuminate\Database\Eloquent\Model;

class Session extends Model {

	protected $table = 'sessions';
    public $fillable = ['start_time','end_time','ip','is_closed'];
    protected $hidden = ['user_id','created_at','updated_at'];
    public $fields = ['start_time'=>0,'end_time'=>1,'ip'=>2,'is_closed'=>3];
}
