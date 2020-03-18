%clear

A=imread('TR14.tif');

subplot(2,2,1),imshow(A);title('imshow');
subplot(2,2,2),imshow(A,[20 100]);title('imshow(I,[20 100])');
subplot(2,2,3),imshow(A,[20 200]);title('imshow(I,[20 200])');
subplot(2,2,4),imshow(A,[150 200]);title('imshow(I,[150 200])');


