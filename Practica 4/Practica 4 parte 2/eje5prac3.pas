{Realizar un programa que lea información de autos que están a la venta en una concesionaria. De cada auto se lee:
marca, modelo y precio. La lectura finaliza cuando se ingresa la marca “ZZZ” que no debe procesarse. La
información se ingresa ordenada por marca. Se pide calcular e informar:
a. El precio promedio por marca.
b. Marca y modelo del auto más caro.}

program eje5prac3; 
type
	Autos = record 
			Marca: string ; 
			Modelo: string; 
			Precio: real; 
	end;

{Leo datos, mientras que la marca sea distinta de ZZZ, y mientras que la marca sea igual a la marca actual: }
{Debo calcular precio promedio de la marca (cuento cantidad de autos, y sumo los precios)}
{debo ir actualizando un maximo, segun el precio del auto mas caro, Me debe decir la marca y el modelo.}

procedure ActualizarMax(dato1:Autos; var MarcaMax: string ; var ModeloMax: strng) ;
begin


end; 

procedure LeerDatos(var dato:Autos);
begin
		write ('------> Ingrese la marca del auto: '); readln (dato.Marca); 
		write('-------> Ingrese el modelo del auto: '); readln (dato.Modelo);  
		write('--------> Ingrese el precio del auto: '); readln (dato.Precio);
end; 






var
Datos:Autos;
begin
Datos.Marca:= ' '; 
while Datos.Marca <> 'ZZZ' do 
	begin
		LeerDatos(Datos); 
	
	
	
	
	end; 




end.













{procedure LeerDatos (var dato:Autos); 
var
MarcaActual: string; 
begin
		write('Ingrese la marca del auto: '); readln(dato.Marca) ;
				while dato.Marca <> 'ZZZ' do 
					begin
						MarcaActual:= dato.Marca; 
							write('Ingrese el modelo del auto: '); readln(dato.Modelo); 
									write('Ingrese el precio del auto: '); readln(dato.Precio); 
											while MarcaActual = dato.Marca do 
													begin
																write('Ingrese la marca del auto: '); readln(dato.Marca) ;
																		if MarcaActual = dato.Marca then 
																			begin
																					write('Ingrese el modelo del auto: '); readln(dato.Modelo); 
																						write('Ingrese el precio del auto: '); readln(dato.Precio); 
																			end; 
													end; // end segundo while
													writeln; 
															writeln('Se terminaron de leer los datos de la marca ',MarcaActual);
													writeln; 
					end;  // end primer while
					

end; // end procedure

}
