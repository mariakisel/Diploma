
%%%RIP - трапеция, когда dt_ЭОП = 2dt_лаз
%%%построение 3D изображения по 3 кадрам


clear all %очистить все переменные
close all %закрыть все открытые окна с изображениями
%ik=input('input ik=');

global ZMIN DZX

cax1=650.;
cax2=950.;
cax21=cax2-cax1;

a0=16.57763;
a1=-0.072;
a2=9.9511e-5;
a3=-4.31344e-8;

ia=0;
for za=cax1:0.1:cax2
    ia=ia+1;
    x=za;
    x2=x*x;
    x3=x2*x;
    ya=a0+a1*x+a2*x2+a3*x3;
    MA(ia,1)=x;
    MA(ia,2)=ya;
end
for iia=1:ia
    yai=MA(iia,2);
    if yai<0
    MA(iia,2)=0.;
    else
    end
    if yai>1
    MA(iia,2)=1.;
    else
    end    
end        
    save MA MA -ascii
%plot(MA(:,1),MA(:,2))

cbx1=950.;
cbx2=1250.;
cbx21=cbx2-cbx1;

b0=-56.20127;
b1=0.16787;
b2=-1.60788e-4;
b3=4.99721e-8;

ib=0;
for zb=cbx1:0.1:cbx2
    ib=ib+1;
    x=zb;
    x2=x*x;
    x3=x2*x;
    yb=b0+b1*x+b2*x2+b3*x3;    
    MB(ib,1)=x;
    MB(ib,2)=yb;
end
for iib=1:ib
    ybi=MB(iib,2);
    if ybi<0
    MB(iib,2)=0.;
    else
    end
    if ybi>1
    MB(iib,2)=1.;
    else
    end    
end
    save MB MB -ascii
%plot(MB(:,1),MB(:,2))

ccx1=1250.;
ccx2=1550.;
ccx21=ccx2-ccx1;

c0=-127.93702;
c1=0.28968;
c2=-2.14155e-4;
c3=5.19503e-8;

ic=0;
for zc=ccx1:0.1:ccx2
    ic=ic+1;
    x=zc;
    x2=x*x;
    x3=x2*x;  
    yc=c0+c1*x+c2*x2+c3*x3;
    MC(ic,1)=x;
    MC(ic,2)=yc;
end
for iic=1:ic
    yci=MC(iic,2);
    if yci<0
    MC(iic,2)=0.;
    else
    end
    if yci>1
    MC(iic,2)=1.;
    else
    end    
end        
    save MC MC -ascii
%plot(MC(:,1),MC(:,2))

ma1=size(MA);
ma2=ma1(1,1);
dya0=0.0005;
mb1=size(MB);
mb2=mb1(1,1);
dyb0=0.0005;
mc1=size(MC);
mc2=mc1(1,1);
dyc0=0.0005;

AU1=imread('VET1.tif');

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

z01=650;  %устанавливаемое на пульте расстояние S_нач_100% для 1-го кадра; м
z02=950;  %устанавливаемое на пульте расстояние S_нач_100% для 2-го кадра; м
z03=1250;  %устанавливаемое на пульте расстояние S_нач_100% для 3-го кадра; м
dz=50;    % длина плато,равная длинам фронта и спада; м
z03xx=z03+dz;

[m1,n1]=size(A1);
[m2,n2]=size(A2);
[m3,n3]=size(A3);
am=[m1 m2 m3];
an=[n1 n2 n3];
mmin=min(am);
nmin=min(an);
mk=mmin;
nk=nmin;

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
    z1k1=z1(k1);
%вставка - вычисление расстояния с учетом непрямоугольной формы
%импульсов подсветки
    %MZ1(i,j)=z01+z1*dz;

for mai=1:ma2
    dya=abs(MA(mai,2)-z1k1);
   if dya<dya0
      %zax=MA(mai,1);
      MZ0(i1,j1)=MA(mai,1);
    break
   else      
   end    
end   
%%rela=(zax-cax1)/cax21;  
    %%MZ0(i1,j1)=double(z01+rela*dz);
     k1=k1+1;
end

s2=size(M21);
sx2=s2(1,2);
k2=1;
for m2=1:sx2,
    i2=M21(k2);
    j2=M22(k2);
    z2(k2)=double(A3(i2,j2)/A2(i2,j2));
    z2k2=z2(k2);
    %MZ2(i,j)=z02+z2*dz;
    
for mbi=1:mb2
    dyb=abs(MB(mbi,2)-z2k2);
   if dyb<dyb0
       %zbx=MB(mbi,1);
        MZ0(i2,j2)=MB(mbi,1);
    break
   else      
   end   
end   
%%%%%!!!!!relb=(cbx2-zbx)/cbx21; 
%relb=(zbx-cbx1)/cbx21;
    %MZ0(i2,j2)=double(z02+relb*dz);
    k2=k2+1;
end

s3=size(M31);
sx3=s3(1,2);
k3=1;
for m3=1:sx3,
    i3=M31(k3);
    j3=M32(k3);
    z3(k3)=double(A2(i3,j3)/A3(i3,j3));
    z3k3=z3(k3);
    %MZ3(i,j)=z03+z3*dz;
     %%%%%MZ0(i3,j3)=double(z03+z3(k3)*dz);
for mci=1:mc2
    dyc=abs(MC(mci,2)-z3k3);
   if dyc<dyc0
       %zcx=MC(mci,1);
       MZ0(i3,j3)=MC(mci,1);
    break
   else      
   end    
end   
%relc=(ccx2-zcx)/ccx21;
     %MZ0(i3,j3)=double(z03xx-relc*dz);
     k3=k3+1;
end

for m=1:mk,
     for n=1:nk,
         if MZ0(m,n)<z01             
                 MZ0(m,n)=z01;
         end
     end
end
save MZ0 MZ0 -ascii
%%%%%MZ16=uint16(MZ0);
%%%%%save MZ16 MZ16 -ascii
save z1 z1 -ascii
save z2 z2 -ascii
save z3 z3 -ascii

%%%расстояние в [м]нормируем таким образом, чтобы оно соответствовало
%%%пределам полутонового изображения (grayscale - уровни серого): [0...255]
ZMIN=min(min(MZ0));
zmax=max(max(MZ0));
DZX=zmax-ZMIN;
%xi=255/mxz;
for m=1:mk,
     for n=1:nk,
         %%%%%MZN(m,n)=255.*((MZ0(m,n)-ZMIN)/DZX);
         MZN(m,n)=255.*((MZ0(m,n)-ZMIN)/DZX);
         
         %%%MZN(m,n)=double(255.*((MZ0(m,n)-zmin)/dzx)); 
         %%%MZN(m,n)=uint8(255.*((MZ0(m,n)-zmin)/dzx));  
         %MZN(m,n)=uint8(255.*(zmax-MZ0(m,n))/dzx);
     end
end
save MZN MZN -ascii
imwrite(MZN,'MZN.tif');
%%%%%imwrite(MZN,'MZN.bmp');  %%%выводит ошибку

%%%%%AZN=AU1;
%%%%%for m=1:mk,
%%%%%     for n=1:nk,
%%%%%         AZN(m,n)=uint8(MZN(m,n));             
%%%%%     end
%%%%%end

%%%save AZN AZN -ascii   %%%файл не записывается
%%%Warning: Attempt to write an unsupported data type to an ASCII file.
%%%Variable 'AZN' not written to file.

%%%%%imwrite(AZN,'AZN.tif');
%%%%%imwrite(AZN,'AZN.bmp');


%%%%%zm1=min(min(AZN));
%%%%%zm2=max(max(AZN));

%%%%%AZNADJ=imadjust(AZN);
AZNADJ=imadjust(MZN);
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
dz=(zmax-ZMIN)/5;
%zc1=uint16(zmin);
%zc2=uint16(zmin+2*dz);
%zc3=uint16(zmin+4*dz);
%zcmax=uint16(zmax);
zc1=round(ZMIN);
zc2=round(ZMIN+2*dz);
zc3=round(ZMIN+4*dz);
zcmax=round(zmax);

subplot(3,3,1),imshow(A1),title('A1');
subplot(3,3,2),imshow(A2),title('A2');
subplot(3,3,3),imshow(A3),title('A3');

%subplot(3,3,4),imshow(imadjust(AZN)),title('AZN uint8 0-255');
%%%%%subplot(3,3,4),imshow((AZN)),title('AZN-tif-uint8');
subplot(3,3,4),imshow((MZN)),title('MZN')

%subplot(3,3,5),imshow(AZNADJ),title('AZNADJ');
%%%%%subplot(3,3,5),imshow(MZ16),title('MZ16');
subplot(3,3,6),imshow(B),title('TR12.tif');
%subplot(3,3,6),imshow(MZ0);title('MZ0');
subplot(3,3,7),imshow(MZN),title('MZN');
subplot(3,3,8),imshow(AZNADJ),title('AZNADJ'),colorbar;
%subplot(3,3,9),imshow(cmpermute(y));title('y');colorbar;
%subplot(3,3,9),imshow(y);title('y');colorbar;
%subplot(3,3,9),imshow(cmpermute(MZN));title('MZN');colorbar;

%%%subplot(3,3,9),imshow(AZN),xlabel('AZN dist-m'),...
    %%%colorbar('YTickLabel', {zc1,zc2,zc3})

%%%%%subplot(3,3,9),imshow(AZN),...
    subplot(3,3,9),imshow(MZN),...
    colorbar('YTickLabel', {zc1,zc2,zc3})
set(gca,'YTickLabel',['1  ';'10 ';'100']),title('AZN')

imwrite(AZNADJ,'AZNADJ1.tif');
    
    %set(gca,'YLim',[300 800],'YTick',[300 400 500]))
    %%%%%%%%%%colorbar, %%%%caxis([-1 0])

%imshow(MZ0),title('MZ0');
%imshow(AZN),title('AZN');

%imshow(AZN),title('AZN'),colormap(jet(64)), colorbar
%imshow(AZN),title('AZN'), colorbar


%I=MZN;
%BW1 = edge(I,'prewitt');
%BW2 = edge(I,'canny');
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