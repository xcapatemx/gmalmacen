@extends('app')
@section('content')
<div class="container">
	<div class="row">
		<div class="col-sm-8 blog-main">
			<div class="panel panel-default">
				<div class="panel-heading text-center">
					Detalles de producto {{$producto->sku}}
				</div>
				<div class="panel-body">
					<div>
						<h2>{{$producto->nombre}}</h2>
					</div>
					<div>
						{{$producto->descripcion}}
					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-3 col-sm-offset-1 blog-sidebar">
		    <div class="sidebar-module sidebar-module-inset">
    	    	<h4>Operaciones</h4>
       			<ul>
       			<li><a href="/producto">Volver a Catalogo</a></li>
	       			<li><a href="/producto/{{$producto->id}}/edit">Editar</a></li>

       				<li><a href="#">Eliminar</a></li>       			
       			</ul>
    		</div>
    	</div><!-- /.sidebar -->
	</div>
</div>
@endsection