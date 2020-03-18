clear all
%ik=input('input ik=');
A=imread('здание_6800-1.jpg');
B= imread('cameraman.tif');

RGB1 = A;
RGB2 = imadjust(RGB1,[.2 .3 0; .6 .7 1],[]);
imshow(RGB1), figure, imshow(RGB2)


%A1=imadjust(A);
%A2=imadjust(A,[0 1],[0.8 0.9]);
B1=imadjust(B);
B2=imadjust(B,[0 1],[0.2 0.4]);

%A3=imadjust(A2,[0.8 0.9 ],[0 1]);
%A4=imadjust(A3,[],[0 255]);

subplot(1,2,1),imshow(A);title('imshow A');
subplot(1,2,2),imshow(RGB2);title('imshow RGB2');


%A1=imshow(A,[10 150]);
%subplot(4,2,1),imshow(A);title('imshow A');
%subplot(4,2,2),imshow(B);title('imshow B');
%subplot(4,2,3),imshow(A1);title('imadjust(A)');
%subplot(4,2,4),imshow(B1);title('imadjust(B)');
%subplot(4,2,5),imshow(A2);title('A2-imadjust(A,[0 1],[0.6 0.8])');
%subplot(4,2,6),imshow(B2);title('B2-imadjust(B,[0 1],[0.2 0.4])');
%subplot(4,2,7),imshow(A3);title('A2,[],[0 1]');
%subplot(4,2,8),imshow(G2);title('hist-A2');
%figure,imhist(A1);
%figure,imhist(A2);

%subplot(2,2,3),imshow(SI_TR_C);title('линейное контрастирование');
%subplot(2,2,4),imshow(J);title('imadjust');
%clear ml li
%save SUM1 SUM 
