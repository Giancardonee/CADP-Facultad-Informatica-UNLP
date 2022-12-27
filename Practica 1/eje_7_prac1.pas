{Realizar un programa que lea tres caracteres e informe si los tres eran letras vocales o si al menos uno de ellos no lo era}

program eje7prac1 ; 
//// para usar con type [ RANGO]

{type
	abcedario = 'a'..'z' ; 
		contar= 0..3 ; 
		

var
	letra1, letra2, letra3:  abcedario; 
		contador: contar ; 
}

var
letra1,letra2,letra3: char; 
contador: integer ; 

begin
	contador:= 0 ; 
		
		write('Ingrese el primer caracter:  ') ; 
				readln(letra1) ; 
		write('Ingrese el segundo caracter:  ') ;
				readln (letra2) ; 
		write('Ingrese el tercer caracter:  ') ; 
				readln (letra3) ; 
		
		
		if (letra1 = 'a')  or  (letra1 = 'e')  or      (letra1 = 'i')  or  (letra1 = 'o') or (letra1 = 'u') then  
					begin 
					 contador:= contador + 1 ; 
					end;
					
			if (letra2 = 'a')  or  (letra2 = 'e')  or      (letra2 = 'i')  or  (letra2 = 'o') or (letra2 = 'u') then  
					begin 
					 contador:= contador + 1 ; 
				end;
				
			if (letra3 = 'a')  or  (letra3 = 'e')  or      (letra3 = 'i')  or  (letra3 = 'o') or (letra3 = 'u') then  
					begin 
					 contador:= contador + 1 ; 
					end;
		
		if contador = 3 then 
				writeln ('Los tres caracteres son vocales ') 
				
		else
				writeln ('Al menos un caracter no era vocal') ;
									
					
end.
