
clear all
%ik=input('input ik=');
cx1=950.0;
cx2=1250.0;


a0=2.2366E-14;
a1=-1.22454E-16;
a2=2.79918E-19;
a3=-3.41077E-22;
a4=2.33445E-25;
a5=-8.50631E-29;
a6=1.28896E-32;


b0=4.21279E-13;
b1=-2.35729E-15;
b2=5.48703E-18;
b3=-6.80019E-21;
b4=4.73259E-24;
b5=-1.75377E-27;
b6=2.70365E-31;


  x=cx1-1.0;
for m=1:300;
    x=x+1.0;
    x2=x*x;
    x3=x2*x;
    x4=x3*x;
    x5=x4*x;
    x6=x5*x;
    gr1=a0+a1*x+a2*x2+a3*x3+a4*x4+a5*x5+a6*x6;
    gr2=b0+b1*x+b2*x2+b3*x3+b4*x4+b5*x5+b6*x6;
    r=gr2/gr1;
    mr(m,1)=x;
    mr(m,2)=r;
    mr(m,3)=gr1;
    mr(m,4)=gr2;
end
subplot(2,2,1),plot(mr(:,1),mr(:,2))
subplot(2,2,3),plot(mr(:,1),mr(:,3))
subplot(2,2,4),plot(mr(:,1),mr(:,4))

save mr mr -ascii     
