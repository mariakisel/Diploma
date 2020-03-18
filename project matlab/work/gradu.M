clear

%%%построение градуировочной кривой (метод корреляции
%%%"расстояние-интенсивность"), если имеется массив рассчитанных данных
%%%-КАБАШНИКОВ

%load d:\task\gr1.mat -ascii  % файл с данными для графика 1
%load d:\task\gr2.mat -ascii  % файл с данными для графика 2
load gr1.txt
load gr2.txt
dxsr=3.0;
[ym1,mm1]=max(gr1(:,3));
[ym2,mm2]=max(gr2(:,3));
xgr=gr2(mm2,1);
for ni2=1:mm2
xi2=gr2(ni2,1);
   ni12=mm1+mm2+90;
%   for ni1=mm1:ni12
    ni12=mm1;
    xi1=gr1(mm1,1);
    while xi1<=xgr
    ni12=ni12+1;    
   xi1=gr1(ni12,1);
   dx=abs(xi2-xi1);
      if dx<dxsr
      ms1(ni2,1)=gr2(ni2,1); 
      ms1(ni2,2)=xi1;
      ms1(ni2,3)=gr2(ni2,3);
      ms1(ni2,4)=gr1(ni12,3);
      otn=gr2(ni2,3)/gr1(ni12,3);
      ms1(ni2,5)=otn;
      break
      %elseif
      end    
   end
end   
   
%end

save mgrad ms1 -ascii
%[aa1]
