<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class Existencia extends Model {

	//
	protected $table = 'existencia';

	/**
	 * The attributes that are mass assignable.
	 *
	 * @var array
	 */
	protected $fillable = ['existencia', 'observaciones'];


}
