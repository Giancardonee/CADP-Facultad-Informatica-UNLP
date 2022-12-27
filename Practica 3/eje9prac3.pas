{ 9. Realizar un programa que lea información de los candidatos ganadores de las últimas eleccionesa intendente de
la provincia de Buenos Aires. Para cada candidato se lee: localidad, apellido del candidato, cantidad de votos
obtenidos y cantidad de votantes de la localidad. La lectura finaliza al leer la localidad ‘Zárate’, que debe procesarse.
Informar:
● El intendente que obtuvo la mayor cantidad de votos en la elección.
● El intendente que obtuvo el mayor porcentaje de votos de la elección.}

program eje9prac3; 

type 
	candidato = record 
		Localidad: string ; 
		Apellido: string; 
		Votos: integer; 
		cantVotantes: integer;  /// Votantes de la localidad 	
	end; 

procedure LeerDatosCandidato (var i: candidato) ; 

begin
			write ('Ingrese la localidad: ') ; readln (i.Localidad) ; 		
					write ('Ingrese el apellido del candidato ganador: ') ; readln (i.Apellido) ; 
						write ('Ingrese la cantidad de votos del candidato ',i.Apellido, ': ') ; readln (i.Votos) ; 
			write ('Ingrese la cantidad de votantes de la localidad ',i.Localidad, ': ' ) ;
		readln (i.cantVotantes) ; 
		
		
									writeln ;   // salto de linea 
											writeln ;   // salto de linea 
end; 

// ● El intendente que obtuvo la mayor cantidad de votos en la elección.
procedure IntendenteMaxVotos (var i2: candidato ; var max: integer ;  var CandidatoMax: string  ); 
begin

			if i2.Votos > max then 
				begin
						max:= i2.Votos; 
						CandidatoMax:= i2.Apellido;  // Apellido del candidato max 
				end; 
	
end; 

//● El intendente que obtuvo el mayor porcentaje de votos de la elección.}
procedure PorcentajeVotos (var i3:candidato; var PorcentajeMax: real; var porcentaje: real; var IntendenteMaxPorcentaje: string) ; 

/// i3.votos ,i3.cantVotantes 
begin
	porcentaje:= ((i3.votos * 100) / i3.cantVotantes )  ; 
		if porcentaje > PorcentajeMax then 
				begin
						PorcentajeMax := porcentaje; 
						IntendenteMaxPorcentaje:= i3.Apellido; 
	end; 

end; 

var
Candidato1: candidato ; 
max: integer ; 
CandidatoMax: string; 
Porcentaje: real ; 
PorcentajeMax: real ; 
IntendenteMaxPorcentaje: string ; 
begin
Porcentaje:= 0 ; 
	PorcentajeMax:= -1 ; 
		IntendenteMaxPorcentaje:= ' ' ; 
	max:= -1 ; 
CandidatoMax:= ' ' ; 
	repeat
			LeerDatosCandidato (Candidato1) ; 
				IntendenteMaxVotos (Candidato1,max,CandidatoMax) ; 
		Porcentaje:= (( Candidato1.cantVotantes * 100) /Candidato1.Votos ) ;
		
		if Porcentaje > PorcentajeMax then 
			begin 
			PorcentajeVotos (Candidato1,PorcentajeMax,Porcentaje,IntendenteMaxPorcentaje) ; 
			end;
			 
	until Candidato1.Localidad = 'zarate' ;  	
			
			writeln ('-----> El intendente que tuvo la mayor cantidad de votos en una eleccion es: ',CandidatoMax) ; 
				writeln ('-----> El intendente con mas porcentaje de votos es: ',IntendenteMaxPorcentaje, ' con un porcentaje de: %',Porcentaje:2:2) ; 
end.
