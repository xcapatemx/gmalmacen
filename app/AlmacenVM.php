<?php namespace App;

use Illuminate\Database\Eloquent\Model;
class AlmacenVM extends Model {
	public $almacen;
	public $existencia;
	public function __construct($almacen,$existencia){
		$this->almacen=$almacen;
		$this->existencia=$existencia;
	}	


}
