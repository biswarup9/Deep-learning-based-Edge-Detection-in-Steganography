clc;
clear all;

imref=imread('5gausadaptlena128.bmp');
im=imread('lena512_gray.bmp');
secret=imread('lena512_gray.bmp');
im=imresize(im,[128 128]);
im=double(im);
[row col]=size(im);

no_of_bits_edgepixels=4;
no_of_bits_nonedgepixels=3;


[row1 col1]=size(secret);
d1=im;
d=reshape(d1,1,[]);
len=row1*col1*8;

asc=uint8(d);
m=transpose(dec2bin(asc, 8));
m=m(:);
ll= length(m);

message=str2num(m);

z=1;

for i=1:row
   for j=1:col
      if(imref(i,j)==255) %edge pixel
        m1=zeros(no_of_bits_edgepixels,1);
            for k=1:no_of_bits_edgepixels

   m1(k)=message(z);
  z=z+1;

    end
m1=num2str(m1);
m1=transpose(m1);
a=transpose(bin2dec(m1));
m1=str2num(m1);
            imm=embed(im(i,j),no_of_bits_edgepixels,double(a));
            [imc(i,j)]=frequencyAdjustment( im(i,j),imm, no_of_bits_edgepixels);
            
      else
       m1=zeros(no_of_bits_nonedgepixels,1);
            for k=1:no_of_bits_nonedgepixels

   m1(k)=message(z);
  z=z+1;

    end
m1=num2str(m1);
m1=transpose(m1);
a=transpose(bin2dec(m1));
m1=str2num(m1);
            imm=embed(im(i,j),no_of_bits_nonedgepixels,double(a));
            [imc(i,j)]=frequencyAdjustment( im(i,j),imm, no_of_bits_nonedgepixels);
       
      end
    end
end
imshow(uint8(imc));
ssim1=ssim(uint8(imc),uint8(im));
imwrite(uint8(imc),'gausadaptsteg3.bmp');