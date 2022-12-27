{Realizar un programa que lea información de 200 productos de un supermercado. De cada producto
se lee código y precio (cada código es un número entre 1 y 200). Informar en pantalla:
- Los códigos de los dos productos más baratos
La cantidad de productos de más de 16 pesos con código par } 


// en este programa se van a leer 5 productos en vez de 200  
program eje6prac1p2; 
type
rango = 1..200;

var
codigo: rango;  
precio: real ; 
min1, min2: real; 
cantProd: integer; 
i: integer ; 
cod1, cod2: integer; 
begin	

	min1:= 9999;
	min2:= 9999; 
	cantProd:= 0 ; 
		for i:= 1 to 5 do
			begin			
					write('Ingrese el codigo del producto: ') ; 
							readln (codigo) ; 
					write('Ingrese el precio del producto: '); 
							readln(precio) ; 
				if precio < min1 then
				begin
				min2:= min1 ;
				min1:= precio ; 
				cod1:= codigo ;
				end
				else
				if precio < min2 then
						begin 
					min2:= precio ; 			
					cod2:= codigo 	; 	
						end;
						
				if (precio > 16)  and (codigo MOD 2 = 0) then
							cantProd:= cantProd + 1 ; 
						
						writeln() ; 
				end;
		
	writeln('Los codigos de los dos productos mas baratos son: ',cod1, ' y ' ,cod2) ;
		writeln () ; //salto de linea
	writeln('La cantidad de productos de más de 16 pesos con código par es: ',cantProd); 


end.
