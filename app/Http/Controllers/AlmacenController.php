<?php namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Almacen;
use App\Producto;
use App\Existencia;
use Illuminate\Http\Request;
use App\AlmacenVM;
class AlmacenController extends Controller {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		//
		$almacenes=Almacen::all();
		return view("home",compact('almacenes'));
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
		return view('almacen.create');
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store(Request $request)
	{
		//
		Almacen::create($request->all());
        return redirect('/almacen');
	}

	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		//
		$almacen=Almacen::findOrFail($id);
		$productos=Existencia::where('idAlmacen', '=' ,$id)->join('Producto','Existencia.idProducto','=','Producto.id')->paginate(10);
		$almacenvm=new AlmacenVM($almacen,$productos);
		return view('almacen.detalle',compact('almacenvm'));
	}

	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		//
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{
		//
	}

	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		//
	}

}
