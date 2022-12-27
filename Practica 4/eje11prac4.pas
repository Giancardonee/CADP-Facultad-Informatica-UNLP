{11. El colectivo de fotógrafos ArgenPics desea conocer los gustos de sus seguidores en las redes sociales. Para
ello, para cada una de las 200 fotos publicadas en su página de Facebook, cuenta con la siguiente
información: título de la foto, el autor de la foto, cantidad de Me gusta, cantidad de clics y cantidad de
comentarios de usuarios. Realizar un programa que lea y almacene esta información. Una vez finalizada la
lectura, el programa debe procesar los datos e informar:
a) Título de la foto más vista (la que posee mayor cantidad de clics).
b) Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay”.
c) Cantidad de comentarios recibidos para cada una de las fotos publicadas en esa página.}


/// Vamos a tener en cuenta que en vez de 200 fotos, vamos a estar procesando datos de 5 fotos
// si se quiere procesar datos de mas fotos, lo unico que se tendria que hacer es cambiar el valor de la constante DimF e ingresar los datos de la cantidad de publicaciones
program eje11prac4; 

const 
	DimF = 5 ; 
	
type 
	Datos = record 
	Titulo : string ; 
	Autor : string ; 
	Cant_mg : integer ; 
	Cant_clics : integer ; 
	Cant_comentarios : integer ;
	
	end;
	
	vector = array [1..DimF] of Datos ; 
	
	
	procedure subrayar () ; 
			begin
					Writeln ('- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -'); 
			end;


procedure CargarVector (var v: vector ; DimF: integer) ; 

var
i : integer ; 
begin
		for i := 1 to DimF do 
				begin
					subrayar ;
					writeln ('Ingrese los datos de la ',i, ' publicacion de un total de  ',DimF) ; 	
						subrayar;
							write('Ingrese el Titulo de la foto: ') ; readln (v[i].Titulo) ; 
										write ('Ingrese el Autor de la foto: ') ; readln (v[i].Autor) ; 
													write ('Ingrese la cantidad de Me gusta de la foto: ' ) ; readln (v[i].Cant_mg) ; 
										write ('Ingrese la cantidad de Clics: ') ; readln (v[i].Cant_clics) ; 
							write ('Ingrese la cantidad de Comentarios: ') ; readln (v[i].Cant_comentarios) ; 
							
					subrayar;
				end;
end;


//a) Título de la foto más vista (la que posee mayor cantidad de clics
procedure FotoMasVista (v: vector ) ; 
	var
	i: integer ; 
	TituloFoto : string ; 
	max: integer ; 
	begin
			max:= -1 ; 
			TituloFoto:= ' ' ; 
				for i:= 1 to DimF do 
							begin
									if v[i].Cant_clics > max then 
										begin 
											max:= v[i].Cant_clics; 
											TituloFoto:= v[i].Titulo;
										end ;
							end;
							writeln ; // salto de linea 
				writeln ('------> El titulo de la foto mas vista es: ',TituloFoto) ; 
				
	end;

//Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay”.

	procedure TotalMG_ArtVandelay (v: vector ) ; 
	
	var
	i : integer ; 
	Total_MG: integer ; 
	begin
	Total_MG := 0 ; 
			for i:= 1 to DimF do 
					begin
									if v[i].Autor = 'Art Vandelay' then 
										begin
											Total_MG:= Total_MG + v[i].Cant_mg;
										end;
					end;

					writeln ('------> La cantidad total de Me gusta de las fotos de Art Vandelay es:  ',Total_MG) ; 
	end;
// c) Cantidad de comentarios recibidos para cada una de las fotos publicadas en esa página.}
procedure ComentariosRecibidos (v : vector ); 
	var
	i : integer ; 
	begin
		for i:= 1 to DimF do 
				begin
						subrayar ; 
						
								writeln ('La cantidad de comentarios de la publicacion ',i, ' son: ',v[i].Cant_comentarios);
				end;
			
	end; 
	
var
v: vector; 

begin
CargarVector (v,DimF) ; 
FotoMasVista (v); 
TotalMG_ArtVandelay (v) ; 
ComentariosRecibidos (v) ; 
end.
