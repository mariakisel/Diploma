
clear all
%ik=input('input ik=');
cx1=1250.0;
cx2=1550.0;

a0=-1.35231e-15;
a1=5.1353e-18;
a2=-7.53894e-21;
a3=5.4563e-24;
a4=-1.95942e-27;
a5=2.8007e-31;

b0=-8.55123e-14;
b1=3.10047e-16;
b2=-4.49333e-19;
b3=3.25448e-22;
b4=-1.17806e-25;
b5=1.70465e-29;

x=cx1-1.0;
for m=1:300;
    x=x+1.0;
    x2=x*x;
    x3=x2*x;
    x4=x3*x;
    x5=x4*x;
    x6=x5*x;
    %gr1=a0+a1*x+a2*x2+a3*x3+a4*x4+a5*x5+a6*x6;
    %gr2=b0+b1*x+b2*x2+b3*x3+b4*x4+b5*x5+b6*x6;
    gr1=a5*x5+a4*x4+a3*x3+a2*x2+a1*x+a0;
    gr2=b5*x5+b4*x4+b3*x3+b2*x2+b1*x+b0;
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