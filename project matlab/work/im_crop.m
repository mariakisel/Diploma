
clear

%%%%% область интереса задаем мышкой - левая клавиша

I=imread('cameraman.tif');
D=imcrop(I);
figure;imshow(D);

%subplot(3,3,1),imshow(I);title('cameraman');
%subplot(3,3,4),imshow(BW1);title('sobel');
%subplot(3,3,5),imshow(BW2);title('prewitt');
%subplot(3,3,6),imshow(BW3);title('roberts');

%clear ml li
%save SUM1 SUM 
