{8. La Comisión Provincial por la Memoria desea analizar la información de los proyectos presentados en el programa
Jóvenes y Memoria durante la convocatoria 2020. Cada proyecto posee un código único, un título, el docente
coordinador (DNI, nombre y apellido, email), la cantidad de alumnos que participan del proyecto, el nombre de la
escuela y la localidad a la que pertenecen. Cada escuela puede presentar más de un proyecto. La información se
ingresa ordenada consecutivamente por localidad y, para cada localidad, por escuela. Realizar un programa que
lea la información de los proyectos hasta que se ingrese el proyecto con código -1 (que no debe procesarse), e
informe:
● Cantidad total de escuelas que participan en la convocatoria 2018 y cantidad de escuelas por cada localidad.
● Nombres de las dos escuelas con mayor cantidad de alumnos participantes.
* ● Título del proyecto de la localidad de Daireaux cuyo código posee igual cantidad de dígitos pares e impares. }

program eje8prac3 ; 

type 
		Docente = record
		DNI: integer ; 
		Nombre: string; 
		Apellido: string; 
		email: string; 
	end; 
	
	Proyecto= record 
		Codigo: integer; 
		Titulo: string ; 
		DocenteR: Docente; 
		Cant_Alu: integer ; 
		Escuela: string; 
		Localidad: string; 
		Anio: integer ; 
	end; 
	
	procedure LeerDatosProyecto (var i:Proyecto; var cant_2018: integer ); 
	begin
	
	write('Ingrese el codigo del proyecto: ');  readln (i.Codigo);  
			if i.Codigo <> -1 then 
	begin
			write ('Ingrese la localidad de la escuela: ') ; readln (i.Localidad ); 
					write('Ingrese el titulo del proyecto: ') ;  readln(i.Titulo) ; 
							write ('Ingrese el nombre de la escuela: '); readln (i.Escuela) ; 
									write ('Ingrese el anio de presentacion del proyecto: '); readln (i.Anio) ; 
										if i.anio = 2018 then
											cant_2018:= cant_2018 + 1 ; 
			
						write('Ingrese la cantidad de alumnos participantes de la escuela: ') ; readln (i.Cant_Alu) ; 
	  		writeln; 
       writeln; 
       
       
   end
			else
					
end; 

procedure  NombresEscuelas_MAX  (var i2: Proyecto; var max1, max2: integer ; var Escuela1, Escuela2: string ) ; 
		begin
					if i2.Cant_Alu> max1 then 
						begin
						max2:= max1; 
						max1:= i2.cant_Alu ; 
						Escuela2:= Escuela1;
						Escuela1:= i2.Escuela; 
						end
					else
						if i2.Cant_Alu > max2 then 	
						begin
						max2:= i2.Cant_Alu ; 
						Escuela2:= i2.Escuela; 
					end; 
		end; 			
		
{ ● Título del proyecto de la localidad de Daireaux cuyo código posee igual cantidad de dígitos pares e impares. }
procedure DescomponerNum (i3:Proyecto; var Titulo: string) ; 
var
Num: integer; 
Dig: integer; 
Impares, Pares: integer; 
begin
	if i3.Localidad = 'Daireaux' then
		begin
			ImpareS:= 0 ; 
					Pares:= 0 ; 
							Num:= i3.Codigo; 
				while num <>0 do 
				
				begin			
							Dig:= (Num MOD 10); 
									if ((Dig MOD 2) = 0) Then 
											Pares:= Pares +1 
													else 
										Impares:= Impares + 1 ; 
		
												Num:= Num DIV 10; 
							end; 
	
	
	
					if (Pares = Impares) then
							Titulo:= i3.Titulo; 
					end; 
end; 

var
cantidad_2018 : integer ; 
Proyec: Proyecto; 
max1, max2: integer ;
Escuela1,Escuela2: string; 
Localidad_Actual: string ;
Escuelas_Localidad: integer ;  
Titulo_proyecDaireaux: string ; 
begin
max1:= -1 ;
max2:= -1; 
Escuela1:= ' ' ; 
Escuela2:= ' ' ; 
Localidad_Actual:= ' ' ; 
Escuelas_Localidad:= 0 ; 
cantidad_2018:= 0 ; 

LeerDatosProyecto (Proyec,cantidad_2018) ; 
 while Proyec.Codigo <> -1 do 
	begin
				////////-----------------------------/////////
							Localidad_Actual:= Proyec.Localidad; 

										while (Proyec.Localidad = Localidad_Actual) and (Proyec.Codigo<> -1)  do 
												begin
													Escuelas_Localidad:= Escuelas_Localidad + 1 ; 
															DescomponerNum (Proyec,Titulo_proyecDaireaux) ; 
																NombresEscuelas_MAX (Proyec,max1,max2,Escuela1,Escuela2) ; 
																			LeerDatosProyecto (Proyec,cantidad_2018) ;  
															end ; // end del while
					
											writeln ('La cantidad de escuelas de la localidad ',Localidad_Actual, ' es: ' ,Escuelas_Localidad) ; 
													Escuelas_Localidad:= 0 ; 
														if (Proyec.Codigo<> -1) then 
															begin
															NombresEscuelas_MAX (Proyec,max1,max2,Escuela1,Escuela2) ; 
																	DescomponerNum (Proyec,Titulo_proyecDaireaux) ; 
																			LeerDatosProyecto (Proyec,cantidad_2018) ;
																				end; 
					end; // end del while 

						/// pascal no acepta la ñ, por lo tanto tuve que poner anio
		    	writeln ('-----La cantidad de proyectos del anio 2018 son: ',cantidad_2018) ; 
						writeln ('Los nombres de las escuelas con maximos participantes son: '); 
								writeln ('1-------> ',Escuela1) ; 
										  writeln ('2------>',Escuela2) ; 
 							 writeln ; 
 							 writeln ('El titulo del proyecto de la localidad Daireaux, cuyo codigo posee mismos dig pares que impares es: ') ; 
								writeln ('-------> ',Titulo_proyecDaireaux) ;
 							 
								
end.

