<?php namespace OneSource;

use Illuminate\Database\Eloquent\Model;

class City extends Model {

	public $table = 'cities';
    public $fillable = ['name','county_id'];

}
