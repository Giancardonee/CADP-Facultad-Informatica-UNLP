{Completar el programa principal para   que lea información de alumnos (código, nombre, promedio) e informe
la cantidad de alumnos leídos. La lectura finaliza cuando ingresa un alumno con código 0, que no debe
procesarse. Nota: utilizar el módulo leer}

{b. Modificar al programa anterior para que, al finalizar la lectura de todos los alumnos, se informe también el
nombre del alumno con mejor promedio}


program Registros;

type
	str20 = string[20];
	alumno = record
			codigo : integer;
			nombre : str20;
			promedio : real;
end;

procedure leer(var alu: alumno; var cantAlumnos: integer) ; 
   begin
    write('Ingrese el codigo del alumno: ');
    readln(alu.codigo);
    if (alu.codigo <> 0) then 
        begin
        write('Ingrese el nombre del alumno: ');
				readln(alu.nombre);
        
        write('Ingrese el promedio del alumno: ');
				readln(alu.promedio);
        cantAlumnos:=cantAlumnos+1;
				writeln;		 //salto de linea 
        end;
end;

procedure promediar(var nombre: string; var promedio: real; var promedio_max: real; var Alumno_Destacado: string ) ; 
begin
	if promedio > promedio_max then
		begin
			promedio_max:= promedio; 
				Alumno_Destacado:= nombre;
			end;

end;

{ declaración de variables del programa principal }
var
a : alumno;
cantAlumnos: integer; 
promedio_max: real; 
Alumno_Destacado: string ; 
{ cuerpo del programa principal }
begin
cantAlumnos:= 0; 
promedio_max:= -1; 
leer(a,cantAlumnos) ; 
promediar (a.nombre,a.promedio,promedio_max,Alumno_Destacado) ; 
	while a.codigo<> 0 do 
		begin				
						leer(a,cantAlumnos) ; 
					promediar (a.nombre,a.promedio,promedio_max,Alumno_Destacado) ; 
		end;
				writeln; //salto de linea
	writeln('La cantidad de alumnos leidos es: ',cantAlumnos); 
		writeln ('La persna con mejor promedio es: ',Alumno_Destacado);
	

end.
