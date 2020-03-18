%clear
%ik=input('input ik=');

A1=imread('A1.bmp');
A2=imread('A2.bmp');

T1=rgb2gray(A1);
T2=rgb2gray(A2);

%A1=imadjust(A);
%2=imadjust(A,[0 1],[0.4 0.7]);
%H1=histeq(A1);
%H2=histeq(A2);


subplot(2,2,1),imhist(T1);title('hist A1');
subplot(2,2,2),imhist(T2);title('hist A2');
%subplot(2,2,2),imshow(A2);title('A2=imadjust(A,[0 1],[0.4 0.7]);');
%subplot(3,2,3),imhist(A1);title('hist-A1');
%subplot(3,2,4),imhist(A2);title('hist-A2');
%subplot(3,2,5),imshow(H1);title('histeq-A1');
%subplot(3,2,6),imshow(H2);title('histeg-A2');
%clear ml li
%save SUM1 SUM 
