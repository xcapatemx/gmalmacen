<?php namespace App;

use Illuminate\Database\Eloquent\Model;
class MovimientoVM extends Model {
	public $almacen;
	public $almacenes;
	public $tiposmovimiento;
	public function __construct($almacen,$almacenes,$tiposmovimiento){
		$this->almacen=$almacen;
		$this->almacenes=$almacenes;
		$this->tiposmovimiento=$tiposmovimiento;
	}	


}
