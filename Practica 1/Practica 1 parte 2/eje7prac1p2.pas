{7. Realizar un programa que lea desde teclado información de autos de carrera. Para cada uno de los
autos se lee el nombre del piloto y el tiempo total que le tomó finalizar la carrera. En la carrera
participaron 100 autos. Informar en pantalla:
- Los nombres de los dos pilotos que finalizaron en los dos primeros puestos.
- Los nombres de los dos pilotos que finalizaron en los dos últimos puestos.}


// Vamos a hacer de cuenta que participaron 7 pilotos (en este ejemplo)
program eje7prac1_p2 ; 

var
nombre: string ; 
tiempo: real ; 
pilotoMin1: string ; 
pilotoMin2: string ;
pilotoMax1: string ;
pilotoMax2: string ; 
min1,min2, max1,max2: real ; 
i: integer ; 
begin
min1:= 9999;
min2:= 9999;
max1:= -1 ;
max2:= -1 ; 
pilotoMax1:= '' ; ==
		for i:= 1 to 7 do 
				begin
						write('Ingrese el nombre del piloto: ') ; 
								readln(nombre) ; 
						write('Ingrese el tiempo total que le tomo para finalizar la carrera: ') ; 
								readln (tiempo); 
					
						writeln () ; 
					begin
					  //// Aca saco el nombre de los pilotos de los dos primeros puestos. 
						if tiempo < min1 then 
								begin
								min2:= min1 ; 
								min1:= tiempo ; 
									pilotoMin1:= nombre ; 
								end 
								else
						if tiempo < min2  then 
								begin
							min2:= tiempo ; 
							pilotoMin2:= nombre ; 
								end; 
						end; 
						///// arriba calcule los dos minimos
						///// ahora debo calcular los dos maximos, los calculamos de esta manera : 
						
						//// Aca saco el nombre de los pilotos de los dos ultimos puestos. 
							begin
						if tiempo > max1 then 
									begin
								max2:= max1 ; 
								max1:= tiempo ; 
								pilotoMax2:= pilotoMax1 ;
								pilotoMax1:= nombre ;  				
									end
									else
						if tiempo > max2 then 
									begin
									max2:= tiempo;
									pilotoMax2:= nombre ; 
									end; 
								end; 
						
				
				end;
		writeln ('El nombre del piloto del primer puesto es: ',pilotoMin1) ; 
		writeln ('El nombre del piloto del segundo puesto es: ',pilotoMin2) ; 
			writeln () ;
		writeln ('El nombre del piloto del ante-ultimo puesto es: ',pilotoMax2) ;+
		writeln ('El nombre del piloto del ultimo puesto es: ',pilotoMax1) ; 

end.
