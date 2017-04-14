@extends('app')
@section('content')
<div class="container">
	<div class="row">
		<div class="col-sm-8 blog-main">
			<div class="panel panel-default">
				<div class="panel-heading">Tipos de movimiento registrados</div>
				<div class="panel-body">
					<ul>
					@forelse($tiposmovimientos as $tipomovimiento)
						<li>{{$tipomovimiento->nombre}} | {{ $tipomovimiento->descripcion}}</li>
					@empty
						<li>No existen tipos de movimiento registrados!</li>
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
	       		<li><a href="/tipomovimiento/create">Crear Tipo de Movimiento</a></li>
      			</ul>
    		</div>
    	</div><!-- /.sidebar -->
	</div>
</div>
@endsection