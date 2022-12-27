
{10. Realizar un programa modularizado que lea secuencia de números enteros. La lectura finaliza cuando llega el número 123456
 el cual no debe procesarse. Informar en pantalla para cada número la suma de sus dígitos pares y la cantidad de dígitos impares que posee. }

program Pares_imparesss; 

procedure Digitos_pares_impares (numero: integer; var Dig_impares, SumaDig_pares : integer ) ; 
var
digito: integer ; 

begin
	SumaDig_pares:= 0 ; 
	while numero <> 0 do 
		begin
			digito:= numero MOD 10 ; 
				
					if ((digito MOD 2) = 0) THEN 
							SumaDig_pares:= SumaDig_pares + digito 
						else
							Dig_impares:= Dig_impares + 1;
									
							/// descomponemos un digito del num : 
							numero:= numero DIV 10 ; 
		end;

end; 




var
numero, Dig_impares, SumaDig_pares: integer ; 
begin

	write('Ingrese un numero: ') ; 
		readln(numero) ;  
			while numero <> 1234 do
					begin
									Dig_impares:= 0 ; 					
									SumaDig_pares:= 0 ; 
									Digitos_pares_impares (numero, Dig_impares, SumaDig_pares) ; 
						writeln('La cantidad de digitos impares del numero ',numero, ' es: ',Dig_impares) ; 
						writeln('La suma de sus digitos pares del numero ',numero, ' es: ',SumaDig_pares); 
					
										writeln(); 
					
						write('Ingrese otro numero: '); 
							      		readln(numero) ; 
					end;
end.

