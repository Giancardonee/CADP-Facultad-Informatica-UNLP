{2. Realice un programa que resuelva los siguientes incisos:
a. Lea nombres de alumnos y los almacene en un vector de a lo sumo 500 elementos. La lectura finaliza
cuando se lee el nombre ‘ZZZ’, que no debe procesarse.}

program eje2_Prac4p2 ; 

const 
	DimF = 500 ; 
	
type 
	
	vector = array [1..DimF] of string ; 

procedure saltodeLinea () ; 
begin
	writeln ('- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -') ; 
end; 
	
procedure CargarVector (var v: vector ; DimF: integer ; var DimL: integer) ; 
var
nombre: string; 
begin
DimL:= 0 ; 
	write ('Ingrese un nombre: ');  readln (nombre) ; 
		while ( (DimL <= DimF) and (nombre <> 'ZZZ' ) ) do 
			begin	
			DimL:= DimL + 1 ; 
			v[DimL]:= nombre; 
			write ('Ingrese un nombre: ');  readln (nombre) ; 
			end; 
end; 
{b. Lea un nombre y elimine la primera ocurrencia de dicho nombre en el vector.}
procedure BorrarElemento (var v: vector; var DimL : integer ); 
var
Posicion, i : integer;
pude: boolean ; 
begin
Posicion:= 1 ; 
pude:= false; 
	// como nos pide realizar todas las validaciones necesarias, vamos a hacerlo preguntado y validando todo
if  (Posicion >= 1 )  and  (Posicion <= DimL )  then
	begin
		for i:= Posicion to ( DimL - 1 ) do 
			v[i] := v[i + 1 ] ; 
	
			pude:= true; 
			DimL:= (DimL - 1) 
	end; 

if( pude = false)  then 
writeln ('No se puede eliminar la primer posicion del vector') ; 

end;

procedure MostrarElementosVector (v: vector; DimL : integer) ; 
var
i: integer; 
begin
	for i:= 1 to DimL do 
		begin
			write ('En la posicion ',i,' se cargo el nombre ',v[i]) ; 
					writeln ; 
		end; 
end;

// Lea un nombre y lo inserte en la posición 4 del vector.
procedure insertarPos (var v: vector; DimL: integer) ; 
var
pos: integer; 
nombre: string; 
pude: boolean ; 
i: integer; 
begin
pude:= false; 
pos:= 4; 

	if DimL >= 4 then 
		begin
			write ('Ingrese un nombre para insertar en el vector en la posicion 4: ') ; readln (nombre) ;  

					saltodeLinea ; 


			if (DimL + 1 <= DimF) and (pos <= DimL) and (pos >= 1) then begin 
					for i:= DimL downto pos do 
							v[DimL + 1 ]:= v[DimL]; 
									pude:= true; 	
											v[pos]:= nombre; 
													DimL:= DimL + 1 ; 		
		end; 
		
				if (pude = false) then 
							writeln ('No se puede insertar el nombre en la pos ',pos) ; 
		end; 

end; 


procedure AgregarElemento (var v: vector ; var DimL : integer ) ; 
var
pude: boolean ; 
nombre: string;  
begin
	pude:= false; 
		SaltoDeLinea ;
						write ('Ingresa un nombre para agregar al vector : ') ; readln (nombre); 
				if ( (DimL + 1) <= DimF ) then 
							begin
									pude:= true ; 
										DimL := DimL + 1 ; 
												v[DimL]:= nombre; 
							 end;
	  
	  SaltoDeLinea ; 
				if (pude = true )then begin 
							writeln ('El vector con el nombre ',nombre, ' en la posicion ',DimL, ' quedaria asi: ' ) ; 
						writeln  
					end
						else
							writeln ('No se pudo agregar el nombre, porque no hay mas lugar en el vector '); 
 
end ; 

// prog princ	
var 
v: vector ;
DimL : integer;
begin
CargarVector (v,DimF,DimL) ; 


saltodeLinea ; 
	
// muestro el vector con todos los elementos cargados 
writeln ('El vector con todos los elementos cargados queda asi: '); 
writeln ; 
MostrarElementosVector (v,DimL); 

saltodeLinea; 

//inciso b: Borrar primera posicion del vector 
BorrarElemento (v,DimL) ; 
writeln  ('El vector con la primera ocurrencia eliminada queda asi:  '  ); 
writeln; 
MostrarElementosVector (v,DimL); 

saltodeLinea ;

//inciso c : Lea un nombre y lo inserte en la posición 4 del vector.
insertarPos (v, DimL); 
writeln ('El vector con el nombre ingresado, insertado en la posicion 4 queda asi: '); 
writeln ; 
MostrarElementosVector (v,DimL); 

// inciso d : Lea un nombre y lo agregue al vector. 
writeln ('El vector con un nombre leido por teclado, y agregado al vector queda asi: ') ; 
AgregarElemento (v,DimL) ; 
MostrarElementosVector (v,DimL) ; 
SaltoDeLinea; 
end. 	
