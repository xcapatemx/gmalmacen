<?php namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Producto;
use Illuminate\Http\Request;

class ProductoController extends Controller {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		//
		$productos=Producto::paginate(10);
		return view('producto.index',compact('productos'));
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
		//
		return view('producto.crear');
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store(Request $request)
	{
		//
		Producto::create($request->all());
		return redirect('/producto');
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
		$producto=Producto::findOrFail($id);
		return view('producto.detail',compact('producto'));

	}
	/**
	 *Search for pattern in database
	 *used for async call
	 *
	 *@param string $param
	**/
	public function findproduct($param)
	{
		$productos=Producto::where('sku', 'like', '%'.$param.'%')->orWhere('nombre', 'like', '%'.$param.'%')->get();
		return response()->json($productos);
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
		$producto=Producto::findOrFail($id);
		return view('producto.edit',compact('producto'));
		
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update(Request $request, $id)
	{
		//
		$producto=Producto::findOrFail($id);
		 $producto->update($request->all());
		 return redirect('/producto');
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
