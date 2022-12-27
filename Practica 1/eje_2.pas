{2. Realizar un programa que lea un número real e imprima su valor absoluto. El valor absoluto de un
número X, se escribe |X| y se define como:
|X| = X cuando X es mayor o igual a cero
|X| = -X cuando X es menor a cero }

program  eje2_prac1;   

var
num: Real;

begin
	write('ingrese un numero: ') ; 
		readln (num); 
		
	if num> 0 then 
					begin
					writeln(num) ;
					end
			else 
					begin
					writeln(-1* num:0:0);
					end; 
			
end.

