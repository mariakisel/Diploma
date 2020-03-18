clear
%ik=input('input ik=');
L=imread('CameraFrame14.bmp');
L=L(:,:,1);
BW1=L<150;
BW2=bwmorph(BW1,'erode',12);
BW3=edge(BW2,'thicken',Inf);
BW4=BW1&BW2


subplot(3,2,1),imshow(L);title('circles');
subplot(3,2,3),imshow(BW1);title('s');
subplot(3,2,4),imshow(BW2);title('bwmorph');
subplot(3,2,5),imshow(BW3);title('thicken');
subplot(3,3,6),imshow(BW4);title('l');

%clear ml li
%save SUM1 SUM 
