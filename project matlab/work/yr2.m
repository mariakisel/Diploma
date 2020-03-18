clear
%ik=input('input ik=');
nk=100;
i=0;
for n=1:nk
    i=i+1;
    i2=i*i;
y(n)=1.0/i2;
x(n)=n;
end
plot(x,y);
%yl=0.2;
title('y=1/(r*r)');
%clear ml li
%save SUM1 SUM 