<?php namespace OneSource;

use Illuminate\Database\Eloquent\Model;

class BodyPart extends Model {

	protected $table = 'bodyparts';
    public $fillable = ['name'];
    protected $hidden = ['created_at','updated_at'];
    public $fields = ['name'=>0];
}
