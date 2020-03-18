clear all
%ik=input('input ik=');
%A=imread('pout.tif');
A=imread('MZN1.tif');
%B= imread('cameraman.tif');
A1=imadjust(A);
A2=imadjust(A,[0.2 0.8],[0 1],0.2);
A3=imadjust(A,[0.4 0.6],[]);

%A1=imshow(A,[10 150]);
subplot(2,2,1),imshow(A);title('imshow A');
subplot(2,2,2),imshow(A1);title('imadjust(A)');
subplot(2,2,3),imshow(A2);title('imadjust(A,[0.2 0.8],[0 1],0.2)');
subplot(2,2,4),imshow(A3);title('imadjust(A,[0.4 0.6],[])');
imcontrast(gca)
%subplot(3,2,5),imshow(G1);title('hist-A1');
%subplot(3,2,6),imshow(G2);title('hist-A2');
%figure,imhist(A1);
%figure,imhist(A2);

%subplot(2,2,3),imshow(SI_TR_C);title('линейное контрастирование');
%subplot(2,2,4),imshow(J);title('imadjust');
%clear ml li
%save SUM1 SUM 
