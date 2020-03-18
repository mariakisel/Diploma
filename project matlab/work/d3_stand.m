
%%%подготовка массива данных для построения 3-х мерного изображения,
%%%когда dt_ЭОП = 2dt_лаз и объект неподвижен ---stand
%%%RIP - трапеция; для определения S_об надо знать S_кон-100% 

%%%пусть RIP - трапеция; для определения S_об надо знать S_max

clear all %очистить все переменные
close all %закрыть все открытые окна с изображениями

global ZMIN DZX

MS1=0;


%%%[mk,nk]=size(X1);
%%%определяем новым способом число строк и столбцов; отмененный выше
%%%способ дает не тот результат

X1=imread('CameraFrame1.bmp');
[mk]=size(X1,1);
[nk]=size(X1,2);

in=-1;
ikon=61;
s0=25;  %%%расстояние на пульте для 1-го кадра
ds=0.75; %%%шаг пространственного сканирования
skon=s0+ds*ikon;

for i1=1:ikon      %%%ikon-число зеснятых файлов
in=in+1;

eval (['X=imread(''CameraFrame',int2str(i1-1),'.bmp'');']);
    for m=1:mk
        for n=1:nk
        MS_ST1(m,n,ikon)=X(m,n);
        end
    end
end


%%%вычисляем расстояние для каждого пикселя

 for m=1:mk
     for n=1:nk
     [amx,nmx]=max(MS_ST1(m,n,:));
     amx1=0.95*amx;
         nmi=ikon+1;        
         for mai=1:ikon
         nmi=nmi-1;    
         amxi=MS_ST1(m,n,nmi);
           if amxi>amx1
           MS_ST2(m,n)=s0+nmx*ds;
           break
           else      
           end    
        end   
        
        
     %%%MS_ST(m,n)=s0+nmx*ds;
     end
 end

save MS_ST2 MS_ST2 -ascii
imwrite(MS_ST2,'MS_ST2.tif');

 for m=1:mk
     for n=1:nk
         bi=MS_ST2(m,n);
           if bi<=s0
              MS_ST3(m,n)=s0;
              elseif bi>=skon
              MS_ST3(m,n)=skon;
              else
           end
     end
 end
 
 save MS_ST3 MS_ST3 -ascii

%%%суммируем изображения
%%%расстояние в [м]нормируем таким образом, чтобы оно соответствовало
%%%пределам полутонового изображения (grayscale - уровни серого): [0...255]
%zmin=min(min(MS_ST3));
%zmax=max(max(MS_ST3));
%dz=zmax-zmin;

ZMIN=min(min(MS_ST3));
zmax=max(max(MS_ST3));
DZX=zmax-ZMIN;


XB=imread('CameraFrame1.bmp');
MS_ST5=rgb2gray(XB);



for m=1:mk,
     for n=1:nk,
         MS_ST4(m,n)=255.*((MS_ST3(m,n)-ZMIN)/DZX);
         MS_ST5(m,n)=uint8(MS_ST4(m,n));

     end
end

save MS_ST4 MS_ST4 -ascii
%%%save MS_ST5 MS_ST5 -ascii  %%%Variable 'MS_ST5' not written to file.
imwrite(MS_ST5,'MS_ST5.tif');
imwrite(MS_ST5,'MS_ST5.bmp');



%%%%%%%%%%%%%%%%%%end



subplot(3,1,1),image(MS_ST3)
 colormap(jet)
 colorbar
%%subplot(3,1,2),imshow(yi)
%%subplot(3,1,3),imshow(yin)
%subplot(3,1,2),imshow(vi),title('vi-bmp')
%subplot(3,1,3),imshow(vx),title('vx')



%%%%% НАЧАЛО
%%%%%МНОЙ ВНЕСЕНЫ ИЗМЕНЕНИЯ В КОД ПРОГРАММЫ
%%%%%MATLAB704\toolbox\images\imuitools\impixelinfoval.m

%%%global ZMIN DZX
            
%%%            ac0=DZX/255.;
%%%            ac1=str2double(valueString);
%%%            ac2=ac0*ac1;
%%%            ac3=ZMIN+ac2;
            %valueStringx=num2str(ac2);
%%%            valueStringx=int2str(ac3);
 %%%valueString = strrep(valueString,'E+0','E+');
 %%%              valueString = strrep(valueString,'E-0','E-');
 %%%              valueStringx= strrep(valueStringx,'E+0','E+');  %%ZZ
 %%%              valueStringx = strrep(valueStringx,'E-0','E-');  %%ZZ
 %%%           end
                       %%ZZZZZZZZ
            %%%ZZZ pixelString = sprintf('%s%s',createXYString(x,y),valueString);
            
 %%%           pixelString=sprintf('%s%s  %s',createXYString(x,y),valueString,valueStringx); %%%ZZZ 
 %%%%%КОНЕЦ




%Add two images together and specify an output class. 
%I = imread('rice.png');
%J = imread('cameraman.tif');
%K = imadd(I,J,'uint16');
%imshow(K,[])



%Add a constant to an image. 
%I = imread('rice.png');
%J = imadd(I,50);
%subplot(1,2,1), imshow(I) 
%subplot(1,2,2), imshow(J)


%load flujet
%image(X)
%colormap(jet)

%
%AZN=AU1;
%for m=1:mk,
%     for n=1:nk,
%         AZN(m,n)=uint8(MZN(m,n));             
%     end
%end
%%%save AZN AZN -ascii
%zm1=min(min(AZN));
%zm2=max(max(AZN));

%AZNADJ=imadjust(AZN);
%%%%%A0RGB=label2rgb(A0ADJ);%%%%%
%save MZ3 MZ3 -ascii

 %cmin=min(A2,[],240);
% [m1,i1]=min(min(AM2))
% [m2,i2]=max(max(AM2))
 %[m1,i1]=min(A2)
 %[m2,i2]=min(A2')
 
 %%%imshow(imcomplement(MZN))%%%ЗАМЕНА ЦВЕТА НА ПРОТИВОПОЛОЖНЫЙ
%B=imread('TR12.tif');

%y=gray2rgb(MZN);
%[y,newmap]=cmpermute(MZN);

%caxis([300 350])

%dz=(zmax-ZMIN)/5;
%zc1=uint16(zmin);
%zc2=uint16(zmin+2*dz);
%zc3=uint16(zmin+4*dz);
%zcmax=uint16(zmax);

%zc1=round(ZMIN);
%zc2=round(ZMIN+2*dz);
%c3=round(ZMIN+4*dz);
%zcmax=round(zmax);

%subplot(3,3,1),imshow(A1),title('A1');
%subplot(3,3,2),imshow(A2),title('A2');
%subplot(3,3,3),imshow(A3),title('A3');

%subplot(3,3,4),imshow(imadjust(AZN)),title('AZN uint8 0-255');
%subplot(3,3,4),imshow((AZN)),title('AZN');

%subplot(3,3,5),imshow(AZNADJ),title('AZNADJ');
%subplot(3,3,5),imshow(MZ16),title('MZ16');
%subplot(3,3,6),imshow(B),title('TR12.tif');
%subplot(3,3,6),imshow(MZ0);title('MZ0');
%subplot(3,3,7),imshow(MZN),title('MZN double');
%subplot(3,3,8),imshow(AZNADJ),title('AZNADJ'),colorbar;
%subplot(3,3,9),imshow(cmpermute(y));title('y');colorbar;
%subplot(3,3,9),imshow(y);title('y');colorbar;
%subplot(3,3,9),imshow(cmpermute(MZN));title('MZN');colorbar;

%%%subplot(3,3,9),imshow(AZN),xlabel('AZN dist-m'),...
    %%%colorbar('YTickLabel', {zc1,zc2,zc3})

%subplot(3,3,9),imshow(AZN),...
    %colorbar('YTickLabel', {zc1,zc2,zc3})
%set(gca,'YTickLabel',['1  ';'10 ';'100'])

%imwrite(AZNADJ,'AZNADJ1.tif');
    
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

%%%суммируем другим способом
%sumi=imread('CameraFrame0.bmp');
%%yi=rgb2gray(sumi);
%vi=sumi;
%ikonx=ikon-1;
%for i3=1:ikonx
%eval (['X3=imread(''CameraFrame',int2str(i3),'.bmp'');']);
%%y3=rgb2gray(X3);
%%yi=imadd(yi,y3);
%v3=X3;
%vi=imadd(vi,v3);
%%%vx=imadd(vi,v3,'double'); %%%изображение выводит
%vx=imadd(vi,v3,'uint8');

