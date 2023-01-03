{3. Una empresa de transporte de caudales desea optimizar el servicio que brinda a sus clientes. Para ello,
cuenta con información sobre todos los viajes realizados durante el mes de marzo. De cada viaje se cuenta
con la siguiente información: día del mes (de 1 a 31), monto de dinero transportado y distancia recorrida
por el camión (medida en kilómetros).
a. Realizar un programa que lea y almacene la información de los viajes (a lo sumo 200). La lectura finaliza
cuando se ingresa una distancia recorrida igual a 0 km, que no debe procesarse.
b. Realizar un módulo que reciba el vector generado en a) e informe:
- El monto promedio transportado de los viajes realizados
- La distancia recorrida y el día del mes en que se realizó el viaje que transportó menos dinero.
- La cantidad de viajes realizados cada día del mes.
c. Realizar un módulo que reciba el vector generado en a) y elimine todos los viajes cuya distancia
recorrida sea igual a 100 km.
Nota: para realizar el inciso b, el vector debe recorrerse una única vez.}

program eje3prac4p2; 
		
type 
			rangoDias = 1..31; 	
			RangoVector = 1..200 ; 
///--------------------------------------------------
		 DatosViajes = record 
		
		 Dia: integer; 
		DineroTransportado: real ; 
		Km : real ; 
		end; 
//----------------------------------------------------
	vDias = array [rangoDias] of integer; 

	vViajes = array [RangoVector] of DatosViajes; 
//------------------------------------------------------

//-----------------------------------------------------
//inicializo vector de dias [1..31], en 0 cada posicion 
procedure inicializo_cero (var v: vDias) ; 
var
i: integer; 
begin
	for i := 1 to 31 do
		begin
					v[i]:= 0 ; 
		end; 
end;

{a. Realizar un programa que lea y almacene la información de los viajes (a lo sumo 200). La lectura finaliza
cuando se ingresa una distancia recorrida igual a 0 km, que no debe procesarse.}
procedure LeerViajes (var v1: vViajes; var v2: vDias; var DimL : integer; var montoPromedio: real) ; 
var
km: real; 
dia: integer; 
begin
DimL:= 0 ; 
montoPromedio:= 0 ; 
	write ('Ingrese los km recorridos: '); readln (km); 
				if km <> 0 then 
						begin
								DimL:= 1; 
		// guardo la cantidad de km en la posicion 1 : 
						v1[DimL].Km:= km; 
									write ('Ingrese el dinero transportado: $') ; readln (v1[DimL].DineroTransportado);
									
									montoPromedio:= montoPromedio + v1[DimL].DineroTransportado; 
										
								// aca debo tener en cuenta que segun el dia que ingresen, tendria que ir incrementando  
							write ('Ingrese el dia de MARZO que se realizo el viaje:  ');  readln (v1[DimL].Dia);
											dia:= v1[DimL].Dia ; 
									v2[dia]:= v2[dia] + 1; 
									
											writeln; 
				end;
							while( DimL >=1 ) and (DimL <= 200) and (km<> 0)  do 
								begin
												write ('Ingrese los km recorridos: ') ; readln (km) ; 		
													if km <> 0 then 
														begin
																	DimL:= DimL + 1 ; 
																			v1[DimL].Km:= km ; 
																					write ('Ingrese el dinero transportado: $') ; readln (v1[DimL].DineroTransportado); 
									
																							montoPromedio:= montoPromedio + v1[DimL].DineroTransportado; 
									
									// aca debo tener en cuenta que segun el dia que ingresen, tendria que ir incrementando  
														write ('Ingrese el dia de MARZO que se realizo el viaje:  ');  readln (v1[DimL].Dia );  
																			dia:= v1[DimL].Dia ; 
																			v2[dia]:= v2[dia] + 1; 
															writeln ; 
														end; // end del if  
								end;    // end del while 
end;  // end del procedure 

procedure MostrarVectorDias (dias: vDias) ; 
var
i: integer;
begin
	for i := 1 to 31 do 
		begin
		write ('-------> ') ; 
		write ('En el dia ',i:2, ' se hicieron: ',dias[i]:2, ' viajes ');
			writeln ; 
		end; 
end;

//--------------------------------------------
{b. Realizar un módulo que reciba el vector generado en a) e informe:
- El monto promedio transportado de los viajes realizados
- La distancia recorrida y el día del mes en que se realizó el viaje que transportó menos dinero.
- La cantidad de viajes realizados cada día del mes.}

// para sacar el monto promedio tenemos que sacar porcentaje: 
// para sacarlo debemos tener en cuenta el montoPromedio y la DimL que es la cant de viajes

procedure incisoB (v1:vViajes; v2: vDias; DimL: integer; montoPromedio: real ) ; 
var
i,Dia_viaje1:  integer; 
Distancia_viaje1,min1 : real ; 
begin
min1:= 32000; // ponemos uno de los numeros maximos, asi se va actualizando 

	// calculamos distancia recorrida y dia del mes en el que se realizo el viaje con menos dinero
	for i:= 1 to DimL do 
		begin
					if v1[i].DineroTransportado < min1 then 
						begin
							min1:= v1[i].DineroTransportado ; 
								Dia_viaje1:= v1[i].Dia ; 
								Distancia_viaje1:= v1[i].km; 
						end; 
			
		end ; 


															writeln ('- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -') ; 
						writeln ('El viaje con menos dinero tuvo una distancia de: ',Distancia_viaje1:4:2, ' km, y fue en el dia ',Dia_viaje1 ); 
								montoPromedio:= (montoPromedio/DimL) ; 		
										writeln ('El monto promedio transportado de los ',DimL, ' viajes es: $',montoPromedio:4:2); 
															writeln ('- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -') ; 
	writeln ; 	
						MostrarVectorDias (v2)
end; 



//------------------------------------------- modulo para encontrar la posicion donde esta el km = 100 
function BuscarDistancia100 (v1: vViajes; DimL: integer): integer; 
var
pos: integer; 
encontre: boolean; 
begin
encontre:= false; 
pos:= 1 ; 
	while (pos <= DimL) and (encontre = false)  do 
		begin
			if v1[pos].Km = 100 then 
					encontre:= true
				else
					pos:= pos + 1 ; 
	
		end; 
		
	if encontre = false then 
		BuscarDistancia100:= 0 ; 
	
	if encontre = true then 
		BuscarDistancia100:= pos; 
end; 




//------------------------------------------------------------
// este modulo recibe la posicion del viaje con km= 100, y debe borrarlo del vector 

{c. Realizar un módulo que reciba el vector generado en a) y elimine todos los viajes cuya distancia
recorrida sea igual a 100 km.}
procedure EliminarDistancia100KM (var v1:vViajes; var DimL: integer ) ; 
var
i: integer; 
pos: integer; 
begin
pos:= BuscarDistancia100 (v1,DimL) ; 
		
		while (pos >= 1) and (pos<= DimL)   do 
				begin
							for i:= pos to (DimL - 1) do 
										v1[i]:= v1[i+1];  
				
										DimL:= (DimL - 1) ; 
						pos:= BuscarDistancia100 (v1,DimL) ; 
				end; 
end; 


var
viaje: vViajes; 
dias: vDias; 
DimL: integer ; 
montoPromedio: real; 
begin
LeerViajes (viaje,dias,DimL,montoPromedio) ; 
incisoB (viaje,dias,DimL,montoPromedio) ; 
EliminarDistancia100KM(viaje,DimL)  ; 

	writeln ('El vector con la distancia recorrida en viajes, eliminando los viajes de km = 100, queda con ',DimL, ' viajes ');  
			// este programa esta completo
	
	{estaria bueno mostrar el vector de viajes, con todos los datos, ej: cantidad de viajes del mismo dia (ya está) 
	* cantidad de kilometros recorridos en total en el mismo dia, cantidad de dinero transportado en el dia
	* pero bueno, como no lo piden no es necesario}		

end.
