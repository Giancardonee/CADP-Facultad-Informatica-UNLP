{Realizar un programa que lea un carácter, que puede ser “+” (suma) o “-” (resta); si se ingresa otro
carácter, debe informar un error y finalizar. Una vez leído el carácter de suma o resta, deberá leerse
una secuencia de números enteros que finaliza con 0. El programa deberá aplicar la operación leída
con la secuencia de números, e imprimir el resultado final.
Por ejemplo}

{ Si se lee el carácter “-” y la secuencia    4 3 5 -6 0 , deberá imprimir: 2 (4 – 3 – 5 - (-6) )
 Si se lee el carácter “+” y la secuencia    -10 5 6 -1 0, deberá imprimir 0 ( -10 + 5 + 6 + (-1) )}
 
 
program  eje8_prac1; 
var
simbolo: char ;
sumar_car: real ; 
restar_car: real;
num: real ; 

begin
	sumar_car:= 0 ; 
	restar_car:= 0 ; 
	
		write('Ingrese un caracter : ') ;
				readln (simbolo) ; 
		if simbolo = '-' then 
			begin
			readln (num) ; 
					while num <> 0 do 
							begin
							restar_car:= restar_car - num ; 	
						readln (num) ;
					
							end;
					writeln('El resultado es : ',restar_car:2:0) ; 
					
			end; 

		if simbolo = '+' then
			begin
			readln(num) ; 
					while num <> 0 do 
								begin
					sumar_car:= sumar_car + num ;
					              readln(num) ; 
					        
								end;
					writeln('El resultado es: ',sumar_car:2:0) ; 
			
			end;

end. 
