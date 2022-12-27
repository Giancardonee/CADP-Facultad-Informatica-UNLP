{Realizar un programa que lea 10 números enteros e informe la suma total de los números leídos.
a. Modifique el ejercicio 1 para que además informe la cantidad de números mayores a 5}


program eje1prac_1p2 ; 

var
	i: integer; 
resultado,num: integer;
res_mayor5: integer ;
begin
	resultado:= 0 ; 
	res_mayor5:= 0 ;
	
		for i := 1 to 10 do
			begin
						write('Ingrese un numero entero: ') ;
								readln(num) ; 
						resultado:= resultado+num ; 
					
					if num> 5 then
					res_mayor5:= res_mayor5 + num ;
					
				end; 
		writeln('La suma de los numeros ingresados es:  ',resultado) ; 
				writeln() ; 
		 writeln('La suma de los numeros ingresados MAYORES A 5 son:  ',res_mayor5) ;
	
	
end.
