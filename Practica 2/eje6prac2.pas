{6. a. Realice un módulo que lea de teclado números enteros hasta que llegue un valor negativo. Al finalizar la
lectura el módulo debe imprimir en pantalla cuál fue el número par más alto.
b. Implemente un programa que invoque al módulo del inciso a.}

program eje6prac2; 

function ParMasAlto: integer ; 
var
numero: integer ; 
max: integer ; 

begin
max:= -1 ; 

		repeat 
				write ('Ingrese un numero entero: ') ; 
					readln(numero) ; 
				
					if ((numero MOD 2) = 0) THEN
						begin
						
					if numero > max THEN 	
							max:= numero ; 
						end; 
		until numero < 0 ;
				writeln ('El numero pas mas alto fue: ', max) ; 
	end; 

begin
ParMasAlto ; 
end.
