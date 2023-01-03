{1. a. Dado un vector de enteros de a lo sumo 500 valores, realice un módulo que reciba dicho vector y un valor
n y retorne si n se encuentra en el vector o no.}

// el vector en vez de tener 500 valores, va a tener 7 valores. 
// si se quisiera hacer de 500 valores tendriamos que cambiar el valor de la constante DimF
// como no aclara hasta cuando se deberia leer, voy a suponer que el vector tiene 7 numeros si o si   
program eje1aprac4p2;

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

Function BuscarNumero (v: vector; num: integer): boolean; 
var
ok: boolean ; 
pos: integer; 
begin
pos:= 1 ; 
ok:= false ; 
	while (pos <=  DimF) and (ok = false ) do 
		begin
			if (num = v[pos]) then 
				ok:= true 
			else	
			pos:= pos + 1 ; 
		end; 
BuscarNumero:= ok ; 

end ; 



var
v: vector;  	
numero: integer; 

begin
// como el ejercicio nos dice dado un vector de numeros, nosotros tenemos que asumir
//  que el procedimiento cargar vector ya esta en el programa, solo tendriamos que invocarlo 
// pasandole los parametros que correspondan. 

{En este caso, voy a hacer el vector desde 0 para luego poderlo reutilizar, invocandolo con sus parametros}
 	CargarVectorDimF (v,DimF) ;
							writeln ; // salto de linea  


				write ('Ingrese un numero para buscar en el vector: '); readln (numero) ; 
									writeln ;  // salto de linea 

						if (BuscarNumero (v,numero) = true ) then 
										writeln ('El numero ',numero, ' se encuentra en el vector') 
								else
										writeln ('El numero ' ,numero, ' no se encuentra en el vector') ;  
		
end. 	
