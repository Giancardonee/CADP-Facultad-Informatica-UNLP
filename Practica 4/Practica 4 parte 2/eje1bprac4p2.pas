{Ahora sabemos que el vector esta ordenado, entonces debemos buscar el numero}

program eje1_bPrac4p2 ; 

const 
	DimF = 7 ; 
	
type 
	
	vector = array [1..DimF] of integer ; 
	
Procedure CargarVectorDimF (var v: vector; DimF: integer) ; 
var
i: integer; 
begin
	for i:= 1 to DimF do 
		begin
				write ('Ingrese un numero: '); 		readln (v[i]) ;			
		end;
end; 
	
// funcion para buscar elementos ordenados en vector. 	
function BuscarN (v: vector; DimF,numero: integer ) : boolean ; 
var
pos: integer; 
begin
pos:= 1 ; 
	while (  (pos <= DimF) and (v[pos] < numero)  ) do 
		begin
		pos:= pos + 1 ; 
		end; 

if ( (pos <= DimF) and (v[pos] = numero) )  then 
	BuscarN:= true 
		else 
				BuscarN:= false; 
end; 	
	
	
var
v: vector ; 
numero: integer ; 
begin
CargarVectorDimF (v,DimF) ; 
writeln ; 
	write ('Ingree un numero para buscar en el vector: ');  readln (numero) ; 
	
 if (BuscarN (v,DimF,numero) )	 then 			
 // si la funcion devuelve true , entonces devuelve el mensaje que se pudo encontrar el num 
 // en caso de que la funcion devuelva false es porque el numero no se encuentra en el vector
	writeln ('Se encontro el numero ',numero, ' en el vector' ) // si es true 
		else
	writeln ('No se encontro el numero ',numero, ' en el vector' ) ;  // si es false 
end.
