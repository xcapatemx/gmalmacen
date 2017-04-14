@extends('app')
@section('content')
<div class="container">
	<div class="row">
		<div class="col-sm-8 blog-main">
			<div class="panel panel-default">
				<div class="panel-heading">Historial de movimientos de {{$movimientos[0]->nombre_almacen}}</div>
				<div class="panel-body">
					
					
					<table class="table">
						<tr>
							<td>
								Fecha
							</td>
							<td>
								Producto
							</td>
							<td>
								Cantidad
							</td>
							<td>
								Comentario
							</td>
						</tr>
						@forelse($movimientos as $movimiento)
							<tr>
								<td>
									{{$movimiento->created_at}}
								</td>
								<td>
								{{ $movimiento->nombre }}
								</td>
								<td>
								{{$movimiento->cantidad}}
								</td>
								<td>
								{{$movimiento->comentario}}
								</td>
							</tr>
						@empty
						<tr>
							<td colspan="2">
								No existen movimientos en este almacen
							</td>
						</tr>
						@endforelse
					</table>
					<nav>
	    	        <ul class="pager">
	    	        
        		    	<li>{!! $movimientos->render() !!}</li>
        	    	</ul>
          			</nav>
				</div>
			</div>
		</div>
		<div class="col-sm-3 col-sm-offset-1 blog-sidebar">
		    <div class="sidebar-module sidebar-module-inset">
    	    	<h4>Que sigue?</h4>
       			<ul>
       			<li><a href="/">Inicio</a></li>
	    		</ul>
    		</div>
    	</div><!-- /.sidebar -->
	</div>
</div>
@endsection