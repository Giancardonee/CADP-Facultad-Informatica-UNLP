{4. Realizar un programa que lea 1000 números enteros desde teclado. Informar en pantalla cuáles son
los dos números mínimos leídos.}

// este programa va a leer 5 numeros (en vez de los 1000)) y  va a sacar dos minimos, los cuales seran mostrados en pantalla. 

program eje4_prac1p2 ;  

var
i,num, min1, min2: integer; 

begin 
	min1:= 9999; 
	min2:= 9999; 
	
	for i := 1 to 5 do
		begin
		write('Ingrese un numero entero: ') ; 
			readln(num) ; 
			
				writeln(); // salto de linea
				
				if num < min1 then
						begin
							min2:= min1 ;  
							min1:= num ;
						 end
				else 
				if num < min2 then 
						min2:= num ; 
 
 end; 
	
		writeln ('Los dos numeros minimos leidos fueron: ',min1, ' y ' ,min2) ; 

end.


{a. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer
el número 0, el cual debe procesarse.}

program eje4a_prac1p2; 

var
num, min1, min2: integer; 

begin
	min1:= 9999;
	min2:= 9999; 
	
	repeat 
		   write('Ingrese un numero entero: ');
				readln(num); 
				
				if num < min1 then				
					begin
					min2:= min1; 
					min1:= num; 
					end
				else
				if num < min1 then 
				min2:= num ; 
				
	until (num = 0) ;

	writeln('Los dos numeros minimos leidos fueron: ',min1, ' y ' ,min2) ; 
end.

{Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer
el número 0, el cual no debe procesarse}
 
 
program eje4b_prac1p2; 


var
min1, min2, num: integer ; 

begin
		min1:= 9999;
		min2:= 9999; 
		
		write('Ingrese un numero entero: '); 
			readln (num) ; 
			
		while num <> 0 do 
					begin 
			if num < min1 then 
					begin
					min2:= min1 ; 
					min1:= num ; 
					end;
				if num < min2 then  
				   min2:= num ; 	
					
					
				write('Ingrese un numero entero: ') ; 
					readln(num) ; 				
					end;
			writeln('Los dos numeros minimos leidos fueron: ' ,min1, ' y ' ,min2) ; 
 			
end.
