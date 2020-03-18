clear all

A=imread('TR12.tif');
%A=imread('CameraFrame12.bmp');
%B=rgb2gray(A);
h=[1 2 1; 0 0 0; -1 -2 -1];
A2=filter2(h,A);

A3=imadjust(A);
A4=imadjust(A,[0.3 0.7],[]);
%imshow(A,[]), colorbar
%imshow(A3,[]), colorbar

%figure, imshow(A), figure, imshow(A3)

subplot(2,2,1),imshow(A);title('imshow'); colorbar
subplot(2,2,2),imshow(A3);title('imadjust'); colorbar
subplot(2,2,4),imshow(A4);title('imadjust[0.3 0.7] []'); colorbar


%title(['n=' num2str(n)  '   m=' num2str(m) '   mx=' num2str(mx) '   imx=' num2str(imx)])
%clear ml li
%save ymx1 ymxx  -ascii
%save ymx1 ymxx 