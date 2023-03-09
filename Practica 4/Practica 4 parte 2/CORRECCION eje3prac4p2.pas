{  Una empresa de transporte de caudales desea optimizar el servicio que brinda a sus clientes. Para ello,
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

Const
	DimF = 200; 

Type 
	viaje = record
		Dia: integer; 
		dineroTransportado: real; 
		Km: real; 
	end; 
	vector = array [1..DimF] of viaje; 
	vectorDias = array [1..31] of integer; 

procedure inicializarVectorDia (var v2:vectorDias) ; 
var
i: integer;
begin
	for i:= 1 to 31 do 
		v2[i]:= 0 ; 
end; 
	
{ a. Realizar un programa que lea y almacene 
la información de los viajes (a lo sumo 200)} 
procedure cargarDatos (var v:vector; var DimL: integer) ;
var 
DistanciaKm: integer ; 
begin
	DimL:= 0 ;
	 DistanciaKm:= -1 ; 
	while ((DistanciaKm <> 0) and (DimL<= DimF)) do 
		begin
				write ('Ingrese la distancia recorrida: '); 
					readln (DistanciaKm); 
						if (DistanciaKm <>0 ) then 
							begin
									DimL:= DimL + 1 ; 
									v[DimL].Km:= DistanciaKm; 
									write ('Ingrese el dia del viaje: '); 
									readln (v[DimL].Dia);
									write ('Ingrese el dinero transportado: '); 
									readln (v[DimL].dineroTransportado); 
							end; 
							writeln ; 
		end; 
end;  


{b. Realizar un módulo que reciba el vector generado en a) e informe:
- El monto promedio transportado de los viajes realizados
- La distancia recorrida y el día del mes en que se realizó el viaje que transportó menos dinero.
- La cantidad de viajes realizados cada día del mes.}
procedure incisoB (v:vector; DimL: integer; var v2:vectorDias); 
var
Min,montoPromedio,distanciaMinDinero: real; 
i,diaMin: integer; 
begin
montoPromedio:= 0 ; 
diaMin:= 0 ; 
distanciaMinDinero:= 0 ; 
Min:= 32000; 
		for i:= 1 to DimL do 
			begin
			montoPromedio:= montoPromedio + v[i].dineroTransportado; 
				if (v[i].dineroTransportado < Min) then 
					begin
						Min:= v[i].dineroTransportado; 
						diaMin:= v[i].Dia;
						distanciaMinDinero:= v[i].Km 
					end; 
				v2[v[i].Dia] := v2[v[i].Dia] + 1; // Actualizar cantidad de viajes por día

			end; 
		writeln ('----> El monto promedio de los viajes realizados es: $',(montoPromedio/DimL):2:2); 
		writeln ('----> El dia que se transporto menos dinero fue el dia: ',diaMin,  'con una distancia de: ',distanciaMinDinero:2:2, ' Km'); 
	    writeln ('La cantidad de viajes realizados cada dia del mes son: '); 	
			for i:= 1 to 31 do 
				begin
					writeln ('En el dia ',i,' se hicieron: ' ,v2[i], ' viajes')  ; 
				end; 
end; 
{c. Realizar un módulo que reciba el vector generado en a) y elimine todos los viajes cuya distancia
recorrida sea igual a 100 km.}
procedure eliminarViaje100km (var v:vector; var DimL: integer) ; 
var
pos,i: integer; 
ok: boolean; 
begin
pos:= 1 ; 
ok:= false; 
		while ((pos>= 1) and (pos <= DimL)) do 
			begin
					if (v[pos].Km = 100)  then
						begin
								for i:= pos to (DimL - 1) do 
									begin
										v[i]:= v[i+1] ; 
									end;
								DimL:= DimL-1
						end
						else
						pos:= pos + 1 ; 
			end; 
end;

var
v1: vector;
v2: vectorDias; 
DimL: integer; 
begin
inicializarVectorDia(v2); 
cargarDatos (v1,DimL); 
eliminarViaje100km(v1,DimL) ; 
incisoB (v1,DimL,v2); 
end.

// falta hacer inciso c 

