<?php namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Almacen;
use App\Movimiento;
use App\TipoMovimiento;
use App\MovimientoVM;
use Illuminate\Http\Request;
use DB;
class MovimientoController extends Controller {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create($id)
	{
		//
		$almacen=Almacen::findOrFail($id);
		$almacenes=Almacen::where('id','!=',$almacen->id)->get();
		$tiposmovimiento=TipoMovimiento::all();
		$movimientovm =new MovimientoVM($almacen,$almacenes,$tiposmovimiento);
		
		return view('movimiento.crear',compact('movimientovm'));
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store(Request $request)
	{
		$result=DB::select('CALL movimiento_almacen(:idalmacen, :almacendestino, :cantidad, :idmovimiento, :idproducto, :idusuario, :comentario, @completado, @codestatus);',
    		array(
        		$request->id_almacen,
        		$request->almacen_destino,
        		$request->cantidad,
        		$request->id_movimiento,
        		$request->id_producto,
        		$request->id_usuario,
        		$request->comentario
    		)
		);
		return response()->json(['message' => $result[0]->completado, 'codestatus' => $result[0]->codestatus]);
		
		
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
		//
		$movimientos=Movimiento::where('idalmacen','=',$id)->join('producto','movimiento.idProducto','=','producto.id')->join('almacen','movimiento.idAlmacen','=','almacen.id')->select('movimiento.created_at','producto.nombre','movimiento.cantidad','movimiento.comentario','almacen.nombre as nombre_almacen')->orderBy('movimiento.created_at', 'DESC')->paginate(10);
		return view('movimiento.detalle',compact('movimientos'));
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
