
clear

%%%%% область интереса задаем мышкой - левая клавиша

I1=imread('VET1.tif');
I2=imread('VET2.tif');
I3=imread('VET3.tif');
[m n k]=size(I3);

M1=imread('AZNADJ1.tif');
M2=imread('AZNADJ1_xxx.tif');
subplot(2,3,1),imshow(M1);title('AZNADJ1.tif');
subplot(2,3,2),imshow(M2);title('AZNADJ1_xxx.tif');

subplot(2,3,4),imshow(I1);title('VET1.tif');
subplot(2,3,5),imshow(I2);title('VET2.tif');
subplot(2,3,6),imshow(I3);title('VET3.tif');
%subplot(3,3,6),imshow(BW3);title('roberts');

%clear ml li
%save SUM1 SUM 
