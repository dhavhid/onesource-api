<?php namespace OneSource;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Reason extends Model {

    use SoftDeletes;

	protected $table = 'reasons';
    public $fillable = ['name','is_confirmation'];
    protected $hidden = ['created_at','updated_at','is_confirmation'];
    public $fields = ['name'=>0,'is_confirmation'=>1];

    protected $dates = ['deleted_at'];
}
