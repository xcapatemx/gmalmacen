<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class TipoMovimiento extends Model {

	/**
	 * The database table used by the model.
	 *
	 * @var string
	 */
	protected $table = 'tipomovimiento';

	/**
	 * The attributes that are mass assignable.
	 *
	 * @var array
	 */
	protected $fillable = ['nombre', 'descripcion'];


}
