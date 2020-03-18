
%%%%%вычисляется среднее значение яркости пикселя при усреднении по всем 
%%%%%пикселям изображения
%clear
%ik=input('input ik=');
%in=99;
in=99;
ikon=40;
%mk=490;
mk=640;
%nk=810;
nk=512;
mnk=mk*nk;
MS1=0;

AN=imread('TR100.tif');
[m1 n1]=size(AN);
AK=imread('TR139.tif');
[m2 n2]=size(AK);
mk=m1;
nk=n1;

for i1=1:ikon
in=in+1;
MS1=0;
%eval (['YX=imread(''TR',int2str(in),'.tif'');']);
%eval(['M' num2str(n) ' = magic(n)'])
%eval (['X=imread(''CameraFrame',int2str(in),'.bmp'');']);
%eval (['YX=imread(',int2str(in),'.bmp);']);
%eval (['YX=imread('100,'.bmp'');']);
eval (['YX=imread(''TR',int2str(in),'.tif'');']);
[mk nk]=size(YX);
B1=im2double(YX);


for m=1:mk
    for n=1:nk
        MS1=MS1+B1(m,n);
    end
end
MS0(i1,1)=i1;
MS0(i1,2)=MS1/mnk;
%eval(['imwrite(TR,''TR',int2str(in),'.bmp'');']);
%eval (['clear CameraFrame',int2str(in1),'.bmp')]);
%in1=in1+1;
end

save ms_mov MS0 -ascii
%save MS_MOV MS0
%clear ml li
