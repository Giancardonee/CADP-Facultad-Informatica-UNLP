{  Realizar un programa que lea tres caracteres, e informe si los tres eran letras vocales o si al menos
uno de ellos no lo era. Por ejemplo, si se leen los caracteres “a e o” deberá informar “Los tres son
vocales”, y si se leen los caracteres “z a g” deberá informar “al menos un carácter no era vocal”  }

{    <>   }


program eje8_prac1; 

var
c1, c2, c3: string; 
begin
		write('ingresa el primer caracter: ');  		
				readln(c1) ; 
		write('ingresa el segundo caracter: ');  		
				readln(c2) ; 
				
		write('ingresa el tercer caracter: ');  		
				readln(c3) ;
		
		if (c1= 'a' )  or  (c1= 'e') or (c1= 'i' )   or (c1= 'o' ) or (c1= 'u ')
		 and (c2= 'a' )  or  (c2= 'e') or (c2= 'i' )   or (c2= 'o' ) or (c2= 'u ')  
		 and (c3= 'a' )  or  (c3= 'e') or (c3= 'i' )   or (c3= 'o' ) or (c3= 'u ')then
					
					begin
						writeln('los tres caracteres son vocales') 
					end
			else 
					begin 
					writeln('al menos un caracter no es vocal') ; 
					end; 
		 
				
			

end.
