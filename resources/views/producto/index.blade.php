@extends('app')

@section('content')
	<div class="container">
      	<div class="blog-header">
        	<h1 class="blog-title">Grupo Mas | Cat&aacute;logo de productos</h1>
        	<p class="lead blog-description">Listado de productos registrados</p>
      	</div>
	    <div class="row">
	        <div class="col-sm-8 blog-main">
		        <div class="panel panel-default">
					<div class="panel-heading">Click en el producto para detalles y operaciones</div>
					<div class="panel-body">
						<ul>
						@forelse($productos as $producto)
							<li><a href="/producto/{{$producto->id}}">{{$producto->nombre}}</a></li>
						@empty
							<li>No existen productos registrados!</li>
						@endforelse
						</ul>
					</div>
				</div>
	        	<nav>
	    	        <ul class="pager">
	    	        
        		    	<li>{!! $productos->render() !!}</li>
        	    	</ul>
          		</nav>
        	</div>
	        <div class="col-sm-3 col-sm-offset-1 blog-sidebar">
		        <div class="sidebar-module sidebar-module-inset">
        		    <h4>Operaciones</h4>
            		<ul>
            			<li><a href="/producto/create">Nuevo Producto</a></li>
            		</ul>
          		</div>
          		
        	</div><!-- /.sidebar -->
	    </div><!-- /.row -->
    </div><!-- /.container -->
@endsection
