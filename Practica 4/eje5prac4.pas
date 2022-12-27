{5. Utilizando los módulos implementados en el ejercicio 4, realizar un programa que lea números enteros
desde teclado (a lo sumo 100) y los almacene en un vector. La carga finaliza al leer el número 0. Al finalizar
la carga, se debe intercambiar la posición del mayor elemento por la del menor elemento, e informe la
operación realizada de la siguiente manera: “El elemento máximo ... que se encontraba en la posición ...
fue intercambiado con el elemento mínimo ... que se encontraba en la posición ...”.}

program eje5prac4; 

const 
	DimF = 100 ; 

type 
	vector = array [1..DimF] of integer; 
	
procedure CargarVector (var v: vector; var DimL: integer) ; 
var
num: integer ; 
begin
DimL:= 0 ; 
		write ('Ingrese un numero: ') ;
			readln (num)  ; 
	while (num <> 0)  and (DimL <= 100) do 
		begin
				DimL:= DimL + 1 ; 
					v[DimL]:= num; 
						write ('Ingrese un numero: ') ; 
					readln (num) ; 
		end ; 
end; 

Procedure Intercambiar (v: vector; DimL: integer) ; 
var
i: integer ; 
posicionMin, posicionMax: integer ; 
numeroMin, numeroMax: integer ; 
posMin2: integer; 
begin
posMin2:= 0 ; 
numeroMin:= 9999; 
numeroMax:= -1 ; 
		for i:= 1 to DimL do 
			begin			
	if v[i] > numeroMax then 
				begin
						numeroMax:= v[i] ; 
									posicionMax:= i ; 
						
				
					end ;
					 
	if v[i] < numeroMin then 
				begin
				numeroMin:= v[i] ; 		
							posicionMin:= i ; 
					end; 
			end ; 

	writeln ('El elemento maximo: ',numeroMax, ' que se encontraba en la posicion ',posicionMax  ) ; 
			writeln ('Sera intercambiado con el elemento minimo: ',numeroMin, ' que se encontraba en la posicion ',posicionMin) ; 
			
posicionMin:= posMin2 ; // usamos otra variable para no perder el contenido de posicionMin
											// porque se sobreescribira, intercambiando con la posicionMax 

posicionMin:= posicionMax; 
posicionMax:= posMin2; 



end; 



	var
	v: vector ; 
	DimL: integer; 	
	begin
	CargarVector (v,DimL) ;
	Intercambiar (v,DimL) ; 
	
	
	
	end. 

