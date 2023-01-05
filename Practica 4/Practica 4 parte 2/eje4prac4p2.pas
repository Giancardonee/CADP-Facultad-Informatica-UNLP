{4. Una cátedra dispone de información de sus alumnos (a lo sumo 1000). De cada alumno se conoce nro de
alumno, apellido y nombre y cantidad de asistencias a clase. Dicha información se encuentra ordenada por
nro de alumno de manera ascendente. Se pide:


a. Un módulo que retorne la posición del alumno con un nro de alumno recibido por parámetro. El
alumno seguro existe.
 
b. Un módulo que reciba un alumno y lo inserte en el vector.
 
c. Un módulo que reciba la posición de un alumno dentro del vector y lo elimine.

d. Un módulo que reciba un nro de alumno y elimine dicho alumno del vector

e. Un módulo que elimine del vector todos los alumnos con cantidad de asistencias en 0.

Nota: Realizar el programa principal que invoque los módulos desarrollados en los incisos previos con datos
leídos de teclado. }


// (a lo sumo 1000) : esto se refiere a que el vector debe tener COMO MAXIMO	1000 elementos, podra tener menos, o 1000, pero nunca MAS 

{De cada alumno se conoce nro de alumno, apellido y nombre y cantidad de asistencias a clase. }
// para poder realizar la lectura de cada alumno, se debera usar un registro, el cual lo usaremos en un vector, para ir cargando los datos de los alumnos
// apellido y nombre, lo voy a tomar como un solo tipo de registro(nombre) 
//una vez cargado el vector , debemos ordenar en forma ascendente por nro de alumno 


program eje4prac4p2 ; 

const

DimF = 1000 ; 

type 
	Alumno = record
		nro_alumno : integer ; 
		nombre : string ; 
		cant_asistencias : integer ; 
	end ; 

	vector = array [1..DimF] of Alumno ; 
	

	
	// este procedimiento lo voy a hacer para que sea mas legible el programa. a lo largo de ir cargando los datos
	procedure SaltoDeLinea () ; 
	begin
			writeln ('- - - - - - - - - - - - - - - ');
	end;
	
	

		// procedimiento cargar vector
	// En este procedure vamos a utilizar la DimL (Dimension Logica, para saber cuantos alumnos se lee)
	//La lectura de alumnos va a finalizar cuando se ingrese el alumno con nro de alumno = 0 , o cuando se llene el vector
	
	procedure CargarVectorAlumnos (var v: vector; var DimL: integer) ;
	
	var
	nro: integer ;
	begin
		DimL:= 0 ; 
				write ('Ingrese el numero de alumno: ') ; 
					readln (nro) ;
							if (nro <> 0) then begin
										DimL:= DimL + 1 ; 
											v[DimL].nro_alumno:= nro ; 
						write ('Ingrese el nombre y apellido: ') ; 
								readln (v[DimL].nombre) ; 
										write ('Ingrese la cantidad de asistencias a la clase: '); 
												readln (v[DimL].cant_asistencias) ; 
							end;
							
				while (DimL >= 1) and 	(DimL <= 1000) and (nro <> 0) 	do
							begin
								SaltoDeLinea ; 
											write ('Ingrese el numero de alumno: ');
														readln (nro) ; 
														
								if (nro <> 0) then begin
										DimL:= DimL + 1 ; 
											v[DimL].nro_alumno:= nro ; 
						write ('Ingrese el nombre y apellido: ') ; 
								readln (v[DimL].nombre) ; 
										write ('Ingrese la cantidad de asistencias a la clase: '); 
												readln (v[DimL].cant_asistencias) ; 
							end;
				end;
	end;
	
	
	//Una vez que tengamos el vector cargado, vamos a mostrarlo para ver si se ingresaron correctamente los datos
	
	
	//procedimiento para ordenar vector en forma ascendente
	procedure OrdenarVector (var v: vector; DimL: integer) ; 
	var
	i, t: integer ; 
	pude: boolean ;
	n: string ; 
	clases: integer; 
	begin
			pude := false ; 
		while not (pude) do 
			begin
				pude:= true;
	 {si ya termine de ordenar,  pude  se pone en true y no entra al if, por lo cual terminaria de ejecutarse el while }
	 
						for i:= 1 to (DimL - 1) do 
									if ( (v[i].nro_alumno)  >  (v[i+1].nro_alumno) )  then 
				{mientras entre al if, significa que no esta ordenado, por lo tanto pude sera false, siempre que entre al if }
									begin
												pude:= false; 
															t:= v[i].nro_alumno; 
																		v[i].nro_alumno:=v[i+1].nro_alumno; 
																					v[i+1].nro_alumno:= t ;  
																							n:=v[i].nombre; 
																								v[i].nombre:= v[i+1].nombre;
																													v[i+1].nombre:= n;
																								clases:= v[i].cant_asistencias; 
																					v[i].cant_asistencias:= v[i+1].cant_asistencias; 
																v[i+1].cant_asistencias:= clases; 
										end;
				end;
	end; 
	
	procedure MostrarVector2  (v: vector; DimL: integer) ; 
	
	var
	i: integer ; 
	begin
		for i:= 1 to DimL do 	
			begin
					writeln ('- - - - Los datos de la persona ',i, ' son - - - - '); 
							writeln ('-El numero de alumno es: ',v[i].nro_alumno) ; 
								writeln ('-El nombre del alumno es: ',v[i].nombre); 
									writeln ('-La cantidad de asistencias a clase del alumno es: ',v[i].cant_asistencias) ; 
										writeln ; 
			
			end;
		
	end;
	
	///---------------------------------------------------------
	{a. Un módulo que retorne la posición del alumno con un nro de alumno recibido por parámetro. El
alumno seguro existe.}

function  posicionAlumno (v: vector; DimL:integer; num: integer): integer ; 
var
pos: integer; 
begin
	pos:= 1 ; 
				while ( ( pos <= DimL ) and ( v[pos].nro_alumno <> num) )  do 
						begin
									pos:= pos + 1 ; 
						end;
								if  ( ( pos <= DimL ) and ( v[pos].nro_alumno = num) ) then 
										posicionAlumno:= pos 
							else
											posicionAlumno:= 0 ; 
end;

//-----------------------------------------------------------
//b. Un módulo que reciba un alumno y lo inserte en el vector.
{no se en que posicion se refiere a que lo inserte, pero vamos a ingresar la posicion desde teclado}
{Datos a tener en cuenta para insertar un elemento en un vector: 
*  verificar si hay espacio
* hacer lugar para poder insertar el elemento
* incrementar la cantidad de elementos actuales (porque al insertar un elemento mas,vamos a tener que incrementar la DimL) }
procedure insertarAlumno (var v: vector; var DimL: integer; pos: integer; n_alumno: integer;  nombre: string; clases: integer ) ; 
	var
	i : integer ; 
	pude: boolean ;
	begin
		pude:= false; 
	
	if ( (DimL + 1 ) <= DimF ) and(  (pos >=  1) and (pos<= DimL ) )then 
		begin
			for i:= DimL downto pos do 
				begin
			
							v[i+1].nro_alumno:= v[i].nro_alumno ; 
									v[i+1].nombre:= v[i].nombre ; 
										v[i+1].cant_asistencias:= v[i].cant_asistencias;
				end; 
					pude:= true; 
								v[pos].nro_alumno:= n_alumno ; 
										v[pos].nombre:= nombre; 
												v[pos].cant_asistencias:= clases; 
														DimL:= DimL + 1 ; 
			end; 
			
			if (pude = true)  then 
				MostrarVector2(v,DimL)
				else
			if (pude = false ) then 
				begin
			writeln ('ERROR- No se pudo insertar al alumno en el vector por algunas de las razones: '); 
				writeln ('-El vector esta completo'); 
						writeln ('-Se inserto una posicion no valida'); 
					end; 
			
end; 
	
			// inciso c. Un módulo que reciba la posición de un alumno dentro del vector y lo elimine.
	procedure eliminarPos (var v: vector; var DimL: integer; pos: integer ) ;
	var
	pude: boolean; 
	i: integer; 
	num: integer; 
	begin
		pude:= false ; 
			if ( (pos >= 1)  and (pos <= DimL) ) then 
				begin
				
						for i:= pos to (DimL - 1 ) do 
										begin
											v[i].nro_alumno:= v[i+1].nro_alumno ; 
												v[i].nombre:= v[i+1].nombre; 
													v[i].cant_asistencias:= v[i+1].cant_asistencias; 
													
										 end; 
					pude:= true; 
					DimL:= (DimL - 1) ; 
				end;
						if (pude = false ) then 
							writeln ('ERROR - No se pudo eliminar la posicion ingresada porque la posicion es INEXISTENTE'); 
							
						if (pude = true ) then 
							begin
								writeln ; 
									writeln ('Si quiere mostrar el vector, ingrese 1');
										writeln ('Si usted no quiere ver el vector, ingrese 0') ; 
												write ('Ingrese el numero aqui: '); readln (num); 
										writeln ; 
								if ( num = 1)  then 
									MostrarVector2(v,DimL); 
							end;
	end;
	
	
	
	// inciso d Un módulo que reciba un nro de alumno y elimine dicho alumno del vector
	procedure EliminarAlumno (var v:vector; var DimL: integer; num_alumno: integer) ; 
	var
	pude: boolean ;
	pos: integer; 
	i: integer; 
	num: integer; 
	begin

		pude:= false; 
		pos:= 1 ; 
				while ( (pos >= 1) and (pos <= DimL) ) and (pude = false) do   
					begin
									if  (v[pos].nro_alumno = num_alumno)  then 
											begin
															for i:= pos to (DimL - 1 ) do 
																	begin
																		v[i].nro_alumno:= v[i+1].nro_alumno ; 
																				v[i].nombre:= v[i+1].nombre; 
																					v[i].cant_asistencias:= v[i+1].cant_asistencias; 
																			pude:= true ; 
																				DimL:= (DimL - 1) ;
																end; // end del for 
												end // end del if 
									else
									pos:= pos + 1 ; 		
					end; // end del while 	
				
					////
					
						if (pude = true ) then 
							begin
							
								writeln ; 
									writeln ('Si quiere mostrar el vector, ingrese 1');
										writeln ('Si usted no quiere ver el vector, ingrese 0') ; 
												write ('Ingrese el numero aqui: '); readln (num); 
										writeln ; 
											
								if ( num = 1)  then 
										begin
									OrdenarVector (v,DimL); 
									MostrarVector2(v,DimL); 
											end;
									
						end;
						
						if (pude = false) then
							writeln ('ERROR - El numero de alumno ingresado no existe');
	end;
	//---------------------------------------------------
	//inciso e. Un módulo que elimine del vector todos los alumnos con cantidad de asistencias en 0
	procedure EliminarCeroAsistencias (var v: vector; var DimL: integer) ; 
	var
	pos: integer; 
	i: integer; 
	begin
		pos:= 1 ; 
				while ( (pos>= 1) and (pos<= DimL) ) do 
						begin
								if v[pos].cant_asistencias = 0 then 
									  begin
													for i:= Pos to ( DimL - 1 ) do 
																	begin
													
															v[i].nro_alumno := v[i + 1 ].nro_alumno ;
																v[i].nombre:= v[i+1].nombre;
																		v[i].cant_asistencias:= v[i+1].cant_asistencias; 
																		end; 
																	DimL:= (DimL - 1) 
										end; 
										pos:= pos + 1 ; 
					end;
	end;
	
	// prog principal 
	var
	v: vector ; 
	DimL: integer ; 
	num_alumno: integer; 
	
	num_alumno2: integer; 
	nombre: string; 
	pos: integer; 
	clases: integer; 
	
	alumno_eliminar: integer; 
	begin
	CargarVectorAlumnos (v,DimL); 
	
{si queremos ver que se cargo el vector correctamente}
//	MostrarVector2(v,DimL); 

		SaltoDeLinea; 
			writeln ; 
	writeln ('El vector en forma ascendente con los nros de alumnos quedaria asi: ') ; 
						writeln;
		OrdenarVector (v,DimL); 
		MostrarVector2(v,DimL); 
	 	  //----------------------------------------------
  		 // inciso a:  Un módulo que retorne la posición del alumno con un nro de alumno recibido por parámetro. Elalumno seguro existe
	    //----------------------------------------------
			SaltoDeLinea ; 
				write ('Ingrese un nro de alumno para buscar en el vector: ') ; 
							readln (num_alumno); 
					if  ( posicionAlumno (v,DimL,num_alumno) ) <> 0 then 
						writeln (' La posicion del alumno con un nro de alumno recibido es: ' ,posicionAlumno (v,DimL,num_alumno) )
							else
									writeln ('ERROR - Ningun alumno del vector corresponde con el numero ',num_alumno, ' como numero de alumno '); 
										SaltoDeLinea ;

		//--------------------------------------------------
		// inciso b Un módulo que reciba un alumno y lo inserte en el vector.
		//---------------------------------------------------
				writeln ('Ingrese los siguientes datos del alumno para insertarlos al vector: '); 
						write ('Ingrese en la posicion que quisiera insertar al alumno: (del 1 hasta ',DimL, ': '')'); readln(pos) ; 
								write ('Ingresa el numero de alumno: '); readln (num_alumno2); 
										write ('Ingresa el nombre del alumno: '); readln (nombre ); 
												write ('Ingrese la cantidad de asistencias a clase: ');  readln (clases) ; 
													insertarAlumno (v,DimL,pos,num_alumno2,nombre,clases); 
																
																			{lo que faltaria aca, seria invocar al procedimiento ordenar, asi se ve mejor}
																			{igualmente, podemos invocar al procedimiento OrdenarVector, al final del programa, y asi ordenaria todo una sola vez y listo } 
																			{pero lo invoco a medida que voy haciendo el ejercicio, para que se vea mas prolijo, y vean que en verdad funciona}
															
															//OrdenarVector (v,DimL); 
															//MostrarVector2(v,DimL); 
						
		//---------------------------------------------------
		// inciso c. Un módulo que reciba la posición de un alumno dentro del vector y lo elimine.
		//---------------------------------------------------
					SaltoDeLinea ; 
						write ('Ingrese  la posicion que quisiera eliminar del vector: '); readln(pos) ; 
											eliminarPos (v,DimL,pos) ; 
		//--------------------------------------------------
		// inciso d Un módulo que reciba un nro de alumno y elimine dicho alumno del vector
		//---------------------------------------------------	
						write ('Ingrese un numero de alumno para eliminar del vector: '); 
									readln (alumno_eliminar) ; 
											EliminarAlumno (v,DimL,alumno_eliminar) ; 
		//--------------------------------------------------- 
		//e. Un módulo que elimine del vector todos los alumnos con cantidad de asistencias en 0.
									EliminarCeroAsistencias (v,DimL); 
		//---------------------------------------------------
				writeln ; 
				SaltoDeLinea ; 
				writeln ('El vector odenado, y eliminando a los alumnos con asistencias = 0 queda asi:  ');
				SaltoDeLinea;
				writeln; 
									OrdenarVector (v,DimL); 
									MostrarVector2(v,DimL); 					
		//---------------------------------------------------
						
	end.
	
