/*
usage:
call movimiento_almacen(id_almacen_origen,id_almacen_destino,cantidad,tipo_movimiento,id_producto,id_usuario,'comentarios',@completado,@status)



DELIMITER $$
DROP PROCEDURE IF EXISTS movimiento_almacen$$
CREATE PROCEDURE movimiento_almacen(
	IN almacen INT,
	IN almacen_destino INT,
	IN numero INT,
	IN tipo_movimiento INT,
	IN id_producto INT,
	IN id_usuario INT,
	IN comentario LONGTEXT,
	OUT completado VARCHAR(200),
	OUT codestatus VARCHAR(10))
BEGIN
		DECLARE numrows INT;
		DECLARE affected INT;
		DECLARE stock INT;
		DECLARE nueva_existencia INT;
		set affected=0;
		if(tipo_movimiento='1') THEN
			set numrows=(SELECT count(*) from existencia where idProducto=id_producto and idAlmacen=almacen);
			if(numrows>0) then 
					/*update*/
					/*sumar cantidad a existencia */
					set stock=(select cantidad from existencia where idProducto=id_producto and idAlmacen=almacen);
					set nueva_existencia=stock+numero;
					update existencia SET cantidad=nueva_existencia, updated_at=NOW() where idProducto=id_producto and idAlmacen=almacen;
					set affected=ROW_COUNT();
			else
					/*agregar existencia a tabla*/
					insert into existencia(idProducto,idAlmacen,cantidad,observaciones,created_at,updated_at) VALUES(id_producto,almacen,numero,comentario,NOW(),NOW());
					set affected=ROW_COUNT();
			end if;
			if (affected>0) THEN
				/* reportar el movimiento */
				insert into movimiento (idMovimiento,idAlmacen,idProducto,idUsuario,cantidad,comentario,created_at,updated_at) VALUES(tipo_movimiento,almacen,id_producto,id_usuario,numero,comentario,NOW(),NOW());
				set completado='Se realizo la entrada con exito!';
				set codestatus='200';	
			ELSE
				set completado='Ocurrio un error al realizar la transaccion';
				set codestatus='500';	
			end if;
		ELSE
			/*verificar si existe suficiente stock en almacen para retirar*/
			set numrows=(select cantidad from existencia where idAlmacen=almacen and idProducto=id_producto);
			if(numrows>0 and numero<=numrows) then
					if(tipo_movimiento='3') then 
							/* restar cantidad de salida */
							set stock=(select cantidad from existencia where idProducto=id_producto and idAlmacen=almacen);
							set nueva_existencia=stock-numero;
							update existencia SET cantidad=nueva_existencia,updated_at=NOW() where idProducto=id_producto and idAlmacen=almacen;
							/* verificar si en almacen destino existe el prodycto*/
							set numrows=(select cantidad from existencia where idAlmacen=almacen_destino and idProducto=id_producto);
							if(numrows>0) then 
									set stock=(select cantidad from existencia where idProducto=id_producto and idAlmacen=almacen_destino);
									set nueva_existencia=stock+numero;
									update existencia SET cantidad=nueva_existencia,updated_at=NOW() where idProducto=id_producto and idAlmacen=almacen_destino;
									set affected=ROW_COUNT();
							else 
									insert into existencia(idProducto,idAlmacen,cantidad,observaciones,created_at,updated_at) VALUES(id_producto,almacen_destino,numero,comentario,NOW(),NOW());
									set affected=ROW_COUNT();
							end if;
							if (affected>0) THEN
								/* reportar movimiento de salida y entrada */
								insert into movimiento (idMovimiento,idAlmacen,idProducto,idUsuario,cantidad,comentario,created_at,updated_at) VALUES(2,almacen,id_producto,id_usuario,numero,concat('Traspaso(Salida) : ',comentario),NOW(),NOW());
								insert into movimiento (idMovimiento,idAlmacen,idProducto,idUsuario,cantidad,comentario,created_at,updated_at) VALUES(1,almacen_destino,id_producto,id_usuario,numero,concat('Traspaso(Entrada) : ',comentario),NOW(),NOW());
								set completado='Se realizo el traspaso con exito!';
								set codestatus='200';	
							ELSE
								set completado='Ocurrio un error al realizar la transaccion';
								set codestatus='500';	
							end if;
					ELSE
							set stock=(select cantidad from existencia where idProducto=id_producto and idAlmacen=almacen);
							
								set nueva_existencia=stock-numero;
								update existencia SET cantidad=nueva_existencia,updated_at=NOW() where idProducto=id_producto and idAlmacen=almacen;
								set affected=ROW_COUNT();
								if (affected>0) THEN
									/* reportar el movimiento */
									insert into movimiento (idMovimiento,idAlmacen,idProducto,idUsuario,cantidad,comentario,created_at,updated_at) VALUES(tipo_movimiento,almacen,id_producto,id_usuario,numero,comentario,NOW(),NOW());
									set completado='Se realizo la salida con exito!: ';
									set codestatus='200';	
								ELSE
									set completado='Ocurrio un error al realizar la transaccion';
									set codestatus='500';	
								end if;	
					end if;
			ELSE
				set completado='Imposible realizar el movimiento: No hay suficiente stock o el producto no existe en el almacen';
				set codestatus='500';	
			end if;
		end if;
		SELECT completado,codestatus;
END$$
DELIMITER ;