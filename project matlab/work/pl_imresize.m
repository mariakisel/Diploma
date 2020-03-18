%clear
%ik=input('input ik=');
A=imread('TR14.tif');
A1=imresize(A,5,'bilinear');
A2=imresize(A,0.2,'bilinear');
%A1=imshow(A,[10 150]);
subplot(2,2,1),imshow(A);title('imshow');
subplot(2,2,3),imshow(A1);title('5x');
subplot(2,2,4),imshow(A2);title('0.2x');


%subplot(2,2,3),imshow(SI_TR_C);title('линейное контрастирование');
%subplot(2,2,4),imshow(J);title('imadjust');
%clear ml li
%save SUM1 SUM 
