@extends('app')
@section('content')
<div class="container">
	<div class="row">
		<div class="col-sm-8 blog-main">
			<div class="panel panel-default">
				<div class="panel-heading">{{$almacenvm->almacen->nombre}}</div>
				<div class="panel-body">
					<div>
						Direcci&oacute;n:{{$almacenvm->almacen->direccion}}
					</div>
					<div>Existencia en almacen</div>
					<table class="table">
						<tr>
							<td>
								Sku
							</td>
							<td>
								Producto
							</td>
							<td>
								Existencia
							</td>
							<td>
								Status
							</td>
						</tr>
						@forelse($almacenvm->existencia as $existencia)
							<tr>
								<td>
									{{$existencia->sku}}
								</td>
								<td>
								{{ $existencia->nombre }}
								</td>
								<td>
								{{$existencia->cantidad}}
								</td>
								<td>
								@if($existencia->cantidad>=5)
									Con Stock
								@else
									Falta Stock
								@endif
								</td>
							</tr>
						@empty
						<tr>
							<td colspan="2">
								No existen productos en este almacen
							</td>
						</tr>
						@endforelse
					</table>
					<nav>
	    	        <ul class="pager">
	    	        
        		    	<li>{!! $almacenvm->existencia->render() !!}</li>
        	    	</ul>
          			</nav>
				</div>
			</div>
		</div>
		<div class="col-sm-3 col-sm-offset-1 blog-sidebar">
		    <div class="sidebar-module sidebar-module-inset">
    	    	<h4>Movimientos</h4>
       			<ul>
       			<li><a href="/">Inicio</a></li>
	       		<li><a href="/movimiento/create/{{$almacenvm->almacen->id}}">Generar Movimiento</a></li>						
				<li><a href="/movimiento/{{$almacenvm->almacen->id}}">Historial de movimientos</a></li>						
				
      			</ul>
    		</div>
    	</div><!-- /.sidebar -->
	</div>
</div>
@endsection