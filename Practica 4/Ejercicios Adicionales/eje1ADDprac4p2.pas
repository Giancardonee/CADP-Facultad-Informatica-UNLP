{1. La compañía Canonical Llt. desea obtener estadísticas acerca del uso de Ubuntu Linux en La Plata. Para
ello, debe realizar un programa que lea y almacene información sobre las computadoras con este
sistema operativo (a lo sumo 10.000). De cada computadora se conoce código de computadora, la
versión de Ubuntu que utilizan (18.04, 17.10, 17.04, etc.), la cantidad de paquetes instalados y la
cantidad de cuentas de usuario que poseen. La información debe almacenarse ordenada por código de
computadora de manera ascendente. La lectura finaliza al ingresar el código de computadora -1, que
no debe procesarse. Una vez almacenados todos los datos, se pide:
a. Informar la cantidad de computadoras que utilizan las versiones 18.04 o 16.04.
b. Informar el promedio de cuentas de usuario por computadora.
c. Informar la versión de Ubuntu de la computadora con mayor cantidad de paquetes instalados.
d. Eliminar la información de las computadoras con código entre 0 y 500.}

program eje1ADD ; 

const
	DimF = 5 ; 

type 
	computadora = record
	codigo : integer ;
	version : real ; 
	paquetes : integer ; 
	usuarios : integer ;  
	end;
	
	vector1= array [1..DimF] of computadora ;
	
	procedure CargarVectorDatos (var v1: vector1 ; var DimL : integer ); 
	
	var
	Codigo : integer; 
	begin
	DimL:= 0 ; 
		write ('----> Ingrese el codigo de la computadora: '); readln (Codigo); 
					while ( (DimL < DimF) and (Codigo <>-1 ) ) do 
							begin
									DimL:= DimL + 1 ; 
										v1[DimL].codigo:= Codigo ; 
												write ('---->  Ingrese la version de Ubuntu que utiliza: '); readln (v1[DimL].version) ; 
														write ('----> Ingrese la cantidad de paquetes instalados: ') ; readln (v1[DimL].paquetes) ; 
																write ('----> Ingrese la cantidad de usuarios que posee: ') ; readln (v1[DimL].usuarios); 				
																	writeln  ('- - - - - - - - - - - - - - - - - - - - - - - - - ');												
											if DimL < DimF then 
												begin
												write ('----> Ingrese el codigo de la computadora: '); 
												readln (Codigo); 
												end;
							end;
	end;
	
	procedure MostrarVectorUbuntu (v: vector1; DimL : integer) ; 
	
	var
	i : integer; 
	begin
			for i := 1 to DimL do 
					begin
							writeln  ('- - - - - - - - - - - - - - - - - - - - - - ');
									writeln ('Los datos de la persona ',i, ' son: ' ) ; 
										writeln ('El codigo de la computadora es: ',v[i].codigo); 
											writeln ('La version de Ubuntu que utiliza es: ',v[i].version:2:2); 
												writeln ('La cantidad de paquetes instalados son: ',v[i].paquetes); 
													writeln ('La cantidad de usuarios que posee son: ',v[DimL].usuarios); 
														 writeln  ('- - - - - - - - - - - - - - - - - - - - - - ');
														 writeln ; 
					end;
	end; 
	
	
	//a. Informar la cantidad de computadoras que utilizan las versiones 18.04 o 16.04.
	// vamos a usar la version 18.04 en este caso, igualmente se podrian usar las dos
	// pero si quisieramos informar por separado tendriamos que usar un procedimiento. 
	// si quisieramos informar la cantidad de veces que se encuentran las dos versiones, podriamos hacerlo en esta funcion tambien. 
	function informarVersiones (v1: vector1; DimL : integer): integer;
	var
	i: integer; 
		cant: integer; 
			versionBuscada: real ; 
	begin
		cant:= 0 ; 
		versionBuscada:= 18.04 ; 
			for i:= 1 to DimL do 
				begin
					if	v1[i].version = versionBuscada then 
							cant:= cant + 1 ; 
				end;
		informarVersiones:= cant; 
	end;
	
	//b. Informar el promedio de cuentas de usuario por computadora.
	function promediosDeUsuarios (v: vector1; DimL : integer ) : real ; 
	var
	SumaUsuarios,i: integer; 
	promedio: real ; 
	begin
	SumaUsuarios:= 0 ; 
	//promedio:= 0 ; 
				for i:= 1 to DimL do 
					begin
					SumaUsuarios:= SumaUsuarios + v[i].usuarios ; 
					end;
					// ahora una vez que tengo todos los usuarios. tendria que sacar el promedio con las computadoras leidas (DimL)
					promedio:= (SumaUsuarios/DimL) ; 
				promediosDeUsuarios:= promedio ; 
	end;
	
	//c. Informar la versión de Ubuntu de la computadora con mayor cantidad de paquetes instalados.
	function mayorPaquetes (v: vector1 ; DimL: integer): real ; 
	var
	max: real ; 
	i: integer; 
	versionActual: real ; 
	// no hace falta esta variable, porque podriamos comparar directamente sobre el vector
	//pero la cree, para que sea mas modularizado, y se entienda el fin de la variable y de su uso. 
	begin
	max:= -1 ; 
		for i:= 1 to DimL do 
			begin
					versionActual:= v[i].version ; 
						if versionActual > max then 
							max:= versionActual
			end;
			mayorPaquetes := max; 
	end;
	
procedure ordenarVector (var v: vector1; DimL: integer); 
	var
	i,j: integer; 
	respaldoR: real ; 
	respaldoI: integer; 
	
begin 
		for i:= 1 to (DimL -1 ) do 
				for j:= i+1 to DimL do 
						begin
								if v[i].codigo > v[j].codigo then
										begin	
															respaldoI:= v[i].codigo; 
																v[i].codigo:= v[j].codigo;
																	v[j].codigo:= respaldoI; 
																	
																			respaldoR:= v[i].codigo; 
																					v[i].version:= v[j].version;
																						v[j].version:= respaldoR; 
																			
																								respaldoI:= v[i].paquetes; 
																									v[i].paquetes:= v[j].paquetes;
																					v[j].paquetes:= RespaldoI;
																								
																	respaldoI:= v[i].usuarios; 
															v[i].usuarios:= v[j].usuarios;
												v[j].usuarios:= respaldoI;  
											end; 
										
			end; // end del for	
	end;//end del procedure
	
	
	//----------------------------------------------------------
	
	
	
	 //d. Eliminar la información de las computadoras con código entre 0 y 500.
	procedure eliminar_datos (var v: vector1; var DimL : integer) ; 
	var
	i: integer; 
	pos: integer; 
	begin
				// primero debo buscar el codigo, y luego borrarlo 
		
		
		pos:=1; 
		while (pos <= DimL)  do 
			
				begin
						
							if ( (v[pos].codigo >= 0 ) and (v[pos].codigo <= 500) )	then
											begin
				
							
															for i := pos to (DimL-1) do 
																		begin
																					v[i].codigo:=v[i+1].codigo;
																									v[i].version:= v[i+1].version;
																											v[i].paquetes:= v[i+1].paquetes;
																			v[i].usuarios:= v[i+1].usuarios; 
																			end;// end del for 
														DimL:= DimL -1 ; 			
									end; // end del if 
								pos:= pos + 1 ; 
			end;// end del while
	end;// end del procedure 

		
	
	procedure informar (v: vector1; DimL: integer); 
	begin
	writeln ; 
		writeln  ('- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ');		
			writeln ('---> La cantidad de computadoras que utilizan las versiones 18.04 son: ' ,informarVersiones(v,DimL) ); 
					writeln ('---> El promedio de cuentas de usuario por computadora es: ',promediosDeUsuarios(v,DimL):2:2);
				writeln ('---> La version con mayor cantidad de paquetes instalados es la version: ',mayorPaquetes(v,DimL):2:2); 
	   		writeln  ('- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ');		 
			writeln ;
			  	
			ordenarVector(v,DimL); 
			eliminar_datos (v,DimL); 
			eliminar_datos (v,DimL); 
	   		MostrarVectorUbuntu (v,DimL); 
	
	end;
	
    // prog principal. 
	var
	v : vector1; 
	DimL : integer; 
	begin
	CargarVectorDatos (v,DimL) ; 
	informar (v,DimL); 
	end.

