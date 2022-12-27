{11. Realizar un programa modularizado que lea información de alumnos de una facultad. Para cada alumno se
lee: número de inscripción, apellido y nombre. La lectura finaliza cuando se ingresa el alumno con número de
inscripción 1200, que debe procesarse. Se pide calcular e informar:
● Apellido de los dos alumnos con número de inscripción más chico.
● Nombre de los dos alumnos con número de inscripción más grande.
● Porcentaje de alumnos con nro de inscripción par.}

program eje11prac2p2 ; 

procedure LeerDatos (var Num_inscripcion: integer; var Nombre, Apellido: string) ; 

begin
	write('Ingrese su numero de inscripcion: ') ;
			readln(Num_inscripcion) ; 			
		write('Ingrese su apellido: '); 
			readln(Apellido) ; 
		write ('Ingrese su nombre: ') ;
			readln (Nombre) ;  
		writeln () ; 
end;

procedure ApellidosMinimos (numero_inscripcion: integer; var min1, min2 : integer;Apellido: string; var Apellido1, Apellido2: string ) ; 
begin
  if (numero_inscripcion<min1)then
				begin
					min2:=min1;   
					min1:=numero_inscripcion;
                    Apellido1:=Apellido;
				end
			else
				begin 
					if(numero_inscripcion<min2) then
						begin
							min2:=numero_inscripcion;
							Apellido2:=Apellido;
						end
				end;
end; 

procedure NombresMaximos (Numero_inscripcion: integer; var max1,max2: integer; var Nombre,Nombre1,Nombre2: string ) ; 
begin
	if (Numero_inscripcion > max1) then 
		begin
			max2:= max1 ; 
			max1:= Numero_inscripcion ; 
			Nombre1:= Nombre; 
		end
			else 
		begin
			if (Numero_inscripcion > max2 ) then
				begin
						max2:= numero_inscripcion ; 
						Nombre2:= Nombre; 
				end
			end;
end; 

var
Num_inscripcion : integer ; 
Nombre, Apellido: string ; 
Apellido1: string ; 
Apellido2: string; 
min1, min2: integer;
max1,max2: integer; 
Nombre1,Nombre2: string;  
begin
min1:= 9999;
min2:= 9999; 
max1:= -1 ; 
max2:= -1 ; 
repeat 
LeerDatos (Num_inscripcion, Nombre, Apellido) ; 
ApellidosMinimos (Num_inscripcion,min1,min2,Apellido,Apellido1,Apellido2);
NombresMaximos (Num_inscripcion, max1,max2,Nombre,Nombre1,Nombre2) ; 
until Num_inscripcion = 1200 ; 
	writeln ('Los apellidos de los dos alumnos con codigo de inscripcion mas chico son: ') ; 
			writeln (Apellido1, ' y ' ,Apellido2) ; 
	writeln('Los nombres de los dos alumnos con codigo de inscripcion mas grande son: ') ;
			writeln (Nombre1, ' y ' ,Nombre2) ; 
end.
