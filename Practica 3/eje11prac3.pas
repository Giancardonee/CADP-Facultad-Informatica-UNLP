{11. Una compañía de vuelos internacionales está analizando la información de todos los vuelos realizados por sus
aviones durante todo el año 2019. De cada vuelo se conoce el código de avión, país de salida, país de llegada,
cantidad de kilómetros recorridos y porcentaje de ocupación del avión. La información se ingresa ordenada por
código de avión y, para cada avión, por país de salida. La lectura finaliza al ingresar el código 44. Informar:
● Los dos aviones que más kilómetros recorrieron y los dos aviones que menos kilómetros recorrieron.
● El avión que salió desde más países diferentes.
● La cantidad de vuelos de más de 5.000 km que no alcanzaron el 60% de ocupación del avión.
● La cantidad de vuelos de menos de 10.000 km que llegaron a Australia o a Nueva Zelanda.}



program eje11prac3 ; 
type
		Avion = record	
	Cod_Avion: integer; 
	Pais_salida: string ; 
	Pais_llegada: string ; 
    Km_recorridos: real ; 
    Porcentaje_ocupacion: real; 
     
end; 
procedure LeerDatosAviones (var i: Avion) ; 

begin
			write('--->Ingrese el codigo de avion:  '); readln (i.Cod_Avion) ; 
				if i.Cod_Avion <> 44 then
					begin
								write ('Ingrese el pais de salida: '); readln (i.Pais_salida); 
											write('Ingrese el pais destino: '); readln (i.Pais_llegada) ; 
												write ('Ingrese los kilometros recorridos: '); readln (i.Km_recorridos) ; 
									write ('Ingrese el porcentaje de ocupacion del avion: %') ; readln (i.Porcentaje_ocupacion) ; 
										writeln ; 
							end; 
end; 

//● Codigo de los dos aviones que más kilómetros recorrieron
procedure AvionesMax_km (var i2:Avion; var max1,max2: real; var Cod_AvionMax1, Cod_AvionMax2: real ); 

begin
					if i2.Km_recorridos > max1 then
								begin
								max2:= max1; 
								max1:= i2.Km_recorridos; 
								Cod_AvionMax2:= Cod_AvionMax1; 
								Cod_AvionMax2:= i2.Cod_Avion ; 
								end
										else
												begin
														if i2.Km_recorridos > max2 then 
												begin
											max2:= i2.Km_recorridos; 
										Cod_AvionMax2:= i2.Cod_Avion ; 
								end; 		
					end; 
end;
//  codigo de los dos aviones que menos kilómetros recorrieron.
procedure AvionesMin_km (var i3: Avion;var  min1,min2: real; var Cod_AvionMin1, Cod_AvionMin2: real ); 

begin
					if i3.Km_recorridos < min1 then 
						begin
							min2:= min1 ; 
							min1:= i3.Km_recorridos; 
							Cod_AvionMin2:= Cod_AvionMin1 ;
							Cod_AvionMin1:= i3.Cod_Avion; 
						end 
								else
										begin
											if i3.Km_recorridos < min2 then			
									begin
							min2:= i3.Km_recorridos; 
					Cod_AvionMin2:= i3.Cod_Avion ; 
					end; 			
		end;
end; 

// ● La cantidad de vuelos de más de     5.000 km que no alcanzaron el 60% de ocupación del avión.
//funcion 1 
function Mas5milKm (i4: Avion): boolean ; 
var
res: boolean ; 
begin
			if (i4.Km_recorridos > 5000) then 
				res:= true
					else
							res:= False;
							 
					Mas5milKm:= res; 	
				
end;
//funcion 2
function  Min60_porciento (i5: Avion): boolean ; 
var
res: boolean ; 
begin
		if i5.Porcentaje_ocupacion < 60 then 
					res := true 
					 else 
								res:= false ; 
								
					Min60_porciento:= res ; 
						
end; 

//● La cantidad de vuelos de menos de  10.000 km que llegaron a Australia o a Nueva Zelanda.}
//funcion 1 
function  Menos10milkm (i6: Avion): boolean ; 
var
res: boolean ; 
begin
		if i6.Km_recorridos < 10000 then 
			res:= true
				else
				res:= false; 
				
				Menos10milkm:= res; 
end;

function Australiza_NuevaZelanda (i7: Avion): boolean ; 
var
res: boolean ; 
begin
		if (i7.Pais_llegada = 'Australia') or (i7.Pais_llegada = 'Nueva Zelanda') then 
			res:= true 
				else
					res:= false;
					
			Australiza_NuevaZelanda:=res;			
end;



{ La información se ingresa ordenada por
código de avión y, para cada avión, por país de salida.
● El avión que salió desde más países diferentes.}

var
Datos: Avion; 
max1,max2,min1,min2: real ;         								    // 		ambos tienen que ser real, porque lo comparamos con kilometros, y se podrian ingresar
AvionMax1,AvionMax2,AvionMin1,AvionMin2: real ;  				 	//       5.4 kilometros, entonces por ese movitvo no aseguramos que es un numero entero
Vuelos_mas5000km: integer ; 
Vuelos_menos10000km: integer;
{CodigoAvion_actual: integer ; 
PaisDeSalida_actual: string ; 
AvionMasPaisesDiferentes: integer ; }

begin 
Vuelos_menos10000km:= 0 ; 
Vuelos_mas5000km:= 0 ; 
min1:= 9999;
min2:= 9999; 
max1:= -1 ;
max2:= -1 ; 
LeerDatosAviones (Datos) ; 
AvionesMax_km (Datos,max1,max2,AvionMax1,AvionMax2) ; 
AvionesMin_km (Datos,min1,min2,AvionMin1,AvionMin2) ; 			
			if Mas5milKm (Datos)  and (Min60_porciento (Datos)) then 
				Vuelos_mas5000km:= Vuelos_mas5000km + 1 ; 
			if Menos10milkm(Datos) and Australiza_NuevaZelanda(Datos) then
				Vuelos_menos10000km:= Vuelos_menos10000km + 1 ; 				
while Datos.Cod_Avion <> 44 do 

	begin
		LeerDatosAviones (Datos) ; 
	if Datos.Cod_Avion <> 44 then 
		begin
AvionesMax_km (Datos,max1,max2,AvionMax1,AvionMax2) ; 
AvionesMin_km (Datos,min1,min2,AvionMin1,AvionMin2) ; 			
			if Mas5milKm (Datos)  and (Min60_porciento (Datos)) then 
				Vuelos_mas5000km:= Vuelos_mas5000km + 1 ; 
			if Menos10milkm(Datos) and Australiza_NuevaZelanda(Datos) then
				Vuelos_menos10000km:= Vuelos_menos10000km + 1 ; 				
			end; 
	
	end; 
	
	writeln ; 
			writeln ('----> Los dos aviones que mas kilometros recorrieron tienen los siguientes codigos: '); 
						writeln ('---' ,AvionMax1:6:0);
							writeln ('---',AvionMax2:6:0) ; 							
			writeln ('-----> Los dos aviones que menos kilometros recorrieron tienen los siguientes codigos: ') ; 
							writeln ('---',AvionMin1:6:0) ; 
									writeln ('---',AvionMin2:6:0) ; 
													writeln ; // salto de linea 
													writeln ; 	
						writeln ('---> Los vuelos de mas de 5.000 km con menos del %60 de ocupacion son: ',Vuelos_mas5000km); 			
									writeln ('Los vuelos de mens de 10.000 km con destino Australia o Nueva Zelanda son: ',Vuelos_menos10000km) ;
												writeln ('')
end.
