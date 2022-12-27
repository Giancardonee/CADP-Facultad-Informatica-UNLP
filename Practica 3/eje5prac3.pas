{5. Realizar un programa que lea información de autos que están a la venta en una concesionaria. De cada auto se lee:
marca, modelo y precio. La lectura finaliza cuando se ingresa la marca “ZZZ” que no debe procesarse. La información se
ingresa ordenada por marca. Se pide calcular e informar:
o Precio promedio por marca.
o Marca y modelo del auto más caro.}



// Podemos considerar que hay 3 marcas de autos en la concesionaria? 
// renault, chevrolet, peugeot  .....? 


/// corregir el promedio de la marca de autos ingresada 
program eje5prac3; 

type
	autos = record 
		marca: string[30] ; 
		modelo: string[30] ; 
		precio: real ; 
		cantMarca: integer ; 
		end;
		
procedure LeerDatosAutos (var datos:autos); 
begin
		write ('Ingrese la marca del auto: ') ; readln (datos.marca) ; 
					write ('Ingrese la cantida de autos, de la marca ' ,datos.marca,': ') ; 
								readln (datos.cantMarca) ; 
											write ('Ingrese el modelo del auto: ') ; readln (datos.modelo) ; 
														write ('Ingrese el precio del auto: ') ; readln (datos.precio) ; 
																writeln ; 
													
end; 

procedure LeerDatosAutos2 (var datos2: autos; var i2: integer ) ; 
	begin
				write ('Ingrese el modelo del ',i2, ' auto de la marca ',datos2.marca, ': ') ; 
						readln (datos2.modelo) ; 
								write ('Ingrese el precio del auto: ') ; 
										readln (datos2.precio) ; 
												writeln ; 
		end; 

procedure Marca_y_PrecioMAX (var datos1: autos; var precio_MAX: real ; var ModeloAutoCaro: string  ) ; 

begin
			if datos1.precio > precio_MAX then 
				begin
				precio_MAX:= datos1.precio; 
				ModeloAutoCaro:= datos1.modelo ; 
				end; 

end; 


var
auto: autos;
i: integer ; 
precio_MAX: real ; 
modelo_autoCaro: string ;
cantAutos: integer; 
precioPromedio: real ; 
i2: integer; 
begin
precio_MAX:= -1; 
precioPromedio:= 0 ; 
cantAutos:= 0 ; 
LeerDatosAutos (auto)  ; 
i:= 2 ;  
i2:= i ; 
			if auto.cantMarca= 1 then 
							begin
									 writeln ('Usted cargo el modelo ',auto.modelo, ' de la marca ',auto.marca) ; 
												writeln ('con un valor de: ',auto.precio:2:2, ' pesos'); 
														writeln ; 
														writeln; 
							end
									else
											if auto.cantMarca> 1 then 
												begin
														for i:= i2 to auto.cantMarca do 
																	begin 
														Marca_y_PrecioMAX (auto,precio_MAX,modelo_autoCaro);  
															LeerDatosAutos2 (auto,i2) ; 
																 cantAutos:= cantAutos + 1; 
																		precioPromedio:= ((precioPromedio + auto.precio)/cantAutos) ; 
																						i2:= i + 1 ; 
												end; 
															writeln ('La cantidad de autos de la marca ' ,auto.marca, ' tiene un precio promedio de: ',precioPromedio:4:2); 
																writeln ('El modelo mas caro fue: ' ,auto.marca, ' ' ,modelo_autoCaro, ' con un precio de:  ',precio_MAX:4:2); 
																			writeln ; 
										end;
										
		cantAutos:= 0 ; 
		precioPromedio:= 0  ;										 
		while auto.marca  <> 'ZZZ' do 
	
							begin 
							LeerDatosAutos (auto); 
									if auto.marca <> 'ZZZ' then 
										begin
											if auto.cantMarca= 1 then 
							begin
									 writeln ('Usted cargo el modelo ',auto.modelo, ' de la marca ',auto.marca) ; 
												writeln ('con un valor de: ',auto.precio:4:2, ' pesos'); 
														writeln; 
																writeln; 
							end
									else
											if auto.cantMarca> 1 then 
												begin
														for i:= i2  to auto.cantMarca do 
																	begin 
														Marca_y_PrecioMAX (auto,precio_MAX,modelo_autoCaro);  
															LeerDatosAutos2 (auto,i2) ; 
																 cantAutos:= cantAutos + 1; 
																		precioPromedio:= ((precioPromedio + auto.precio)/cantAutos)  ; 
																			i2:= i+1; 		
																					
												end; 
															writeln ('La cantidad de autos de la marca ' ,auto.marca, ' tiene un precio promedio de: ',precioPromedio:4:2); 
																writeln ('El modelo mas caro fue: ' ,auto.marca, ' ' ,modelo_autoCaro, ' con un precio de:  ',precio_MAX:4:2); 
																				writeln ;
																				
																				precioPromedio:= 0 ; 	
																				cantAutos:= 0 ;  
										end;
										end; 
											
							end; 
 

end. 

