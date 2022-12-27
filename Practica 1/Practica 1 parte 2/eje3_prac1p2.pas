{Realizar un programa que lea desde teclado la información de alumnos ingresantes a la carrera
Analista en TIC. De cada alumno se lee nombre y nota obtenida en el módulo EPA (la nota es un
número entre 1 y 10). La lectura finaliza cuando se lee el nombre “messi“, que debe
procesarse. Al finalizar la lectura informar:
- La cantidad de alumnos aprobados (nota 8 o mayor) y
- la cantidad de alumnos que obtuvieron un 7 como nota}


program eje3prac1p2; 

type
rango_nota= 1..10;

var
nombre: string ; 
nota:rango_nota ;
Cant_alumnos_7: integer ; 
Cant_alumnos_excelente: integer ; 

begin
		Cant_alumnos_7:= 0 ; 
		Cant_alumnos_excelente:= 0 ; 
		
		repeat 
			writeln('Bienvenidos ingresantes de la carrera Analista en TIC');
					write('Por favor, ingrese su nombre: ') ; 
							readln(nombre) ; 
							writeln() ; 
		   write('Ingrese su nota obtenida en el modulo EPA: ');	
							readln(nota);
				
							writeln(); 
											
			if nota = 7 then 
				Cant_alumnos_7:= Cant_alumnos_7 + 1 
			else 
			if nota >= 8 then
				Cant_alumnos_excelente:= Cant_alumnos_excelente + 1 ; 
							
		until nombre = 'messi' ;   

		writeln('La cantidad de alumnos leidos con nota igual a 7 son: ', Cant_alumnos_7) ; 
				writeln('La cantidad de alumnos leidos con nota 8 o mayor son : ',Cant_alumnos_excelente) ; 
		
 end.
