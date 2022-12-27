program eje4_prac1; 

var
num_ingresado: integer ; 
doble_num: integer ; 
contador: integer ; 
begin
contador:= 0 ; 
	writeln('Ingrese un numero real:  ') ;
			readln(num_ingresado) ;
doble_num:= num_ingresado*2;
		while (num_ingresado<> doble_num) and (contador<10) do 
begin 
					begin
							contador:= contador + 1 ; 
								writeln('ingrese un numero ') ; 
									readln(num_ingresado)
					end;
		if contador>10 then 
				writeln('no se ingreso el doble '); 
end;
end.
