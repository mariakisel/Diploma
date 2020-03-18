clear all
close all

%%%построение градуировочной кривой (метод корреляции
%%%"расстояние-интенсивность"), если имеется массив рассчитанных данных
%%%-КАБАШНИКОВ

%%%RIP - треугольник (цифра 3)

load gr1.txt             %убыващая ветвь из А1
load gr2.txt             %возрастающая ветвь из А2
load gr3.txt             %убыващая ветвь из А2
load gr4.txt             %возрастающая ветвь из А3
dxsr=0.30;               %предел отклонения расстояния между А1 и А2
[ym1,mm1]=max(gr1(:,3));
[ym2,mm2]=max(gr2(:,3));
[ym4,mm4]=max(gr4(:,3));

z01=7000.0;              %для каждой пары кривых исходные данные ограничиваем
                         %значениями z01, z02, z03
z02=7014.4;
z03=7028.8;
 
%nk1=size(gr2(1));
nk1=158;
for ni1=1:nk1
xi1=gr1(ni1,1);
xi2=gr2(ni1,1);

      yi1=gr1(ni1,3);
      yi2=gr2(ni1,3);
      otn=yi2/ym2;
      dx=xi2-xi1;
      ms1(ni1,1)=xi2; 
      ms1(ni1,2)=xi1;
      ms1(ni1,3)=yi2;
      ms1(ni1,4)=yi1;  
      ms1(ni1,5)=xi2-z01;
      ms1(ni1,6)=otn;
      ms1(ni1,7)=dx;
   end
   
%nk2=size(gr4(1));
nk2=158;
for ni2=1:nk2
xi1=gr3(ni2,1);
xi2=gr4(ni2,1);

      yi1=gr3(ni2,3);
      yi2=gr4(ni2,3);
      otn=yi2/ym4;
      dx=xi2-xi1;
      ms2(ni2,1)=xi2; 
      ms2(ni2,2)=xi1;
      ms2(ni2,3)=yi2;
      ms2(ni2,4)=yi1;  
      ms2(ni2,5)=xi2-z02;
      ms2(ni2,6)=otn;
      ms2(ni2,7)=dx;
   end
%%%%%end   
   
save gr_arb12.dat ms1 -ascii
save gr_arb23.dat ms2 -ascii
%[aa1]


a1=gr1;
a2=gr2;
a3=gr3;
a4=gr4;
k1=1;
k2=158;

%subplot(2,2,1),plot(a1(:,1),a1(:,3))
subplot(3,2,1),plot(a1(k1:k2,1),a1(k1:k2,3))
title('gr1')
subplot(3,2,2),plot(a2(k1:k2,1),a2(k1:k2,3))
title('gr2')
subplot(3,2,3),plot(a3(k1:k2,1),a3(k1:k2,3))
title('gr3')
subplot(3,2,4),plot(a4(k1:k2,1),a4(k1:k2,3))
title('gr4')
%subplot(2,2,3),plot(ms2(:,1),ms2(:,2))
subplot(3,2,5),plot(ms1(k1:k2,5),ms1(k1:k2,6),ms2(k1:k2,5),ms2(k1:k2,6))
title('gr-arb12   gr-arb23')
subplot(3,2,6),plot(0:1:10,1)
text(0.3,1.5,'pl-gr-arb3-7000','FontSize',8)
text(0.3,1.0,'si=7000 and 7014.4 and 7028.8','FontSize',8)
text(0.3,0.5,'dt-las=96 ns dt-g=96 ns  28 las','FontSize',8)


