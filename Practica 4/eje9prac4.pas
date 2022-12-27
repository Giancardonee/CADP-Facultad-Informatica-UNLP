{9. Modificar la solución del punto anterior considerando que el programa lea y almacene la información de a
lo sumo 400 alumnos. La lectura finaliza cuando se ingresa el DNI -1 (que no debe procesarse).}
{En este tipo de ejercicios, tenemos que usar la dimension logica, se ira incrementando, hasta que:
*  se lean 400 alumnos como maximo o, hasta que se ingrese el  dni -1 }


program ejeprac4; 
	 const
			dimF=400;  // Limite del vector 
 
 type
    str20=string[20];

	Alumno = record
	Nro_inscripcion: integer ; 
	Dni: integer ; 
	Apellido: string ; 
	Nombre: string ; 
	Anio_nacimiento: integer;    ///   	como en Pascal no nos deja utilizar la ñ , tenemos que hacerlo asi (no es que no sepa escribir jajaj)
	end ; 
    
    vector = array [1..DimF] of Alumno ; 
    
    procedure CargarVector (var v: vector ;var DimL: integer) ; 
	begin
	DimL:= 1 ;
	
	write ('Ingrese su dni: ') ; readln (v[DimL].Dni) ;
			if (v[DimL].Dni) <> -1 then 
				begin 
					write ('Ingrese el numero de inscripcion: ') ; readln (v[DimL].Nro_inscripcion) ; 
									write ('Ingrese su apellido: ') ;readln (v[DimL].Apellido) ; 
											write ('Ingrese su nombre: '); readln (v[DimL].Nombre) ; 
													write ('Ingrese su anio de nacimiento: ');  readln (v[DimL].Anio_nacimiento) ; 
						writeln ; // salto de linea
			end; 
		while (v[DimL].Dni <> -1) and (DimL <= DimF) do 
			begin
			write ('Ingrese su dni: ') ; readln (v[DimL].Dni) ;
						if v[DimL].Dni <> -1 then 
								begin
								
				DimL:= DimL + 1 ; 					
						write ('Ingrese el numero de inscripcion: ') ; readln (v[DimL].Nro_inscripcion) ; 
										write ('Ingrese su apellido: ') ;readln (v[DimL].Apellido) ; 
													write ('Ingrese su nombre: '); readln (v[DimL].Nombre) ; 
														write ('Ingrese su anio de nacimiento: ');  readln (v[DimL].Anio_nacimiento) ; 

							
						writeln ; // salto de linea
								end; 
								
				end ; 
end; 
	 
	 	procedure Alumnos_dniPar (v: vector; var Alumnos_pares: integer; DimL: integer ) ; 
		var
		i: integer ;
		numero: integer ; 
		digito: integer ;  
		Impares: integer ; 
		Pares: integer; 
		
		begin
		Alumnos_pares:= 0 ;
		
		for i := 1 to DimL do 
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
	
	procedure MayorEdad (v: vector; DimL: integer)  ; 
		var
	i: integer ; 
	max1,max2: integer ; 
		Nombre1,Nombre2,Apellido1,Apellido2: string ; 
		begin
		max1:= 2022 ; 
		max2:= 2022 ; 
			for i:= 1 to DimL do 
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
	 V: vector ; 
	 DimL: integer ;
	 Alumnos_pares: integer; 
	 promedio: real; 
	 begin
	 CargarVector (V,DimL) ; 
	 Alumnos_dniPar (V,Alumnos_pares,DimL) ; 
	 MayorEdad (V,DimL) ; 
	 promedio:= ((DimL/Alumnos_pares)* 100) ; 
	writeln ('El promedio de alumnos con el dni de todos los Digitos pares es: %',promedio:2:0) ; 
	 end.
 
