
%clear
%I = imread('cameraman.tif');
%imtool(I)

figure
%A=imshow(AZN);
%subplot(1,2,1),imshow((AZN)),title('AZN');
h=ones(5,5)/25;
A2=imfilter(AZN,h);
A3=medfilt2((AZN),[3,3]);


H = fspecial('motion',20,45);
MotionBlur = imfilter(AZN,H,'replicate');

H = fspecial('disk',10);
blurred = imfilter(AZN,H,'replicate');

H = fspecial('unsharp');
sharpened = imfilter(AZN,H,'replicate');

subplot(3,2,1),imshow((AZN)),title('A original');
subplot(3,2,2),imshow((A2)),title('averaging filter 5x5');
subplot(3,2,3),imshow((A3)),title('medfilt2');
subplot(3,2,4),imshow((MotionBlur)),title('MotionBlur');
subplot(3,2,5),imshow((blurred)),title('Blurred Image');
subplot(3,2,6),imshow((sharpened)),title('Sharpened Image');
%clear ml li
%save SUM1 SUM 
