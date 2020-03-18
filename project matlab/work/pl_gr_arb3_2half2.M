clear all
close all

%%%построение градуировочной кривой (метод корреляции
%%%"расстояние-интенсивность"), если имеется массив рассчитанных данных
%%%-КАБАШНИКОВ

%%%RIP - треугольник (цифра 3)

load gr2.txt             %возрастающая ветвь из А2
load gr3.txt             %возрастающая ветвь из А3
dxsr=0.30;   
%предел отклонения расстояния между А1 и А2
[ym2,mm2]=max(gr2(:,3));
[ym3,mm3]=max(gr3(:,3));


z01=50.0;              %для каждой пары кривых исходные данные ограничиваем
                         %значениями z01, z02, z03
z02=64.4;
z03=78.8;
 
%nk1=size(gr2(1));
nk1=154;
for ni1=1:nk1
xi2=gr2(ni1,1);

      yi2=gr2(ni1,3);
      otn=yi2/ym2;
      ms1(ni1,1)=xi2; 
      ms1(ni1,2)=yi2;  
      ms1(ni1,3)=xi2-z01;
      ms1(ni1,4)=otn;
   end
   
%nk2=size(gr4(1));
nk2=154;
for ni2=1:nk2
xi3=gr3(ni2,1);

      yi3=gr3(ni2,3);
      otn=yi3/ym3;
      ms2(ni2,1)=xi3; 
      ms2(ni2,2)=yi3;  
      ms2(ni2,3)=xi3-z02;
      ms2(ni2,4)=otn;
   end
%%%%%end   
   
save gr_arb2.dat ms1 -ascii
save gr_arb3.dat ms2 -ascii
%[aa1]


a2=gr2;
a3=gr3;
k1=1;
k2=154;

%subplot(2,2,1),plot(a1(:,1),a1(:,3))
subplot(2,2,1),plot(a2(k1:k2,1),a2(k1:k2,3))
title('gr2')
subplot(2,2,2),plot(a3(k1:k2,1),a3(k1:k2,3))
title('gr3')
subplot(2,2,3),plot(ms1(k1:k2,3),ms1(k1:k2,4),ms2(k1:k2,3),ms2(k1:k2,4),'r')
title('gr-arb3-half2(S-z01)  gr-arb3-half3(S-z02)','FontSize',8)
subplot(2,2,4),plot(0:1:10,1)
text(0.3,1.5,'pl-gr-arb3-2half2-50','FontSize',8)
text(0.3,1.0,'si=50(z01) 64.4(z02) 78.8(z03)','FontSize',8)
text(0.3,0.5,'dt-las=96 ns dt-g=96 ns  28 las','FontSize',8)
text(0.3,0.2,'dS=0.15*96=14.4 m','FontSize',8)

