{Un local de ropa desea analizar las ventas realizadas en el último mes. Para ello se lee por cada día
del mes, los montos de las ventas realizadas. La lectura de montos para cada día finaliza cuando se
lee el monto 0. Se asume un mes de 31 días. Informar la cantidad de ventas por cada día, y el monto
total acumulado en ventas de todo el mes.
a) Modifique el ejercicio anterior para que además informe el día en el que se realizó la
mayor cantidad de ventas.}


program eje8prac1p2; 

var
monto: real ; 
montoTotal: real; 
CantVentasDia: integer ; 
i: integer ; 
max: integer ; 
DiaMasVentas: integer ; 
begin 
max:= -1 ; 
montoTotal:= 0 ;
CantVentasDia:= 0 ; 
DiaMasVentas:= 0 ; 
	for i:= 1 to 31 do
			begin
			CantVentasDia:= 0 ; 
				repeat 
						
						write('Ingrese el monto del dia ',i ,' : ') ;
								readln(monto) ; 
						
						montoTotal:= montoTotal+ monto ; 				
									
						if monto <> 0 then 
							CantVentasDia:= CantVentasDia + 1; 
										
						if CantVentasDia > max then 
											begin
											max:= CantVentasDia ; 
											DiaMasVentas:= i ; 	
											end;
			
			until monto = 0 ; 
			
				writeln('En el dia ',i, ' se realizaron ',CantVentasDia, ' ventas ' ) ; 
					
			end;
		writeln() ; 
		writeln ('El monto total acumulado en el mes es de:',montoTotal:8:2, ' pesos' ) ; 
				writeln() ; 
				writeln ('El dia con mas ventas del mes fue el dia ',DiaMasVentas) ; 

end. 
