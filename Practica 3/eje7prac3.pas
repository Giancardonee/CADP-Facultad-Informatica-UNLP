{7. Realizar un programa que lea información de centros de investigación de Universidades Nacionales. De cada
centro se lee su nombre abreviado (ej. LIDI, LIFIA, LINTI), la universidad a la que pertenece, la cantidad de
investigadores y la cantidad de becarios que poseen. La información se lee de forma consecutiva por universidad y
la lectura finaliza al leer un centro con 0 investigadores, que no debe procesarse. Informar:
● Cantidad total de centros para cada universidad. 
● Universidad con mayor cantidad de investigadores en sus centros.
● Los dos centros con menor cantidad de becarios. }


// lo que falta en este programa es mostrar la cantidad de centros para cada universidad.
program eje7prac3; 

type
	centros = record 
			nombre: string; 
			universidad: string ; 
			cant_investigadores: integer ; 
			cant_becarios: integer; 
	
	end; 

procedure LeerDatos(var centro1: centros) ; 

begin
write ('Ingrese la cantidad de investigadores: '); 
	readln (centro1.cant_investigadores) ; 	
		write ('Ingrese el nombre del centro: ') ;
			readln (centro1.nombre) ; 
				write ('Ingrese la universidad que corresponde al centro ',centro1.nombre, ': '); 
					readln (centro1.universidad) ; 
							write ('Ingrese la cantidad de becarios: '); 
								readln (centro1.cant_becarios) ; 
										writeln ; 
end; 
/// ● Universidad con mayor cantidad de investigadores en sus centros.
procedure UniversidadMAX_investigadores (var centro2: centros;var max: integer; var universidad_MAX_investigadores: string ) ; 
begin
	if centro2.cant_investigadores > max then
		begin
		max:= centro2.cant_investigadores; 
			universidad_MAX_investigadores:= centro2.universidad; 
		end; 

end; 

//● Los dos centros con menor cantidad de becarios. }
procedure MenorBecarios (var centro3: centros; var min1,min2: integer; var centroMin1, centroMin2: string) ; 

begin
	if centro3.cant_becarios < min1 then
			begin
			min2:= min1 ; 
			min1:= centro3.cant_becarios; 
			centroMin2:= centroMin1 ; 
				centroMin1:= centro3.nombre; 
			end 
					else
							if centro3.cant_becarios < min2 then
										begin
							min2:= centro3.cant_becarios  ; 
					centroMin2:= centro3.nombre ;		
			end; 

end; 


var
centro: centros; 
max: integer; 
uni_max_investigadores: string ; 
min1,min2: integer ;
centroMin1, centroMin2: string ; 
cantidad_centros: integer ; 
centroActual: string; 
begin
min1:= 9999;
min2:= 9999; 
max:= -1 ; 
LeerDatos (centro) ; 
	while centro.cant_investigadores <> 0 do 
			begin
			cantidad_centros:= 0 ; 
				centroActual:= centro.Universidad; 
					UniversidadMAX_investigadores (centro,max,uni_max_investigadores) ; 
								MenorBecarios (centro,min1,min2,centroMin1,centroMin2) ; 	
					while centro.universidad = centroActual do 
							begin 
									cantidad_centros:= cantidad_centros + 1 ; 
											LeerDatos (centro) ; 
								if centro.universidad <> centroActual then
						writeln ('La universidad ',centroActual, ' posee ' ,cantidad_centros, ' centros') ;
					end ;  
			
	end; 
				writeln ('La universidad con mas investigadores es: ', uni_max_investigadores) ; 
					writeln ('Los centros con menor cantidad de becarios son: ',centroMin1, ' y ' ,centroMin2) ; 
								
end.




{	 if (centro.cant_investigadores <> 0) then
		begin
UniversidadMAX_investigadores (centro,max,uni_max_investigadores) ; 
MenorBecarios (centro,min1,min2,centroMin1,centroMin2) ; 	
		end; 
	
	while (centro.cant_investigadores <> 0) do 	
			begin

					LeerDatos (centro) ; 
	if (centro.cant_investigadores <> 0) then
			begin
						UniversidadMAX_investigadores (centro,max,uni_max_investigadores) ; 
								MenorBecarios (centro,min1,min2,centroMin1,centroMin2) ; 	
							end; 
	
	

			end; 
			writeln ; 
	while centro.cant_investigadores <> 0 do 
			begin 
	cantidad_centros:= 0 ; 
		centroActual:= centro.universidad; 
				
			while centro.universidad = centroActual do 
				begin
						cantidad_centros:= cantidad_centros + 1 ; 
							LeerDatos (centro) ; 
				end; 
			UniversidadMAX_investigadores (centro,max,uni_max_investigadores) ; 
								MenorBecarios (centro,min1,min2,centroMin1,centroMin2) ; 	
			writeln ('La universidad ',centroActual, ' tiene ' ,cantidad_centros, ' centros'); 
					
	end; 			
			
			
		writeln ('La universidad con mayor cantidad de investigadores es: ',uni_max_investigadores) ; 
			writeln ; // salto de linea 
				writeln ('Los dos cetro con menor cantidad de becarios son: ',centroMin1, ' y ' ,centroMin2) ;  }
