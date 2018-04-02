<?php namespace OneSource;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Region extends Model {

    use SoftDeletes;

	protected $table = 'regions';
    public $fillable = ['name','abbr'];
    protected $hidden = ['created_at','updated_at'];
    public $fields = ['name'=>0,'abbr'=>1];

    protected $dates = ['deleted_at'];
}
