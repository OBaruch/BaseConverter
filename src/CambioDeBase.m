function r = CambioDeBase(numero,base)
   
    
    numero1=numero; numero2=numero; arregloe=[]; arreglof=[];
    cociente=numero1;
    
    while(cociente>0)
      residuo=floor(mod(numero1,base));
      cociente=floor(numero1/base);
      numero1=cociente;
      arregloe=[arregloe,residuo];
    endwhile
    for i=1:15
      fraccionaria=numero2-floor(numero2);
      producto=floor(fraccionaria*base);
      numero2=fraccionaria*base-floor(fraccionaria*base);
      arreglof=[arreglof,producto];
    endfor
    enteros=mat2str(fliplr(arregloe));
    fraccionarios=mat2str(arreglof);
    conversion=strcat(enteros,'.',fraccionarios)
 
  endfunction
%dec2base(numero,base)