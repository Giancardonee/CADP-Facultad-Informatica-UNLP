{a. Dado un vector de enteros de a lo sumo 500 valores, realice un módulo que reciba dicho vector y un valor
n y retorne si n se encuentra en el vector o no.
b. Modifique el módulo del inciso a. considerando ahora que el vector se encuentra ordenado de manera
ascendente.}

program  eje1prac4p2; 

Const
	DimF = 7; 

type
 vector = array [1..DimF] of integer ; 
 
procedure cargarVector (var v:vector);
var
i: integer;
begin
	for i:= 1 to DimF do 
			v[i]:= i; 
end;

// inciso a 
{function buscarNumero (v:vector; num: integer): boolean ; 
var
pos: integer;
ok: boolean;
begin
ok:= false; 
pos:=1 ; 
	while ((pos >= 1) and (pos <=DimF)) and (ok=false)do 
		begin
				if ( num <> v[pos] )then 
					pos:= pos + 1 
				else if (num = v[pos]) then 
					ok:= true;
		end;
		buscarNumero:= ok;
end;}

// inciso b Buscar elemento en vector ordenado
Procedure  BusquedaBin (v: vector; numeroBuscado : integer; var encontre: integer) ;
   Var 
   pri, ult, medio : integer ;
   Begin
     encontre :=0 ;
     pri:= 1 ;
     ult:=DimF;
     medio := (pri + ult ) div 2 ;
     
		 While  ( pri <= ult ) and ( numeroBuscado <> v [medio]) do begin
				If ( numeroBuscado < v [medio] ) then 
							ult:= medio -1 	
							
				else if (numeroBuscado> v[medio]) then 
						pri:= medio+1 ;
		
				 medio := ( pri + ult ) div 2 ;
			end ;
		If  (pri <= ult ) then  
				encontre := medio
        else  
            encontre:= 0 ;         
  end ;  


var
v: vector; 
numero: integer;
encontre: integer; 
begin
cargarVector (v); 
write ('Ingrese un numero para buscar en el vector: '); readln (numero); 

//inciso a
	{if ( buscarNumero (v,numero) = false )then 
		writeln ('No se encontro el numero ',numero,' en el vector')
		else 
		writeln ('Se encontro el numero ',numero,' en el vector');}

//inciso b 
BusquedaBin(v,numero,encontre); 
	if encontre <> 0  then 
		writeln ('El numero buscado ( ',numero, ' ) se encontro en el vector ordenado, en la posicion ',encontre) 
	else
		writeln ('El numero buscado ',numero, ' no se encontro en el vector :( '); 
end.
