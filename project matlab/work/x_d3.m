
%%%RIP - трапеция, когда dt_ЭОП = 2dt_лаз
%%%построение 3D изображения по 3 кадрам


clear all %очистить все переменные
close all %закрыть все открытые окна с изображениями
%ik=input('input ik=');

AU1=imread('VET1.tif');
%A2=imread('VET2.tif');
%A3=imread('VET3.tif');

%загружаются 3 кадра с изображениями
A1=im2double(imread('VET1.tif'));
A2=im2double(imread('VET2.tif'));
A3=im2double(imread('VET3.tif'));

%AM1=medfilt2(A1);
%AM2=medfilt2(A2);
%AM3=medfilt2(A3);

[a b c]=size(A3);

ax=50;
ay=30;

z01=300;  %устанавливаемое на пульте расстояние S_нач_100% для 1-го кадра; м
z02=350;  %устанавливаемое на пульте расстояние S_нач_100% для 2-го кадра; м
z03=400;  %устанавливаемое на пульте расстояние S_нач_100% для 3-го кадра; м
dz=50;    % длина плато,равная длинам фронта и спада; м

mk=150;  %число строк в кадре
nk=240;  %число столбцов в кадре

i1=1;
for m=1:mk,
     for n=1:nk,
         if A2(m,n)<A1(m,n)             
                 M11(i1)=m;
                 M12(i1)=n;
                 i1=i1+1;
         end
     end
end
save M11 M11 -ascii
save M12 M12 -ascii

i2=1;
for m=1:mk,
     for n=1:nk,
         if A2(m,n)>A1(m,n)
             if A2(m,n)>A3(m,n)            
                 M21(i2)=m;
                 M22(i2)=n;
                 i2=i2+1;
             end
         end
     end
end     %XXXXXXXXXXXXXX
save M21 M21 -ascii
save M22 M22 -ascii

i3=1;
for m=1:mk,
     for n=1:nk,
         if A2(m,n)<A3(m,n)             
                 M31(i3)=m;
                 M32(i3)=n;
                 i3=i3+1;
         end
     end
end
save M31 M31 -ascii
save M32 M32 -ascii

%%%вычисляем расстояние для каждого пикселя,
%%%используя 3 пары перекрывающихся участков RIP
s1=size(M11);
sx1=s1(1,2);
k1=1;
for m1=1:sx1,
    i1=M11(k1);
    j1=M12(k1);
    z1(k1)=double(A2(i1,j1)/A1(i1,j1));
%вставка - вычисление расстояния с учетом непрямоугольной формы
%импульсов подсветки
    %MZ1(i,j)=z01+z1*dz;
    MZ0(i1,j1)=double(z01+z1(k1)*dz);
     k1=k1+1;
end

s2=size(M21);
sx2=s2(1,2);
k2=1;
for m2=1:sx2,
    i2=M21(k2);
    j2=M22(k2);
    z2(k2)=double(A3(i2,j2)/A2(i2,j2));
    %MZ2(i,j)=z02+z2*dz;
    MZ0(i2,j2)=double(z02+z2(k2)*dz);
    k2=k2+1;
end

s3=size(M31);
sx3=s3(1,2);
k3=1;
z03xx=z03+dz;
for m3=1:sx3,
    i3=M31(k3);
    j3=M32(k3);
    z3(k3)=double(A2(i3,j3)/A3(i3,j3));
    %MZ3(i,j)=z03+z3*dz;
     %%%%%MZ0(i3,j3)=double(z03+z3(k3)*dz);
     MZ0(i3,j3)=double(z03xx-z3(k3)*dz);
    k3=k3+1;
end
plot


for m=1:mk,
     for n=1:nk,
         if MZ0(m,n)<z01             
                 MZ0(m,n)=z01;
         end
     end
end
save MZ0 MZ0 -ascii

%%%расстояние в [м]нормируем таким образом, чтобы оно соответствовало
%%%пределам полутонового изображения (grayscale - уровни серого): [0...255]
zmin=min(min(MZ0));
zmax=max(max(MZ0));
dzx=zmax-zmin;
%xi=255/mxz;
for m=1:mk,
     for n=1:nk,
         MZN(m,n)=double(255.*((MZ0(m,n)-zmin)/dzx)); 
         %%%MZN(m,n)=uint8(255.*((MZ0(m,n)-zmin)/dzx));  
         %MZN(m,n)=uint8(255.*(zmax-MZ0(m,n))/dzx);
     end
end
save MZN MZN -ascii

AZN=AU1;
for m=1:mk,
     for n=1:nk,
         AZN(m,n)=uint8(MZN(m,n));             
     end
end
%%%save AZN AZN -ascii
zm1=min(min(AZN));
zm2=max(max(AZN));

AZNADJ=imadjust(AZN);
%%%%%A0RGB=label2rgb(A0ADJ);%%%%%
%save MZ3 MZ3 -ascii

 %cmin=min(A2,[],240);
% [m1,i1]=min(min(AM2))
% [m2,i2]=max(max(AM2))
 %[m1,i1]=min(A2)
 %[m2,i2]=min(A2')
 
 %%%imshow(imcomplement(MZN))%%%ЗАМЕНА ЦВЕТА НА ПРОТИВОПОЛОЖНЫЙ
B=imread('TR12.tif');

%y=gray2rgb(MZN);
%[y,newmap]=cmpermute(MZN);

%caxis([300 350])
dz=(zmax-zmin)/5;
%zc1=uint16(zmin);
%zc2=uint16(zmin+2*dz);
%zc3=uint16(zmin+4*dz);
%zcmax=uint16(zmax);
zc1=round(zmin);
zc2=round(zmin+2*dz);
zc3=round(zmin+4*dz);
zcmax=round(zmax);

subplot(3,3,1),imshow(A1),title('A1');
subplot(3,3,2),imshow(A2),title('A2');
subplot(3,3,3),imshow(A3),title('A3');
subplot(3,3,4),imshow(imadjust(AZN)),title('AZN uint8 0-255');
subplot(3,3,5),imshow(AZNADJ),title('AZNADJ');
subplot(3,3,6),imshow(B),title('TR12.tif');
%subplot(3,3,6),imshow(MZ0);title('MZ0');
subplot(3,3,7),imshow(MZN),title('MZN double machine specific');
subplot(3,3,8),imshow(AZNADJ),title('AZNADJ'),colorbar;
%subplot(3,3,9),imshow(cmpermute(y));title('y');colorbar;
%subplot(3,3,9),imshow(y);title('y');colorbar;
%subplot(3,3,9),imshow(cmpermute(MZN));title('MZN');colorbar;
subplot(3,3,9),imshow(AZN),title('AZN'),xlabel('distance-m'),...
    colorbar('YTickLabel', {zc1,zc2,zc3})

imwrite(AZN,'d3_2.tif');
    
    %set(gca,'YLim',[300 800],'YTick',[300 400 500]))
    %%%%%%%%%%colorbar, %%%%caxis([-1 0])

%imshow(MZ0),title('MZ0');
%imshow(AZN),title('AZN');

%imshow(AZN),title('AZN'),colormap(jet(64)), colorbar
%imshow(AZN),title('AZN'), colorbar


I=MZN;
BW1 = edge(I,'prewitt');
BW2 = edge(I,'canny');
%figure, imshow(BW1)
%figure, imshow(BW2)
%subplot(2,2,1),imshow(BW1);title('edge BW1');
%subplot(2,2,2),imshow(BW2);title('edge BW2');

%AI=imcomplement(MZN); %меняет цвет на противоположный
%figure,imshow(MZN),figure,imshow(AI)


%adding colorbar
%h=[1 2 1; 0 0 0; -1 -2 -1];
%J_CB=filter2(h,J);
%imwrite(J_CB,'J_CB1.tif');

%subplot(1,2,1),imshow(J,[]), colorbar;title('colorbar');
%subplot(1,2,2),imshow(C2,[]), colorbar;title('colorbar');

%figure, imshow(J,[]), colorbar;title('colorbar');
%figure,imshow(SUM1);title('отнормировано');
%clear ml li
%save SUM1 SUM 
