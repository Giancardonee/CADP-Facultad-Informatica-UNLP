{4. Una compañía de telefonía celular debe realizar la facturación mensual de sus 9300 clientes con planes de
consumo ilimitados (clientes que pagan por lo que consumen). Para cada cliente se conoce su código de cliente y
cantidad de líneas a su nombre. De cada línea se tiene el número de teléfono, la cantidad de minutos consumidos
y la cantidad de MB consumidos en el mes. Se pide implementar un programa que lea los datos de los clientes de
la compañía e informe el monto total a facturar para cada uno. Para ello, se requiere:
a. Realizar un módulo que lea la información de una línea de teléfono.
b. Realizar un módulo que reciba los datos de un cliente, lea la información de todas sus líneas (utilizando el
módulo desarrollado en el inciso a. ) y retorne la cantidad total de minutos y la cantidad total de MB a facturar
del cliente.
Nota: para realizar los cálculos tener en cuenta que cada minuto cuesta $3,40 y cada MB consumido cuesta $1,35.}

program eje4prac3;

type
	
	cliente= record
			Codigo: integer ; 
			CantLineas: integer ; 
			Minutos: real; 
			MB: real ; 
			numero_linea: integer ; 
	end; 

procedure LeerDatos1 (var dato:cliente) ; 
begin
	write('Ingrese el codigo de cliente: ') ;
			readln (dato.codigo); 
		write ('Ingrese la cantidad de lineas que posee: '); 
				readln(dato.CantLineas) ;
					write('ingrese el numero de linea: '); 
						readln(dato.numero_linea) ; 
							writeln; // salto de linea 
end; 

procedure LeerDatos2(var dato1: cliente) ; 
begin
		write ('Ingrese la cantidad de minutos consumidos de la linea ');
				readln (dato1.minutos);
					write('Ingrese la cantidad de MB consumidos: '); 
							readln (dato1.MB) ; 
							
							writeln; // salto de linea
end; 

procedure Facturar1 (var dato2: cliente) ; 
var
AbonoTotal: real; 
AbonoMinutos: real; 
AbonoMB: real; 
begin
	AbonoTotal:= 0 ; 
	AbonoMinutos:= 3.40 ;
	AbonoMB:= 1.40 ;  
	
		if dato2.CantLineas = 1 THEN 
			begin				
			writeln ('Los montos a abonar por la linea ',dato2.numero_linea, ' serian:') ; 
					AbonoMinutos:= AbonoMinutos *dato2.Minutos; 
						AbonoMB:= AbonoMB * dato2.MB ; 
					AbonoTotal:= AbonoMB + AbonoMinutos; 
					writeln; 
				writeln ('Por minutos: ',AbonoMinutos:2:2); 
					writeln ('Por MB: ',AbonoMB:2:2) ; 
						writeln ('Su total a abonar es: ',AbonoTotal:2:2)  		;
					 writeln; 
			end; 
end;

procedure Facturar2 (var dato3:cliente; var i: integer  );


var
AbonoTotal: real; 
AbonoMinutos: real; 
AbonoMB: real; 
begin
	AbonoTotal:= 0 ; 
	AbonoMinutos:= 3.40 ;
	AbonoMB:= 1.40 ;  
	
		if dato3.CantLineas >1 THEN 
			begin				
			writeln ('Los montos a abonar por la linea ',i, ' son:') ; 
					AbonoMinutos:= AbonoMinutos *dato3.Minutos; 
						AbonoMB:= AbonoMB * dato3.MB ; 
					AbonoTotal:= AbonoMB + AbonoMinutos; 
					writeln; 
				writeln ('Por minutos: ',AbonoMinutos:2:2); 
					writeln ('Por MB: ',AbonoMB:2:2) ; 
						writeln ('Su total a abonar es: ',AbonoTotal:2:2) ; 		
					writeln ; 
		end; 
end; 
var
DatosClientes: cliente; 
i: integer ; 
i2: integer; 
begin
LeerDatos1 (DatosClientes) ;
for i := 1 to DatosClientes.CantLineas do
	begin
		 	LeerDatos2 (DatosClientes) ; 
		 	Facturar1 (DatosClientes);
		 	i2:= i ;  
			Facturar2 (DatosClientes,i2); 
	end; 
end.
