{Realizar un programa que lea y almacene el salario de los empleados de una empresa de turismo (a lo
sumo 300 empleados). La carga finaliza cuando se lea el salario 0 (que no debe procesarse) o cuando se
completa el vector. Una vez finalizada la carga de datos se pide:
a) Realizar un módulo que incremente el salario de cada empleado en un 15%. Para ello, implementar un
módulo que reciba como parámetro un valor real X, el vector de valores reales y su dimensión lógica y
retorne el mismo vector en el cual cada elemento fue multiplicado por el valor X.
b) Realizar un módulo que muestre en pantalla el sueldo promedio de los empleados de la empresa. }

program eje10prac4; 

const
  DimF = 300; 
  
type
	vector = array [1..DimF] of real ; 

procedure cargarVector (var v: vector; var DimL: integer) ; 
var
salario: real ; 
begin
	DimL:= 0; 
	salario:= 1; 
	while ((salario >0) and (DimL<= DimF)) do 
		begin
				write ('Ingrese un salario ',(DimL+1),': '); readln (salario); 
					if ( salario > 0) then 
						begin
						DimL:= DimL + 1; 
						v[DimL]:= salario;
						end;
		end;
end; 

{a) Realizar un módulo que incremente el salario de cada empleado en un 15%. Para ello, implementar un
módulo que reciba como parámetro un valor real X, el vector de valores reales y su dimensión lógica y
retorne el mismo vector en el cual cada elemento fue multiplicado por el valor X.} 
procedure incrementarSalario (valorX: real; var v:vector; DimL: integer) ; 
var
i: integer;
begin
	for i:= 1 to DimL do 
		begin
			v[i]:= (v[i] * valorX) ; 
				writeln ('El salario ',i,' incrementado un %15 queda: ' ,v[i]:2:2); 
		end;
end;

//b) Realizar un módulo que muestre en pantalla el sueldo promedio de los empleados de la empresa. }
function SueldosPromedio (v:vector;DimL:integer): real; 
var
i: integer;
sumaSueldos:real; 
begin
	sumaSueldos:= 0 ;
	for i:= 1 to DimL do 
		begin
			sumaSueldos:= sumaSueldos + v[i]; 
		end;
		SueldosPromedio:= (sumaSueldos / DimL) ; 
//Para sacar el promedio, sumamos todos los sueldos de los empleados, y 
//Lo dividimos en la cantidad de empleados (DimL) 
end;


var
v: vector; 
DimL: integer; 
valorX: real;
begin
valorX:= 1.15; 
cargarVector (v,DimL); 
writeln;
incrementarSalario(valorX,v,DimL); 
writeln; 
writeln ('El sueldo promedio de los ',DimL, ' empleados es de $',SueldosPromedio(v,DimL):2:2); 
end.


