clear

%%%построение градуировочной кривой (метод корреляции
%%%"расстояние-интенсивность"), если имеется массив рассчитанных данных
%%%-КАБАШНИКОВ

%load d:\task\gr1.mat -ascii  % файл с данными для графика 1
%load d:\task\gr2.mat -ascii  % файл с данными для графика 2
load gr1.txt             %кривая, где плато
load gr2.txt             %кривая, где подъем (спад)- с наличием задержки
dxsr=0.20;               %разброс отклонения расстояния
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
      
      ms2(ni2,1)=gr2(ni2,1); 
      ms2(ni2,2)=otn;
      break
      %elseif
      end    
   end
end   
   
save gr_ms1 ms1 -ascii
save gr_ms2 ms2 -ascii
%[aa1]


a1=gr1;
a2=gr2;
k1=2;
k2=109;
%subplot(2,2,1),plot(a1(:,1),a1(:,3))
subplot(2,2,1),plot(a1(k1:k2,1),a1(k1:k2,3))
title('gr1')
subplot(2,2,2),plot(a2(k1:k2,1),a2(k1:k2,3))
title('gr2')
%subplot(2,2,3),plot(ms2(:,1),ms2(:,2))
subplot(2,2,3),plot(ms1(k1:k2,1),ms1(k1:k2,5))
title('gr-arb')


