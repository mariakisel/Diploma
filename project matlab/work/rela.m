
%clear all

%format bank
%xb=1./2.;
%[sb, errmsg] = sprintf('%6.2f',xb)
%[sb] = sprintf('%6.2f',xb)

%%%вычисление истинного коэффициента для не прямоугольного
%%%импульса подсветки для второй зоны:B

czb1=950;
czb2=1250;
czb21=czb2-czb1;

mbx=size(MB);
mbn=mbx(1,1);

yzi=0.99;
dyb0=0.0005;

for mbi=1:mbn
    dyb=abs(MB(mbi,2)-yzi);
   if dyb<dyb0
       zbx=MB(mbi,1);
    break
  %%%return
  %%%elseif
   else      
   end
    
end   
relbx=(czb2-zbx)/czb21;