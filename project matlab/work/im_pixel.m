clear all



A=imread('TR14.tif');
%A1=imshow(A);
%[xi,yi,P]=impixel(A1)

x=100;
y=200;
p=impixel(A,x,y)

RGB = imread('peppers.png');
A=imshow(RGB);
c = [12 146 1];
r = [104 156 1];
pixels = impixel(RGB,c,r)

IX=impixel(RGB);

%[xi,yi,P] = impixel(A1)
%интерактивный режим
%значения координат х и у и яркости в бегущем режиме (при движении курсора) выводит
%около оси х

%figure, imshow peppers.png
%pixval

 %pixval(A1,'on')
 
 %pixval('off')
