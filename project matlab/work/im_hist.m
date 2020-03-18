%clear
%ik=input('input ik=');
 I = imread('pout.tif');
 imshow(I)
 
 %%%imhist(I)
 A = imread('cameraman.tif');
imshow(A) 
%figure,imshow(H1);figure,imshow(H2);
subplot(3,2,1),imshow(I);title('pout-tif');
subplot(3,2,2),imshow(A);title('cameraman-tif');
subplot(3,2,3),imhist(I);title('hist-pout');
subplot(3,2,4),imhist(A);title('hist-cameraman');
%subplot(3,2,5),imshow(HE1);title('histeq-A1');
%subplot(3,2,6),imshow(HE2);title('histeg-A2');
%clear ml li
%save SUM1 SUM 
