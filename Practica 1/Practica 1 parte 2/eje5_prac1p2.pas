{Realizar un programa que lea números enteros desde teclado. La lectura debe finalizar cuando se
ingrese el número 100, el cual debe procesarse. Informar en pantalla:
◦ El número máximo leído.
◦ El número mínimo leído.
◦ La suma total de los números leídos.}

program eje5prac1p2; 

var
suma: integer; 
min: integer; 
max: integer ; 
num: integer; 

begin
	suma:= 0 ; 
	min:= 9999;
	max:= -1 ; 
	
	repeat 
	
	write('Ingrese un numero entero: ') ; 
			readln(num) ; 
			
			if num > max then 
			max:= num 
			else 
			if num < min then
			min:= num ; 
	
		suma:= suma + num; 
	
	until num = 100; 

writeln ('El numero minimo leido fue: ',min); 
writeln ('El numero maximo leido fue: ',max) ; 
writeln ('La suma total de los numeros leidos es: ' ,suma) ; 
end.
