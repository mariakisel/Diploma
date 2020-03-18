%zmx.m

%clear
%ik=input('input ik=');
s0=10.; %расстояние до 1-й зоны в м.
ds=0.75; %величина (м) пространственного шага сканирования.
del_x=-13e-9; %аппаратная временная задержка.
c0=1.5e8*del_x;
in=-1;
ik=15;
mk=490;
nk=810;

for i1=1:ik
in=in+1;
eval (['X=imread(''CameraFrame',int2str(in),'.bmp'');']);
TRI=rgb2gray(X);
eval(['imwrite(TRI,''TR',int2str(in),'.tif'');']);
end

in=-1;
   for i1=1:ik
in=in+1;
eval (['Z=imread(''TR',int2str(in),'.tif'');']);
%%%end

  for n=1:nk
       for m=1:mk
mx1=m-1;
mx2=m+1;
nx1=n-1;
nx2=n+1;
msr=m;
nsr=n;

while msr<=1
mx1=m+2;
msr=msr+5;
end
msr=m;
while msr>=mk
mx2=m-2;
msr=msr-5;
end
while nsr<=1
nx1=n+2;
nsr=nsr+5;
end
nsr=n;
while nsr>=nk
nx2=n-2;
nsr=nsr-5;
end

            MSZ(m,n,ik)=(Z(m,n)+Z(mx1,n)+Z(mx2,n)+Z(m,nx1)+Z(m,nx2))/5.;
       end
  end
%end


%in1=in1+1;

for n=1:nk
     for m=1:mk
          [zmxi,imx]=max(MSZ(m,n,:));
          MSZMX(m,n)=s0+ds*(imx-1)+c0;
     end
end
   end

save MSZMX MSZMX -ascii

[m n ky]=size(MSZ);
a=1;
b=1;
for i2=1:ky
y(i2)=MSZ(a,b,i2);
%y(i2)=MSZMX(a,b,i2);
end
D=load('Constant_1.dat');
%eval (['D=load(''loadConstant_1,'.dat'');']);
frmod=D(1);
dtlas=D(2);
dteop=D(3);
z0=D(4);
step=D(5);
nx=D(6);

plot(1:ky,y)
title(['zmx   ' 'frmod=' num2str(frmod)   '   dtlas='  num2str(dtlas)   '   dteop='  num2str(dteop)])
xlabel(['z0='  num2str(z0)   '   step=' num2str(step)   '   nx=' num2str(nx)])
%clear ml li
%save SUM1 SUM 
