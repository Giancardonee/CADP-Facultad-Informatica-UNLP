{10. Realizar un programa que lea y almacene el salario de los empleados de una empresa de turismo (a lo
sumo 300 empleados). La carga finaliza cuando se lea el salario 0 (que no debe procesarse) o cuando se
completa el vector. Una vez finalizada la carga de datos se pide:
a) Realizar un módulo que incremente el salario de cada empleado en un 15%. Para ello, implementar un
módulo que reciba como parámetro un valor real X, el vector de valores reales y su dimensión lógica y
retorne el mismo vector en el cual cada elemento fue multiplicado por el valor X.
b) Realizar un módulo que muestre en pantalla el sueldo promedio de los empleados de la empresa.}


// A lo sumo 300 empleados: (Dimension Fisica 300), (Como maximo 300 empleados) , pueden ser 300 empleados o menos. Pero nunca mas de 300 
// Dimension Logica: Los empleados que se lean. 

program eje10prac4; 
const
	DimF = 300 ; 
type 
	empleados = record 
		Apellido: string ; 
		Salario: real ; 
	end; 

	vector = array [1..DimF] of empleados ; 


procedure subrayar ;  
begin
	writeln ('- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -');
end; 

// Leer datos en vector 
procedure CargarVector (var v: vector; var DimL: integer ; DimF: integer) ; 
var
Apellido: string ;  
salario: real ;
begin
DimL:= 0 ; 
	write ('Ingrese el apellido del empleado: ') ; readln (Apellido) ; 
			write ('Ingrese su salario: ');  readln (salario) ;
					writeln ; // salto de linea 
	while (salario <> 0) and (DimL <= DimF) do 
		begin
			DimL:= DimL + 1 ; 
				v[DimL].Apellido:= Apellido ; 
					v[DimL].Salario := salario ; 
						write ('Ingrese el apellido del empleado: ') ;   readln (Apellido) ; 
							write ('Ingrese su salario: '); 			  readln (salario) ; 
						writeln ; // salto de linea 	
							
		end; 
end;
 
//Modulo que incremente un %15 el salario de todos los empleados leidos. 
// Como no debe retornar nada, solo modificar todos los salarios, usamos un procedimiento. 

procedure incrementarSalarios (var v: vector; DimL: integer; var sueldosTotal: real ); 
var
i : integer; 

begin
	sueldosTotal:= 0; 
	for i := 1 to DimL do 	
		begin
	writeln ; 
		subrayar ;
			writeln ('El salario de la persona ' ,i, ' sin el aumento es: $',v[i].Salario:5:2);
				v[i].Salario:=(( (15/100) * v[i].Salario) + v[i].Salario) ; 
				//subrayar; 
					writeln ('El salario de la persona ' ,i, ' con el %15 de aumento es: $',v[i].Salario:5:2) ; 
								sueldosTotal:= (sueldosTotal + v[i].Salario) ; 
							subrayar ;
		end; 


end; 
// esta funcion calcula el sueldo promedio
function sueldoPromedio	(sueldosTotal: real ; DimL: integer ) : real; 
// para calcular el sueldo promedio debemos saber la cantidad de empleados (DimL) 
// y la suma total de todos los sueldos (sueldosTotal)
begin
	sueldoPromedio:= (sueldosTotal/ DimL) ; 
end; 

var
DimL: integer; 
v: vector ; 
sueldosTotal: real ; 
promedioSueldos: real ; 
begin
CargarVector (v,DimL,DimF) ; 
incrementarSalarios (v,DimL,sueldosTotal) ; 
promedioSueldos:= (sueldoPromedio (sueldosTotal, DimL)); 
	writeln ;  // salto de linea 
	
			// teniendo en cuenta el aumento del %15 : 
writeln ('El sueldo promedio de los empleados es: $',promedioSueldos:5:2 ); 
	
end.
