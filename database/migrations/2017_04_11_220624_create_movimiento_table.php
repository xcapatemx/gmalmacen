<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMovimientoTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('movimiento', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('idMovimiento')->unsigned();
			$table->foreign('idMovimiento')->references('id')->on('tipoMovimiento');
			$table->integer('idAlmacen')->unsigned();
			$table->foreign('idAlmacen')->references('id')->on('almacen');
			$table->integer('idProducto')->unsigned();
			$table->foreign('idProducto')->references('id')->on('producto');
			$table->integer('idUsuario')->unsigned();
			$table->foreign('idUsuario')->references('id')->on('users');
			$table->integer('cantidad');
			$table->text('comentario');
			$table->timestamps();
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('movimiento');
	}

}
