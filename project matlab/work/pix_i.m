clear all

A=imread('TR14.tif');
B=imshow(A);
%A1=imshow(A);
%%%P = impixel(A)  % interactively -для точки, обозначенной мышью!!!!!

%ЕСЛИ P = impixel(A1) - не работает !!!!!!!!!!!!!!

%x=A(1,1)
i1=input('input i1=');
i2=input('input i2=');
I=A(i1,i2)
%RGB = imread('peppers.png');
%        c = [12 146 410];
 %       r = [104 156 129];
 %c = [12];
 %r = [104];
%pixels = impixel(RGB,c,r) % noninteractively  для точки х=с  и у=r !!!!!
  
 %P = impixel(RGB) % interactively -для точки, обозначенной мышью!!!!!