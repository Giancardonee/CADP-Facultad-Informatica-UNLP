{8. Realizar un programa que lea y almacene la información de 400 alumnos ingresantes a la Facultad de
Informática de la UNLP en el año 2020. De cada alumno se lee: nro de inscripción, DNI, apellido, nombre y
año de nacimiento. Una vez leída y almacenada toda la información, calcular e informar:
a) El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.
b) Apellido y nombre de los dos alumnos de mayor edad.}

//este programa en vez de 400 alumnos, va a leer 5
// si se quiere leer 400, solo se debera cambiar el valor de la constante rango de 5 a 400 

program eje8prac4; 

const 
	rango = 5 ; 
type

	Alumno = record
	Nro_inscripcion: integer ; 
	Dni: integer ; 
	Apellido: string ; 
	Nombre: string ; 
	Anio_nacimiento: integer;    ///   	como en Pascal no nos deja utilizar la ñ , tenemos que hacerlo asi (no es que no sepa escribir jajaj)
	end ; 

	Vector = array [1..rango] of Alumno; 

procedure CargarVector (var v: vector;  var Cant_Alu: integer ) ; 
	var
	i: integer; 
	begin
	Cant_Alu:= 0 ; 
		for i:= 1 to rango do 
			begin
					write ('Ingrese el numero de inscripcion: ') ; readln (v[i].Nro_inscripcion) ; 
							write ('Ingrese su dni: ') ; readln (v[i].Dni) ; 
									write ('Ingrese su apellido: ') ;readln (v[i].Apellido) ; 
											write ('Ingrese su nombre: '); readln (v[i].Nombre) ; 
													write ('Ingrese su anio de nacimiento: ');  readln (v[i].Anio_nacimiento) ; 
								Cant_Alu:= Cant_Alu + 1 ;  // esta variable, en este tipo de ejercicio que sabemos la cantidad que se procesan SI O SI, no es necesaria
																				// porque podriamos usar la constante rango.  
																				// La estoy utilizando por convencion, para que si leen el codigo les sea mas facil entenderlo. 
						writeln ; // salto de linea
			
			end; 
	
	end; 
	
	procedure Alumnos_dniPar (v: vector; var Alumnos_pares: integer ) ; 
		var
		i: integer ;
		numero: integer ; 
		digito: integer ;  
		Impares: integer ; 
		Pares: integer; 
		
		begin
		Alumnos_pares:= 0 ;
		
		for i := 1 to rango do 
			begin
			Impares:= 0 ; 
					Pares:= 0 ; 
			numero:= v[i].Dni; 
					
						while numero <> 0 do 
									begin
											digito:= numero MOD 10 ; 
													if digito MOD 2 = 0 THEN
															Pares:= Pares + 1 
								else
													Impares:= Impares + 1 ;
									
								numero:= numero DIV 10 ; 
						end;
						
						
										If Impares = 0  then 
														Alumnos_pares:= Alumnos_pares + 1 ; 
				
						
			end; 
	
end; 
	
	procedure MayorEdad (v: vector)  ; 
		var
	i: integer ; 
	max1,max2: integer ; 
		Nombre1,Nombre2,Apellido1,Apellido2: string ; 
		begin
		max1:= 2022 ; 
		max2:= 2022 ; 
			for i:= 1 to rango do 
				begin
						if v[i].Anio_nacimiento < max1 then 
							begin
									max2:= max1 ;
									max1:= v[i].Anio_nacimiento; 
									Nombre1:= v[i].Nombre;  
									Apellido1:= v[i].Apellido; 
									
							end	 
									else 
											if v[i].Anio_nacimiento < max2 then 
													begin
												max2:= v[i].Anio_nacimiento ; 
												Nombre2:= v[i].Nombre; 
												Apellido2:= v[i].Apellido; 
										end; 
				end; 
			writeln ('Los nombres y apellidos de los dos alumnos con mayor edad son:  ')	 ;
					writeln ('----> ',Nombre1, ' ' ,Apellido1) ; 
							writeln ('----> ' ,Nombre2, ' ' ,Apellido2) ; 
				
		end; 
		
	
	
	var
	v: vector ; 
	Cant_alumnos: integer ; 
	Alumnos_par: integer ; 
	promedio: real ; 
	begin
	CargarVector (v,Cant_alumnos) ; 
	Alumnos_dniPar (v,Alumnos_par) ; 
	MayorEdad (v) ; 
	promedio:= ((Cant_alumnos/Alumnos_par)* 100) ; 
	writeln ('El promedio de alumnos con el dni de todos los Digitos pares es: %',promedio:2:0) ; 
	end.
