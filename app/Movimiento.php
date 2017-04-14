<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class Movimiento extends Model {

	/**
	 * The database table used by the model.
	 *
	 * @var string
	 */
	protected $table = 'movimiento';

	/**
	 * The attributes that are mass assignable.
	 *
	 * @var array
	 */
	protected $fillable = ['comentarios', 'cantidad'];


}
