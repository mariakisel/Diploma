
%clear all
%ik=input('input ik=');
cx1=1250.0;
cx2=1550.0;

%p1 = 5.241e-008;
  %p2 = -0.00021612;
 % p3 = 0.29247;
  %p4 = -129.25;

% y= p1*x^3 + p2*x^2 +
 %     p3*x^1 + p4; 
 
%load gr_m.mat -ascii

%
load gr_c1_c2.dat
for ix=1:21
gr_c1_c2(ix,4)=gr_c1_c2(ix,3)/gr_c1_c2(ix,2);
end

p1 = 5.195e-008;
p2 = -0.00021416;
p3 = 0.28968;
p4 = -127.94;
x=1250:0.5:1550;
y = p1*x.^3 + p2*x.^2 + p3*x.^1 + p4; 




subplot(2,1,1);plot(gr_c1_c2(:,1),gr_c1_c2(:,4))
subplot(2,1,2);plot(x,y)
%A=load('gr_m.dat');
%A=load('gr_m.mat -ascii')
%A=load(grm.mat -ascii)
%load c:\Program Files\MATLAB704\work\grm

x=1
%A=load('gr_m.mat -ascii');
%A=load('gr_m -ascii')




%subplot(2,2,1),plot(mr(:,1),mr(:,2))
%subplot(2,2,3),plot(mr(:,1),mr(:,3))
%subplot(2,2,4),plot(mr(:,1),mr(:,4))

%save mr mr -ascii     
