@extends('app')
@section('content')
<div class="row">
	<div class="col-md-6 col-md-offset-3">
		<div class="panel panel-default">
			<div class="panel-heading text-center">
				Crear Tipo de Movimiento
			</div>
			<div class="panel-body">
			{!! Form::open(array('url' => '/tipomovimiento', 'method' => 'store')) !!}
				
					<input type="hidden" name="_token" value="{{ csrf_token() }}">
					<input type="hidden" name="user_id" value="{{ Auth::user()->id }}">
					<div class="form-group">
						<label for="Nombre">Nombre</label>
						<input type="text" name="nombre" placeholder="Nombre" class="form-control"> 
  						@if ($errors->has('nombre'))
  						{!!$errors->first('nombre')!!}
  						@endif
						
						<label for="descripcion">Descripci&oacute;n</label>
						<textarea name="descripcion" id="descripcion" class="form-control"></textarea>
					</div>
					
					<input type="submit" value="Crear" name="" class="btn btn-success pull-right">
				{!! Form::close() !!}
			</div>
		</div>
	</div>
</div>
@endsection