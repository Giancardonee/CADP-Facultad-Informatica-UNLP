{Realice un programa que lea 10 números e informe cuál fue el mayor número leído. Por ejemplo, si
se lee la secuencia:
3 5 6 2 3 10 98 8 -12 9
deberá informar: “El mayor número leído fue el 98”} 

{a. Modifique el programa anterior para que, además de informar el mayor número leído, se
informe el número de orden, dentro de la secuencia, en el que fue leído. Por ejemplo, si se lee la
misma secuencia:
3 5 6 2 3 10 98 8 -12 9
deberá informar: “El mayor número leído fue el 98, en la posición 7”
* }
program eje2_prac1p2 ; 

var
i, max, num : integer ; 
posicion: integer ; 
begin
	max:= -1 ; 
	posicion:= 0 ;
		for i := 1 to 3 do 
				begin
					write('Ingrese un numero entero: ') ; 
							readln (num) ; 
								
					if num> max Then
					begin
						max:= num ; 
						posicion:= i ; 
						end;
				end;
// si se ingresan los numeros del ejemplo. el programa imprime 98

		writeln('El mayor numero leido fue: ' ,max, ' en la posicion ',posicion); 

end.
