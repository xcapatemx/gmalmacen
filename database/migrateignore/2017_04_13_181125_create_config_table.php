<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateConfigTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('Config', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('idAlmacen')->unsigned();
			$table->foreign('idAlmacen')->references('id')->on('almacen');
			$table->integer('idProducto')->unsigned();
			$table->foreign('idProducto')->references('id')->on('producto');
			$table->integer('maxStock');
			$table->integer('minStock');
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
		Schema::drop('Config');
	}

}
