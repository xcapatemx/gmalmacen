<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateExistenciaTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('existencia', function(Blueprint $table)
		{
			$table->integer('idProducto')->primary()->unsigned();
			$table->foreign('idProducto')->references('id')->on('producto');
			$table->integer('idAlmacen')->primary()->unsigned();
			$table->foreign('idAlmacen')->references('id')->on('almacen');
			$table->integer('cantidad');
			$table->text('observaciones');
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
		Schema::drop('existencia');
	}

}
