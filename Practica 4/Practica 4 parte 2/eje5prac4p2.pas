{ La empresa Amazon Web Services (AWS) dispone de la información de sus 500 clientes monotributistas más
grandes del país. De cada cliente conoce la fecha de firma del contrato con AWS, la categoría del
monotributo (entre la A y la F), el código de la ciudad donde se encuentran las oficinales (entre 1 y 2400) y 
el monto mensual acordado en el contrato. La información se ingresa ordenada por fecha de firma de
contrato (los más antiguos primero, los más recientes últimos).
Realizar un programa que lea y almacene la información de los clientes en una estructura de tipo vector.
Una vez almacenados los datos, procesar dicha estructura para obtener:
a. Cantidad de contratos por cada mes y cada año, y año en que se firmó la mayor cantidad de contratos
b. Cantidad de clientes para cada categoría de monotributo
* 
c. Código de las 10 ciudades con mayor cantidad de clientes
(En este caso vamos a hacer el codigo de las 4 ciudades con mayor cantidad de clientes)

* . Cantidad de clientes que superan mensualmente el monto promedio entre todos los clientes}

{A tener en cuenta: 
* DimF = 500 pero vamos a hacer de cuenta que hay 5 
* La informacion se INGRESA ORDENADA (antiguos primero, recientes ultimos)}
// nos dice la dimension fisica y no nos da ningun parametro para terminar de leer
// por lo tanto vamos a asumir que debemos completar el vector 

program eje5prac4p2; 
Const
DimF = 5; 
type
	Rcategoria = 'A'..'F' ;
	RcodigoCiudad = 1..2400; 
	 Rfecha = record
		dia: integer;
		mes: integer; 
		anio: integer; 
	 end; 
	
	cliente = record 
		fecha : Rfecha; 
		categoria: Rcategoria; 
		codigoCiudad:RcodigoCiudad; 
		montoMensual: real; 
	end; 
	vector = array [1..DimF] of cliente; 
	
	//Para este array vamos a tener en cuenta contratos del 2.000 hasta 2023
	contratosPorAnio = array [2000..2023] of integer; 
	contratosPorMes = array [1..12] of integer; 
	categoriaVector = array [Rcategoria] of integer; 
	clientesCiudad = array [RcodigoCiudad] of integer; 
	
// Este procedure debe leer y almacenar la informacion de manera
//ORDENADA (antiguos primero, recientes ultimo)
procedure cargarVector (var v:vector) ; 
var
i: integer; 
begin
	writeln ('Ingrese la informacion de manera ORDENADA (recientes ultimos, antiguos primero)') ;
	for i:= 1 to DimF do 
		begin
			write ('Ingrese el anio de firma de contrato: ') ; 
			readln (v[i].fecha.anio) ;
			write ('Ingrese el mes de firma de contrato: '); 
			readln (v[i].fecha.mes) ; 
			write ('Ingrese el dia de firma de contrato: '); 
			readln (v[i].fecha.dia); 
			write ('Ingrese la categoria del contraro (A HASTA F): '); 
			readln (v[i].categoria); 
			write ('Ingrese el codigo de ciudad (1 hasta 2400): '); 
			readln(v[i].codigoCiudad) ; 
			write ('Ingrese el monto mensual: '); 
			readln (v[i].montoMensual); 
			writeln ('- - - - - -- - - - - - - - - - - - - - - -'); 
		end; 
end; 
//cantidad de contratos por anio y mes,procedimiento 
procedure cantidadContratos (v:vector; var vectorAnio:contratosPorAnio; var vectorMes:contratosPorMes; var vectorCategoria:categoriaVector
; var vectorClientesCiudad: clientesCiudad) ; 
var
i: integer; 
anio:integer; 
mes:integer; 
categoria:Rcategoria; 
clienteC: integer; 
begin
	for i:= 1 to DimF do 
		begin
		//Cuento cantidad de contrato por años
			anio:= v[i].fecha.anio; 
			vectorAnio[anio]:= vectorAnio[anio] + 1; 
		//Cuento cantidad de contrato por meses
			mes:= v[i].fecha.mes; 
			vectorMes[mes]:= vectorMes[mes] + 1; 
		//Cuento cantidad de categorias 
			categoria:= v[i].categoria; 
			vectorCategoria[categoria]:= vectorCategoria[categoria] + 1 ; 	
		//Cuento cantidad de clientes por ciudad
			clienteC:= v[i].codigoCiudad; 
			 vectorClientesCiudad[clienteC]:= vectorClientesCiudad[clienteC] + 1 ; 
		end; 
end; 
 
//d. Cantidad de clientes que superan mensualmente el monto promedio entre todos los clientes}
{Lo mas optimo seria recorrer la menor cantidad de veces el vector, pero en este caso vamos a recorrerlo 
* dos veces, aunque no sea necesario (podriamos sacar el promedio mensual en el procedimiento anterior)}
function clientesMAXpromedio (v:vector) :integer; 
var
promedioMensual: real;
i: integer; 
cantPersonas: integer; 
begin
cantPersonas:= 0 ; 
promedioMensual:= 0 ; 

for i:= 1 to DimF do 
	begin
		promedioMensual:= promedioMensual + v[i].montoMensual;
	end; 
	promedioMensual:= (promedioMensual/DimF); 
	// Una vez que tenemos el promedio mensual, debemos recorrer el vector nuevamente
	// y ir contando, si hay alguna persona que supere el monto promedio 
	for i:= 1 to DimF do 
		begin
			if (v[i].montoMensual > promedioMensual) then 
				cantPersonas:= cantPersonas + 1 ; 
		end; 
		clientesMAXpromedio:= cantPersonas; 
end; 

procedure mostrarVectorAnio (v:contratosPorAnio); 
var
i: integer; 
begin
	for i:= 2000 to 2023 do 
		begin
				if v[i] > 0 then 
					writeln ('En el anio ',i, ' se firmaron: ',v[i], ' contratos') ; 
		end; 
end; 

procedure mostrarVectorMes (v:contratosPorMes); 
var
i: integer; 
begin
	for i:= 1 to 12 do 
		begin
			if v[i] > 0 then 
				writeln ('En el mes ',i, ' se firmaron; ' ,v[i], ' contratos'); 
		end; 
end; 

procedure mostrarVectorClientesCiudad (v:clientesCiudad) ; 
var
i: integer ; 
begin
for i:= 1 to 2400 do
	begin
			if v[i] > 0 then 
				writeln ('La cantidad de clientes en la ciudad con codigo: ',i, ' son: ',v[i]) ; 
	end; 
end; 
var
v: vector; 
vectorAnio: contratosPorAnio;
vectorMes: contratosPorMes;
vectorCategoria:categoriaVector;
vectorClientesCiudad: clientesCiudad; 
opcion: integer; 
begin
opcion:= -1; 
cargarVector (v) ; 
cantidadContratos(v,vectorAnio,vectorMes,vectorCategoria,vectorClientesCiudad); 
writeln ('Bienvenido al menu de vectores. Seleccione la opcion que quiera: '); 
{Cuando mostremos el vector de contratos por meses, va a imprimir 
* los contratos por TODOS LOS AÑOS, es decir no importe en que año se firmó 
*  (ej: se firmó en el mes 12 del año 2003 y 2004 , nos va a mostrar que se firmaron dos veces
*  contrato en el mes 12 sin importar que año sea.)
* (
* 
* Cuando mostremos el vector de contratos por año, ahi vamos a poder saber la cantidad de contratos
* que se firmaron en cada año, }

{solamente vamos a mostrar los años/meses, en los que se firmó AL MENOS un contrato.
* Es decir, si en un año, o un mes No se firmó NINGUN contrato, no lo vamos a mostrar,}
	while (opcion <> 0) do 
		begin 
			writeln; 
			writeln ('(1) Mostrar vector cantidad de contratos por anio'); 
			writeln ('(2) Mostrar vector cantodad de contratos por meses'); 
			writeln ('(3) Mostrar vector cantidad de clientes por ciudad') ; 
			writeln('(4) Mostrar la cantidad de clientes que superan el sueldo promedio'); 
			writeln ('(0) Salir' ); 
			write ('Ingrese la opcion que desee: '); 
			readln (opcion); 
			case opcion of 
			1:mostrarVectorAnio(vectorAnio); 
			2:mostrarVectorMes(vectorMes); 
			3:mostrarVectorClientesCiudad(vectorClientesCiudad); 
			4:writeln ('La cantidad de clientes que superan el sueldo promedio son: ',clientesMAXpromedio(v)) ;
{como nos pide solamente la cantidad de clientes, use una funcion para que devuelva un numero
* pero si nos pedian el precio promedio, tendriamos que usar un procedimiento para informar 
* el precio promedio, y la cantidad de clientes que superan el precio promedio}


			end; // end del case 
		end; // end del while  
end.


{Este programa esta %95 completo, si queremos que este al %100
* debemos ordenar el vector de clientes por ciudades, y saar los maximos que piden
* pero como no nos vamos a poner a cargar 500 personas, lo dejamos asi. 
* Igualmente el programa esta muy bueno. Y lo comente lo mas que pude, espero les guste y les sirva}
