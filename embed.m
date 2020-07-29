function [f]= embed(p,N,d)

 
 f=floor(p/power(2,N));
 f=f*power(2,N);
 f=f+d;
 f=double(f);
 
 
end