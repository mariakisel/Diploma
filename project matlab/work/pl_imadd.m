%clear
%ik=input('input ik=');

A1=imread('AX1.bmp');
A2=imread('AX2.bmp');
A3=imread('AX3.bmp');
AT1=rgb2gray(A1);
AT2=rgb2gray(A2);
AT3=rgb2gray(A3);
AX1=im2double(A1);
AX2=im2double(A2);
AX3=im2double(A3);
AXD1=imdivide(AX1,3);
AXD2=imdivide(AX2,3);
AXD3=imdivide(AX3,3);

imwrite(AT1,'AT1.tif');
imwrite(AT2,'AT2.tif');
imwrite(AT3,'AT3.tif');

%A12=imadd(A1,A2);
%A123=imadd(A12,A3);
AXD12=imadd(AXD1,AXD2);
AXD123=imadd(AXD12,AXD3);

imwrite(A12,'AT12.tif');
imwrite(A123,'AT123.tif');

%mx12=min(max(max(A12)))
%mx123=min(max(max(A123)))
%mx12=(max(max(A12)));
%mx123=(max(max(A123)));
%mx12d=(max(max(A12D)));
%mx123d=(max(max(A12D)));

mx1x=(max(max(AXD1)))
mx2x=(max(max(AXD2)))
mx12dx=(max(max(AXD12)))
mx123x=(max(max(AXD123)))
 
%imshow(SUM);title('сумма-нормированная');
subplot(3,3,1),imshow(A1);title('A1');%colorbar;
subplot(3,3,2),imshow(A2);title('A2');%colorbar;
subplot(3,3,3),imshow(A3);title('A3');%colorbar;
subplot(3,3,4),imshow(A12);title('A12');%colorbar;
subplot(3,3,5),imshow(A123);title('A123');%colorbar;
subplot(3,3,6),imshow(A123);title('A123');%colorbar;
subplot(3,3,7),imshow(AXD12);title('AXD12-imdivide');
subplot(3,3,8),imshow(AXD123);title('AXD123-imdivide');



%    Add a constant to an image:
 
%        I = imread('rice.png');
%        Iplus50 = imadd(I,50);
%        figure, imshow(I), figure, imshow(Iplus50); 

% Divide an image by a constant factor:
 
%        I = imread('rice.png');
%        J = imdivide(I,2);
%        figure, imshow(I)
%        figure, imshow(J)