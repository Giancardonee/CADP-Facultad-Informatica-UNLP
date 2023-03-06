{8. Realizar un programa que lea y almacene la información de 400 alumnos ingresantes a la Facultad de
Informática de la UNLP en el año 2020. De cada alumno se lee: nro de inscripción, DNI, apellido, nombre y
año de nacimiento. Una vez leída y almacenada toda la información, calcular e informar:
a) El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.
b) Apellido y nombre de los dos alumnos de mayor edad.}

program eje8prac4; 

const
	DimF = 5; 

type 
		Alumno = record 
				Nro_inscripcion: integer;
				Dni: integer;
				Apellido: string;
				Nombre:string; 
				AnioNacimiento:integer; 
		end;
	vector = array [1..DimF] of Alumno ; 
	
procedure CargarVector (var v:vector  ) ; 
var
i: integer; 
begin
		//Vamos a cargar el vector con la informacion requerida 
			for i:= 1 to DimF do 
				begin
					writeln ('- - - - - - - - - - - - - - - - - - - -'); 
						write ('Ingrese el numero de inscripcion: '); readln (v[i].Nro_inscripcion); 
							write ('Ingrese su DNI: '); readln (v[i].Dni); 
								write ('Ingrese su apellido: '); readln (v[i].Apellido);
						write('Ingrese su nombre: '); readln (v[i].Nombre); 
					write('Ingrese su anio de nacimiento: '); readln (v[i].AnioNacimiento);
						writeln ;
				end;
end;	


//a) El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.		
function porcentajeDniPar(v: vector): real; 
var
dig:integer;
cantPares:integer; 
i: integer;
numero:integer;
ok:boolean;
begin
cantPares:= 0; 

		for i := 1 to DimF do
				begin
					numero := v[i].Dni;
					  ok := true;
										
							while (numero <> 0) and (ok = true) do 
										begin
														dig := numero mod 10; // me traigo el resto del numero (para en la siguiente linea saber si es par o impar)
															if (dig mod 2) = 1 then
																ok := false; // si un dígito es impar, ya no podra ser DNI con todos digitos pares
														numero := numero div 10;  //descompongo el numero
										end; // fin del while
												
							if ok = true then   
							cantPares := cantPares + 1;
				end; // fin del for
  
  porcentajeDniPar := (cantPares / DimF) * 100; // convertir a porcentaje
		
end;// fin de la function
		
//b) Apellido y nombre de los dos alumnos de mayor edad.}
procedure AlumnosMayorEdad(v:vector); 
var
max1,max2: integer;
apellidoMax1, apellidoMax2: string; 
nombreMax1, nombreMax2: string; 
i: integer;
begin
{en este procedure, el maximo decimos que es el año 9999, esto se va a ir actualizando
a medida que se encuentren años menores, es decir, a menor año, mayor edad. 
esto queda un poco raro, porque estariamos sacando un maximo al reves. 
Lo conveniente es usar edades, en vez de años, pero bueno el ejercicio nos pide ingresar el año de nacimiento} 
		max1:= 9999 ;  
		max2:= 9999; 
		
		apellidoMax1 := '';
		apellidoMax2 := '';
		nombreMax1 := '';
		nombreMax2 := '';
		
		
					for i:= 1 to DimF do 
						begin 
											if v[i].AnioNacimiento < max1 then 
												begin
														max2:= max1; 
														max1:= v[i].AnioNacimiento; 
														 apellidoMax2 := apellidoMax1;
														apellidoMax1 := v[i].Apellido;
														nombreMax2 := nombreMax1;
														nombreMax1 := v[i].Nombre;
												end
												else if v[i].AnioNacimiento < max2 then 
													begin
															max2 := v[i].AnioNacimiento;
															apellidoMax2 := v[i].Apellido;
															nombreMax2 := v[i].Nombre;
													end;
						end;// fin del for
						
					writeln ('El nombre y apellido de las personas con mayor edad son:'); 
						writeln ('(1) ',nombreMax1, ' ' ,apellidoMax1); 
						writeln ('(2) ',nombreMax2, ' ',apellidoMax2); 
end;// fin del procedimiento


var
v:vector;
begin
CargarVector(v); 
writeln ('El porcentaje de alumnos con DNI par es: ',porcentajeDniPar(v):2:2); 
AlumnosMayorEdad(v); 
end.		
		
