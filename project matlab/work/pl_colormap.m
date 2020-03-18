clear all

A=imread('TR12.tif');
%A=imread('CameraFrame12.bmp'); %%%%%с этим расширением не работает
%%%image(A);
A1=image(A);title('gray');
colormap(gray);
%hold on
A2=image(A);title('jet');
colormap(jet);
%%%colormap (bone);
%A3=image(A);title('winter');
%colormap (winter);
%A4=image(A);title('summer');
colormap(summer);
%colormap(gray(100));
%imshow(B,[])

subplot(2,2,1),imshow(A);colormap(gray);title('gray');
subplot(2,2,2),imshow(A);colormap(jet);title('jet');
subplot(2,2,3),imshow(A);colormap (winter);title('winter');
subplot(2,2,4),imshow(A);colormap(summer);title('summer');

%%%на всех рисунках используется тот тип colormap,
%%%который встречается в тексте последним 


%subplot(2,2,1),image(A1)
%title('gray');
%subplot(2,2,2),imshow(A2)
%title('jet');
%subplot(2,2,3),imshow(A3)
%title('winter');
%subplot(2,2,4),imshow(A4)
%title('summer');
