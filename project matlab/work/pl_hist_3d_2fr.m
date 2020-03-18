%clear
%ik=input('input ik=');

%A1=imread('AZN.tif');
%A2=imread('AZNADJ.tif');

A1=imread('AZN.bmp');
A2=imread('AZNADJ.bmp');


%%%T1=rgb2gray(A1);
%%%T2=rgb2gray(A2);

%A1=imadjust(A);
%2=imadjust(A,[0 1],[0.4 0.7]);
%H1=histeq(A1);
%H2=histeq(A2);

subplot(2,2,1),imshow(A1);title('A1');
subplot(2,2,2),imshow(A2);title('A1-ADJ');
subplot(2,2,3),imhist(A1);title('hist A1');
subplot(2,2,4),imhist(A2);title('hist A1-ADJ');
%subplot(2,2,2),imshow(A2);title('A2=imadjust(A,[0 1],[0.4 0.7]);');
%subplot(3,2,3),imhist(A1);title('hist-A1');
%subplot(3,2,4),imhist(A2);title('hist-A2');
%subplot(3,2,5),imshow(H1);title('histeq-A1');
%subplot(3,2,6),imshow(H2);title('histeg-A2');
%clear ml li
%save SUM1 SUM 
