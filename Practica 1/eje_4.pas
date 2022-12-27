{4. Realizar un programa que lea un número real X. Luego, deberá leer 10 números reales hasta que se
ingrese uno cuyo valor sea exactamente el doble de X (el primer número leído)}
si no se ingreso el doble de X, el programa debera mostrar no se ingreso el doble de: X 

program eje4_prac1;  

var
n1: real; 
n2: real; 
contador: integer; 
begin
contador:= 0 ; 
	write('ingrese un numero: ') ; 
		readln(n1) ; 
		
	n2:= 2*n1 ; 	
		writeln('siga ingresando')
	while (n1<> n2)  and (contador <=10) do 
			begin			 
				
				contador:= contador + 1 ; 
				readln(n1) ; 
            			
			end;
		if (contador = 10) then
						begin
						writeln ('no se ingreso el doble de: ',n1)
						end;
	
end.


