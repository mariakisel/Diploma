clear all

%A=imread('TR12.tif');
%A=imread('CameraFrame12.bmp'); %%%%%с этим расширением не работает
%%%image(A);
%A1=image(A);title('gray');
%colormap(gray);
%hold on
%A2=image(A);title('jet');
%colormap(jet);


A=imread('AZN.tif');
%A=imread('MZN.tif');
%A=load MZN
%image(A)

imshow(A)
colormap(jet)
%colormap(summer)

%load flujet
%image(X)
%colormap(jet)


%colormap(summer);
%colormap(gray(100));
%imshow(B,[])

%subplot(2,2,1),imshow(A);colormap(gray);title('gray');
%subplot(2,2,2),imshow(A);colormap(jet);title('jet');
%subplot(2,2,3),imshow(A);colormap (winter);title('winter');
%subplot(2,2,4),imshow(A);colormap(summer);title('summer');

%%%на всех рисунках используется тот тип colormap,
%%%который встречается в тексте последним 



