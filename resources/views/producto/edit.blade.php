@extends('app')
@section('content')
<div class="row">
	<div class="col-md-6 col-md-offset-3">
		<div class="panel panel-default">
			<div class="panel-heading text-center">
				Editar producto 
			</div>
			<div class="panel-body">
 
				{!! Form::model($producto, array('route' => array('producto.update', $producto->id),'method'=>'put' )) !!}

				
					<input type="hidden" name="_token" value="{{ csrf_token() }}">
					<input type="hidden" name="id" value="{{ $producto->id }}">
					<div class="form-group">
						<label for="sku">Sku</label>
						<input type="text" name="sku" placeholder="Sku" class="form-control" value="{{$producto->sku}}"> 
  						@if ($errors->has('sku'))
  						{!!$errors->first('sku')!!}
  						@endif

						<label for="Nombre">Nombre</label>
						<input type="text" name="nombre" placeholder="Nombre" class="form-control" value="{{$producto->nombre}}"> 
  						@if ($errors->has('nombre'))
  						{!!$errors->first('nombre')!!}
  						@endif
						
						<label for="descripcion">Descripci&oacute;n</label>
						<textarea name="descripcion" id="descripcion" class="form-control">{{$producto->descripcion}}</textarea>
					</div>
					
					<input type="submit" value="Guardar" name="" class="btn btn-success pull-right">

				{!! Form::close() !!}

				
			</div>
		</div>
	</div>
</div>
@endsection