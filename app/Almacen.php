<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class Almacen extends Model {

	/**
	 * The database table used by the model.
	 *
	 * @var string
	 */
	protected $table = 'almacen';

	/**
	 * The attributes that are mass assignable.
	 *
	 * @var array
	 */
	protected $fillable = ['nombre', 'direccion'];


}
