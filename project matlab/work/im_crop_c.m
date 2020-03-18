clear
%ik=input('input ik=');
I=imread('cameraman.tif');
D1=imcrop(I,[60 40 100 100]);
D2=imcrop(I,[100 100 100 100]);
D3=imcrop(I,[50 50 100 10]);
D4=imcrop(I,[50 50 10 100]);

subplot(3,2,1),imshow(I);title('cameraman');
subplot(3,2,3),imshow(D1);title('60 40 100 100');
subplot(3,2,4),imshow(D2);title('100 100 100 100');
subplot(3,2,5),imshow(D3);title('200 200 100 10');
subplot(3,2,6),imshow(D4);title('200 200 100 10');



%subplot(3,3,5),imshow(BW2);title('prewitt');
%subplot(3,3,6),imshow(BW3);title('roberts');

%clear ml li
%save SUM1 SUM 
