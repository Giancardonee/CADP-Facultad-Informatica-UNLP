{4. Se dispone de un vector con 100 números enteros. Implementar los siguientes módulos:
a) posicion: dado un número X y el vector de números, retorna la posición del número X en dicho vector,
o el valor -1 en caso de no encontrarse.
b) intercambio: recibe dos valores x e y (entre 1 y 100) y el vector de números, y retorna el mismo vector
donde se intercambiaron los valores de las posiciones x e y.
c) sumaVector: retorna la suma de todos los elementos del vector.
d) promedio: devuelve el valor promedio de los elementos del vector.
e) elementoMaximo: retorna la posición del mayor elemento del vector
f) elementoMinimo: retorna la posicion del menor elemento del vector} 
program eje4prac4; 

const
	constanteMax= 100 ; 
	
type
	rangoMax = 1..100; 
	
	vector = array [1..100] of integer ; 

procedure IngresarNumero (var num: integer) ; 
begin
	write ('Ingrese un numero: '); 
		readln (num) ; 

end; 
	
procedure LeerVector (var v: vector); 
var
i: integer;  
rango: rangoMax ; 
begin
	for i:= 1 to constanteMax do 
		begin
		v[i]:= (random (rango)) ; 
			//writeln (v[i]) ; 
		end; 
end; 

function BuscarNumero (v: vector; numero: integer):integer;
var
i: integer; 
resultado: integer ; 
begin
resultado:= 0 ; 
	for i:= 1 to constanteMax do 
		begin
				if v[i] = numero then 
					resultado:= i ; 
		end ; 
	
		if resultado <> 0 then 
				writeln ('El numero ingresado se encontro en la posicion ',resultado, ' del vector') 
					else		
								writeln (-1) ; 
		
			BuscarNumero:= resultado; 
end; 

function SumarVector (v: vector): integer ; 
var
i, suma : integer ; 
begin
suma:= 0 ; 
	for i := 1 to constanteMax do 
		begin
		suma:= suma + v[i] ; 
		end ; 
	
SumarVector:= suma ; 

end; 

function NumeroMin (v: vector): integer ; 
var
i, min: integer; 
posicion: integer ; 
begin
posicion:= 0 ; 
min:= 9999; 
	for i := 1 to constanteMax do 
		begin
				if v[i] < min then 
					begin
					min:= v[i] ; 
					posicion := i ; 
					
					end; 
		end; 
	
NumeroMin:= posicion ; 
end; 

function NumeroMax (v:vector): integer; 
var
i, max: integer ; 
posicion: integer ; 
begin
max:= -1 ; 
	for i := 1 to constanteMax do 
		begin
				if v[i] > max then
					begin
					max:= v[i] ; 
					posicion := i ; 		
					end; 
		
		end; 
NumeroMax:= posicion ; 
end; 

var
v: vector ; 
num: integer ; 
res: integer ; 
SumaVector: integer ; 
minimo: integer; 
maximo: integer;  
begin
LeerVector(v);

 IngresarNumero (num); 
 res:= BuscarNumero (v,num);

SumaVector:= SumarVector(v);
writeln ('La suma de los elementos del vector es: ',SumaVector) ; 

writeln ; 

minimo:= NumeroMin (v) ; 
writeln ('La posicion donde se encuentra el menor numero es: ',minimo) ; 

writeln ; 
	
maximo:= NumeroMax (v) ; 
writeln ('La posicion donde se encuentra el mayor numero es: ',maximo) ; 

end.


