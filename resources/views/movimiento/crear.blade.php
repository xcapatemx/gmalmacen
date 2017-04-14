@extends('app')
@section('content')
<style type="text/css">
	#almacendestino{display: none;}
	#donebtn{margin-right: 10px;}
</style>
<div class="row">
	<div class="col-md-6 col-md-offset-3">
		<div class="panel panel-default">
			<div class="panel-heading text-center">
				Crear Movimiento de {{$movimientovm->almacen->nombre}}
			</div>
			<div class="panel-body">
				<div>
					<label for="param">Buscar Producto</label>
					<input type="text" name="param" id="param" placeholder="Buscar Sku o Nombre..." class="searchtxt" autocomplete=off>
				</div>
				<form method="post" accept-charset="UTF-8" action="/movimiento" onsubmit="event.preventDefault(); handlepost();">
			
				
					<input type="hidden" name="_token" value="{{ csrf_token() }}">
					<input type="hidden" name="idusuario" id="idusuario" value="{{ Auth::user()->id }}">
					<input type="hidden" name="idalmacen" id="idalmacen" value="{{$movimientovm->almacen->id}}">
					<div class="form-group">
						<div>
						<div id="nombreproducto"></div>
						<input type="hidden" name="idproducto" id="idproducto">
						<label for="idmovimiento">Tipo de Movimiento</label>
						<select name="idmovimiento" id="idmovimiento">
							@foreach($movimientovm->tiposmovimiento as $movimiento)
								<option value="{{$movimiento->id}}">{{$movimiento->nombre}}</option>
							@endforeach
						</select>
						<select name="almacendestino" id="almacendestino">
							@foreach($movimientovm->almacenes as $almacen)
								<option value="{{$almacen->id}}">{{$almacen->nombre}}</option>
							@endforeach
						</select>	
						</div>
						
						<label for="cantidad">Cantidad</label>
						<input type="text" name="cantidad" id="cantidad" placeholder="Cantidad" class="form-control"> 
  						@if ($errors->has('cantidad'))
  						{!!$errors->first('cantidad')!!}
  						@endif
						
						<label for="comentario">Comentarios</label>
						<textarea name="comentario" id="comentario" class="form-control"></textarea>
					</div>
					<div class="alert">
  						
					</div>
					<input type="submit" value="Crear" name="" class="btn btn-success pull-right" id="submitbtn">
					<input type="button" class="btn btn-info pull-right" id="donebtn" value="Hecho" onclick="done()">
				</form>
			</div>
		</div>
	</div>
</div>
<script>
	
	var typingTimer;
	var doneTypingInterval = 1000;
	var $selected;
	var $current;
	function creatediv(left, top) {
		if($("#droplist").length<=0 || typeof $("#droplist") == 'undefined' || typeof $("#droplist") == 'null'){
			var newdiv = document.createElement('div');
			newdiv.setAttribute('id', "droplist");
			newdiv.style.position = "absolute";
			document.body.appendChild(newdiv);
			$("#droplist").css({'top':top,'left':left,'position':'absolute'});	
			
		}else{
			
		}
	}
	function clearsuggest(){
		$("#droplist").html('');
	}
	function startsuggest(){
		$("#droplist").slideDown();	
	}
	function setContents(sku,nombre,id){
		$("#idproducto").val(id);
		$("#nombreproducto").text(sku + "-" + nombre);
		$("#nombreproducto").addClass('itemselected');
		$(".searchtxt").val('');
		$("#droplist").slideUp();
	}
	function getProductos(){
		var dcontent=$(".searchtxt").val();
		var clength=dcontent.length;
		
		if(clength>1 && dcontent!="undefined"){
			dcontent=dcontent.replace(new RegExp(" ", "g"), "%20");
			var uri='/producto/buscar/' + dcontent;	

			$.get(uri,function(json){

				$("#droplist").html("");

				$.each(json,function(i,producto){
					$("#droplist").append("<div class=\"singleresult\" id=\"" + producto.id + "\" nombre=\"" + producto.nombre + "\" sku=\"" + producto.sku + "\">" +  producto.sku + " - " + producto.nombre + "</div>");
				});
				
				var $listItems = $(".singleresult");
				$listItems.eq(0).addClass("selected");
				
				$("#droplist .singleresult").mouseover(function(){
					
					$listItems.removeClass("selected");	
					$(this).addClass("selected");
				});
				$(".searchtxt").keydown(function(e){
					
		    		var key = e.keyCode;
        			$selected = $listItems.filter('.selected');
			    	if( key != 40 && key != 38  && key != 13){
						 return;
					}else{


					}
    				if( key == 40 || key == 38){
			 			$listItems.removeClass('selected');
					}
		    		if( key == 40 ){ // Down key
        				if(!$selected.length || $selected.is(':last-child')){
           	 				$current = $listItems.eq(0);
	        			}else{
        	   	 			$current = $selected.next();
        				}
        				
    				}else if( key == 38 ){ // Up key
    					
        				if(!$selected.length || $selected.is(':first-child')){
	            			$current = $listItems.last();
    	    			}else{
           	 				$current = $selected.prev();
        				}
        				
    				}
					if(typeof $current !== 'undefined'){
    					$current.addClass('selected');
					}
					if(key == 13){
						setContents($selected.attr("sku"), $selected.attr("nombre"),$selected.attr("id"));
					}
				});
				$("#droplist .singleresult").click(function(){
					$current=$(this);
					$current.addClass('selected');
					$selected = $listItems.filter('.selected');
					setContents($selected.attr("sku"), $selected.attr("nombre"),$selected.attr("id"));
				});
				
			},"json").fail(function(){
				
			});
			
		}
		
	}

	function doneTyping () {
		getProductos();
	}

	//funciones para post
	function handlepost(){
		$.post("/movimiento",{
			'id_almacen':$("#idalmacen").val(),
			'id_movimiento':$("#idmovimiento").val(),
			'almacen_destino':$("#almacendestino").val(),
			'id_producto':$("#idproducto").val(),
			'id_usuario':$("#idusuario").val(),
			'cantidad':$("#cantidad").val(),
			'comentario':$("#comentario").val(),
			'_token':$('input[name=_token]').val()
		}, function(res){
			
			var code_status=res.codestatus;
			var divclass="alert-success";
			$("div.alert").text(res.message);
			if(code_status!=200){
				divclass="alert-danger";
			}else{
				divclass="alert-success";
				$("#submitbtn").hide();	
			}
			$("div.alert").addClass(divclass);
		}).fail(function(){
			$("div.alert").text("Error: ocurrio un error inesperado, intente de nuevo...");
			$("div.alert").addClass('alert-danger');
		});
	}

	function done(){
		location.href="/almacen/" + $("#idalmacen").val();
	}

	$(document).ready(function(){
		$("#droplist").html("");
		$("#droplist").hide();
		creatediv(0, 0);
		clearsuggest();
		
		$(".searchtxt").keyup(function(e){
			var xypos=$(this).offset();
			var xpos=xypos.left;
			var ypos=xypos.top+$(this).outerHeight();
			$("#droplist").css({'left':xpos,'top':ypos});
			if (e.keyCode  != 38 && e.keyCode  != 40 && e.keyCode  != 13 && e.keyCode  != 37 && e.keyCode  != 39) { 
				typingTimer = setTimeout(doneTyping, doneTypingInterval);
				
				if($(".searchtxt").val().length>2){
					$("#droplist").html("<div class=\"wait\">Espere...</div>");
				}

			}
		});
		
		$(".searchtxt").keydown(function(e){
			if (e.keyCode  != 38 && e.keyCode  != 40 && e.keyCode  != 13 && e.keyCode  != 37 && e.keyCode  != 39) {
				startsuggest();	
			    clearTimeout(typingTimer);
			}
		});
		$(".searchtxt").focusin(function(e){
			$("#droplist").html("");
			if ($(this).val().length>2) { 
				var xypos=$(this).offset();
				var xpos=xypos.left;
				var ypos=xypos.top+$(this).outerHeight();
				$("#droplist").css({'left':xpos,'top':ypos});
				startsuggest();
				getProductos();
			}
		});
		$(".searchtxt").focusout(function(e){
			setTimeout(function() {
				if(!$(".searchtxt").is(":focus")){
					$("#droplist").html("");
					$("#droplist").hide();
				}
			}, 1000);
		});
		
		$("#idmovimiento").change(function(){
			if($("#idmovimiento option:selected").text()=="Traspaso"){

				$("#almacendestino").slideDown();	
			}else{
				$("#almacendestino").hide();

			}


		});
	});


</script>
@endsection