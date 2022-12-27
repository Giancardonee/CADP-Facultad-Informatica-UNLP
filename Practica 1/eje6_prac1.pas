{Realizar un programa que lea el número de legajo y el promedio de cada alumno de la facultad. La
lectura finaliza cuando se ingresa el legajo -1, que no debe procesarse.  }

program eje6_prac1; 

var
legajo: integer ; 
promedio: real ; 
begin
	write('ingrese su legajo : ') ; 
		readln(legajo);
	write('ingrese su promedio: '); 
		readln(promedio) ; 	
while (legajo <> -1)  do 
		begin
			write('ingrese su legajo : ') ; 
		readln(legajo);
	if legajo <> -1 then 
		begin			
	write('ingrese su promedio: '); 
		readln(promedio) ; 	
		
		end; 
            end; 
end. 
