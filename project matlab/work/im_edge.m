clear
%ik=input('input ik=');
I=imread('cameraman.tif');

BW1=edge(I,'sobel');
BW2=edge(I,'prewitt');
BW3=edge(I,'roberts');
BW4=edge(I,'log');
BW5=edge(I,'zerocross');
BW6=edge(I,'canny');

subplot(3,3,1),imshow(I);title('cameraman');
subplot(3,3,4),imshow(BW1);title('sobel');
subplot(3,3,5),imshow(BW2);title('prewitt');
subplot(3,3,6),imshow(BW3);title('roberts');
subplot(3,3,7),imshow(BW4);title('log');
subplot(3,3,8),imshow(BW5);title('zerocross');
subplot(3,3,9),imshow(BW6);title('canny');

%clear ml li
%save SUM1 SUM 
