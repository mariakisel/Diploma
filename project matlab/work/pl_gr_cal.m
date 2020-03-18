
clear all
close all
%ik=input('input ik=');

load gr_ms1.dat;

a0=0.5699;
a1=0.3566;
a2=-0.0333;
a3=-0.0189;
a4=0.002238;

s1=6999.6;  %начальное расстояние
s2=7014.4;  %конечное расстояние
ds=0.1;     %шаг сканирования по расстоянию
si=s1;
ni=0;

while si<=s2
    ni=ni+1;
    xi=si;
    x1=xi;
    x2=x1*xi;
    x3=x2*xi;
    x4=x3*xi;
   
   yi=a0+a1*x1+a2*x2+a3*x3+a4*x4;
    mr(ni,1)=si;
    mr(ni,2)=yi;
    si=si+ds;
end

save gr_cal.dat mr -ascii  

subplot(2,1,1),plot(mr(:,1),mr(:,2))
title('pl-gr-cal   calculated calibration curve')
subplot(2,1,2),plot(gr_ms1(:,1),gr_ms1(:,5))
title('pl-gr-arb   calibration curve from')
