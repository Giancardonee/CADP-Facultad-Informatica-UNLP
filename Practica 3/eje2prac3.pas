	{2. El registro civil de La Plata ha solicitado un programa para analizar la distribución de casamientos durante el año
2019. Para ello, cuenta con información de las fechas de todos los casamientos realizados durante ese año.
a) Analizar y definir un tipo de dato adecuado para almacenar la información de la fecha de cada casamiento.
b) Implementar un módulo que lea una fecha desde teclado y la retorne en un parámetro cuyo tipo es el definido
en el inciso a).
c) Implementar un programa que lea la fecha de todos los casamientos realizados en 2019. La lectura finaliza al
ingresar el año 2020, que no debe procesarse, e informe la cantidad de casamientos realizados durante los
meses de verano (enero, febrero y marzo) y la cantidad de casamientos realizados en los primeros 10 días de
cada mes. Nota: utilizar el módulo realizado en b) para la lectura de fecha. } 

program eje2prac3; 

type
		//rango_dias= 1..30 ; 
		rango_meses= 1..12; 
		
		fecha = record 
				dia: integer;
				mes: rango_meses;
				anio: integer; 
		 end; 
		 
procedure LeerCasamientos (var fecha_casamiento: fecha ) ; 
	begin
				write('Ingrese su anio de casamiento: ') ; 
					readln(fecha_casamiento.anio) ;
					if fecha_casamiento.anio <> 2020 then
						begin
			write('Ingrese el dia de su casamiento: ');
				readln (fecha_casamiento.dia); 
			write('Ingrese el mes de su casamiento: (con el numero que le corresponda al mes)) ');  
				readln(fecha_casamiento.mes) ; 
						writeln; 
						end; 
					
	end;

procedure verano (fecha_casamiento2: fecha; var cant_verano: integer ) ; 
var
enero: integer ;
febrero: integer; 
marzo: integer ; 
begin
enero:= 1 ; 
febrero:= 2; 
marzo:= 3; 
	  if (fecha_casamiento2.mes >0)  and (fecha_casamiento2.mes <4) then 
			cant_verano:= cant_verano+1 ; 

end;

procedure Primeros10Dias (fecha_casamiento3: fecha; var primeros10_dias: integer ) ; 
begin
			if (fecha_casamiento3.dia > 0)  and  (fecha_casamiento3.dia < 11  ) then
				primeros10_dias:= primeros10_dias + 1 ; 
end; 

var
datos: fecha; 	
Casamientos_verano: integer; 	
primeros10_dias: integer ; 
begin
	Casamientos_verano:= 0 ; 
	primeros10_dias:= 0 ;
			
	LeerCasamientos (datos); 		
	verano (datos,Casamientos_verano ); 
	Primeros10Dias (datos,primeros10_dias) ; 
	while datos.anio <> 2020 do
		begin
			LeerCasamientos (datos); 		
				verano (datos,Casamientos_verano ); 
					Primeros10Dias (datos,primeros10_dias) ; 
		end; 
		writeln ; 
		writeln('La cantidad de casamientos en verano fueron: ',Casamientos_verano) ; 
				writeln; 
		writeln ('La cantidad de casamientos sobre los primeros 10 dias de cada mes fueron: ',primeros10_dias) ; 
end.

