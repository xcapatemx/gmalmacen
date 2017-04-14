@extends('app')

@section('content')
<div class="container">
	<div class="row">
		<div class="col-sm-8 blog-main">
			<div class="panel panel-default">
				<div class="panel-heading"><h1>Almacenes registrados</h1></div>
				<div class="panel-body">
					<ul class="list-group">
					@forelse($almacenes as $almacen)
						<li class="list-group-item"><a href="almacen/{{$almacen->id}}">{{$almacen->nombre}}</a></li>
					@empty
						<li>No existen almacenes registrados!</li>
					@endforelse
					</ul>
				</div>
			</div>
		</div>
		<div class="col-sm-3 col-sm-offset-1 blog-sidebar">
		    <div class="sidebar-module sidebar-module-inset">
    	    	<h4>Operaciones</h4>
       			<ul>
       			<li><a href="/">Inicio</a></li>
	       		<li><a href="/tipomovimiento">Catalogo de Movimienos</a></li>						
				<li><a href="/producto">Catalogo de Productos</a></li>						
				<li><a href="/almacen/create">Nuevo Almacen</a></li>
      			</ul>
    		</div>
    	</div><!-- /.sidebar -->
	</div>
</div>
@endsection
