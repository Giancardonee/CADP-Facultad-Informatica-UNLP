{Realice un programa que resuelva los siguientes incisos:
a. Lea nombres de alumnos y los almacene en un vector de a lo sumo 500 elementos. La lectura finaliza
cuando se lee el nombre ‘ZZZ’, que no debe procesarse.
b. Lea un nombre y elimine la primera ocurrencia de dicho nombre en el vector.
c. Lea un nombre y lo inserte en la posición 4 del vector.
d. Lea un nombre y lo agregue al vector.
Nota: Realizar todas las validaciones necesarias.}

program eje2prac4p2; 

Const 
  DimF = 500 ; 

type
	vector = array [1..DimF] of string;
	 
procedure cargarVectorNombres(var v:vector; var DimL: integer); 
var
nombre: string; 
begin
DimL:= 0 ; 
nombre:= ' '; 
	while nombre <> 'ZZZ' do 
		begin
				write('Ingrese un nombre: '); 
					readln(nombre); 
						if nombre <> 'ZZZ' then 
							begin
							DimL:= DimL + 1 ; 
						        v[DimL]:= nombre;  
							end; 
		end; 
end; 
//b) Leer nombre y eliminar ocurrencia 
procedure eliminarOcurrencia (var v:vector; var DimL: integer); 
var
nombre:string; 
pos,i: integer; 
encontre: boolean ; 

begin
pos:=1; 
encontre:= false; 
	write('Ingrese un nombre para eliminar: ') ; readln (nombre); 
		//Buscamos si el nombre se encuentra en el vector
			while ((pos<= DimL) and (not encontre)) do 
				begin
						if nombre = v[pos] then 
							encontre:= true 
						  else
								pos:= pos + 1 ; 
				end; 
			// si encontre = true es porque se encontro el nombre
			// y en pos, nos va a indicar la posicion que se encontro
			//por lo tanto: debemos eliminar el nombre 
			
	if (encontre = true) then 
	//elimino ocurrencia
		begin
			for i:= pos to (DimL - 1)do  
					begin
					v[i]:= v[i+1] 
					end; // end del for 
				DimL:= DimL - 1 ; 
				writeln ('Se elimino el nombre correctamente'); 
	 	end; // end del if  
    	
    	if (encontre = false) then 
			writeln ('**ERROR** el nombre no se encuentra en el vector') ;	
end; 

//c. Lea un nombre y lo inserte en la posición 4 del vector.
procedure insertarNombre (var v:vector; var DimL:integer); 
var
nombre:string; 
pos: integer; 
pude:boolean; 
i: integer; 
begin
{para saber si se puede insertar el nombre en la posicion 4
* debemos saber si hay espacio (DimL + 1 tiene que ser <o= que DimF )
* y debemos verificar que la posicion sea valida }
{En este caso, sabemos la posicion,pero no sabemos la dimension logica del vector}
pos:=4 ; 
pude:= false; 
	if ((DimL + 1) <= (DimF))  and (pos>=1) and (pos<=DimL) then 
		begin
			pude:= true; 
				write('Ingrese un nombre para insertar en la posicion 4: '); 
					readln (nombre); 
							for i:= DimL downto pos do 
								v[i+1]:= v[i]; 
								DimL:= DimL + 1 ; 
								v[pos]:= nombre; 
		end; 
		if (pude = true) then 
			writeln('El nombre ',nombre,' se inserto correctamente en la posicion 4')
			else
				writeln('**ERROR** no se pudo insertar el nombre. '); 
		
end; 

//d. Lea un nombre y lo agregue al vector.
procedure agregarNombreVector (var v:vector; var DimL:integer) ; 
var
nombre:string; 
pude: boolean; 
begin
{para agregar un elemento al final del vector, primero debemos
* saber si DimL<= DimF, en el caso de que el vector no tenga
* mas espacio, nos va a devolver false
* Si el vector tiene espacio, nos devuelve true, y podemos agregar el nombre}
pude:= false; 
	if ((DimL+1) <= DimF) then 
		begin
		pude:= true; 
			write ('Ingrese un nombre para agregar al final del vector: '); 
				readln (nombre); 
					DimL:= DimL+1; 
					v[DimL]:= nombre; 
		end;
		if (pude = true) then 
			writeln ('Se agrego correctamente el nombre ingresado al final del vector')
		else
			begin
				writeln ('**ERROR** no se pudo ingresar el nombre ingresado') ;
				writeln('el vector se encuentra lleno')
			end; 

end; 


procedure MostrarVector (v:vector; DimL:integer) ; 
var
i: integer; 
begin
	for i := 1 to DimL do 
		writeln (v[i]); 
end;

procedure separar ; 
begin
	writeln (' - - - - - - - - - - - - - - - - - - - - ')
end; 

// prog. princ
var
v:vector; 
DimL,opcion: integer; 
begin
opcion:= -1 ; 
cargarVectorNombres(v,DimL);
while (opcion <> 0) do 
	begin 
	    separar; 
	   writeln('Operaciones que se podran realizar sobre el vector: '); 
		writeln ('(1) Eliminar nombre del vector'); 
		writeln ('(2) Insertar nombre en el vector');
		writeln('(3) Agregar nombre en el vector');  
		writeln('(4) Mostrar vector'); 
		writeln('(0) Para salir'); 
		write ('Ingrese una opcion: ');
			readln (opcion);  
			case opcion of 
			1:eliminarOcurrencia(v,DimL);  
			2:insertarNombre(v,DimL); 
		    3: agregarNombreVector(v,DimL); 
			4:MostrarVector(v,DimL); 
			
			
			end; // end del case 
			separar; 
	end; // end del while 

  

end.
