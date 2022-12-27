{. El Ministerio de Educación desea realizar un relevamiento de las 2400 escuelas primarias de la provincia de Bs. As,
con el objetivo de evaluar si se cumple la proporción de alumnos por docente calculada por la UNESCO para el año
2015 (1 docente cada 23,435 alumnos). Para ello, se cuenta con información de: CUE (código único de
establecimiento), nombre del establecimiento, cantidad de docentes, cantidad de alumnos, localidad. Se pide
implementar un programa que procese la información y determine:
● Cantidad de escuelas de La Plata con una relación de alumnos por docente superior a la sugerida por UNESCO.
● CUE y nombre de las dos escuelas con mejor relación entre docentes y alumnos.
El programa debe utilizar:
a) Un módulo para la lectura de la información de la escuela.
b) Un módulo para determinar la relación docente-alumno (esa relación se obtiene del cociente entre la cantidad
de alumnos y la cantidad de docentes).}


/// en este caso vamos a leer 4 escuelas primarias en vez de 2400
program eje3prac3; 

type
		datosEscuelas= record 
		cue: integer ; 
		establecimiento: string ; 
		cantDocentes: integer ; 
		cantAlumnos: integer; 
		Localidad: string; 
		NombreDocente: string ; 
		end; 

procedure LeerDatos (var escuela:DatosEscuelas; var Alumnos_docentes:integer); 

begin
	write('Ingrese el CUE (cod. unico de establecimiento): ');
			readln(escuela.cue) ; 
	write ('Ingrese el nombre del establecimiento: ') ; 
				readln (escuela.establecimiento); 
		write('Ingrese la localidad: '); 
				readln(escuela.Localidad); 
		write('Ingrese la cantidad de docentes del establecimiento: ');  
				readln(escuela.cantDocentes) ;
				write ('Ingrese el nombre de una docente: ');
					readln (escuela.NombreDocente) ; 
		write('Ingrese la cantidad de alumnos del establecimiento: ');
				readln (escuela.cantAlumnos) ; 
			
			writeln; 
			Alumnos_docentes:= escuela.cantDocentes DIV escuela.cantAlumnos;  
end; 

procedure UNESCO_superior (var escuelas1:DatosEscuelas; var cantPromedio_Superior: integer; Alumnos_docentes: integer);  
var
max: real; 
begin
max:= 234.35 ;
		if Alumnos_docentes > max Then
			cantPromedio_Superior:= cantPromedio_Superior + 1 ; 
end; 

procedure RelacionDocentes_Alumnos (var Alumnos_docentes: integer; var escuelas2:DatosEscuelas; var max1: integer; var max2: integer; 
var cue1,cue2: integer; var nombre1,nombre2: string ) ; 

begin
			
			if Alumnos_docentes > max1 then 
				begin
					max2:= max1;
					max1:= Alumnos_docentes; 
					cue1:= escuelas2.cue ; 
					nombre1:= escuelas2.NombreDocente ; 
				end
						else
				begin
							if Alumnos_docentes > max2 THEN 
								begin
									max2:=Alumnos_docentes; 
										cue2:= escuelas2.cue; 
											nombre2:= escuelas2.NombreDocente;  
								end
					end; 			
end;

var
datos: datosEscuelas; 
cantPromedioSuperior: integer; 
i: integer ; 
cue1,cue2: integer ; 
max1,max2: integer ; 
nombre1,nombre2: string ; 
Alumnos_docentes: integer ; 
begin
cue1:= 0 ; 
cue2:= 0 ; 
max1:= -1 ; 
max2:= -1 ; 
cantPromedioSuperior:= 0 ; 
for i := 1 to 3 do 
	begin 
LeerDatos (datos,Alumnos_docentes) ; 
UNESCO_superior (datos,cantPromedioSuperior,Alumnos_docentes) ; 
RelacionDocentes_Alumnos (Alumnos_docentes, datos,max1,max1,cue1,cue2,nombre1,nombre2) ; 

	end; 

	writeln('La cantidad de escuelas con promedio superior de docentes por persona son:  ',cantPromedioSuperior) ; 
			writeln ('El primer cue y el nombre de la docente de la maxima relacion alumnos - docentes es: ') ; 
					writeln (cue1, ' y ' ,nombre1 ) ; 
				
				writeln ('El segundo cue y el nombre de la docente de la maxima relacion alumnos - docentes es: ') ; 
					writeln (cue2, ' y ' ,nombre2 ) ; 
				

end. 
