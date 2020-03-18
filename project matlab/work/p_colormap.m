%clear
%ik=input('input ik=');

A=imread('TR14.tif');

[m n k]=size(A);

%линейное контрастирование
y_mn=0;
y_mx=255;
B=im2double(A);
x_mn=min(min(B));
x_mx=max(max(B));
ci=(y_mx-y_mn)/(x_mx-x_mn);

for nn=1:n
for mm=1:m   
C(mm,nn)=(B(mm,nn)-x_mn)*ci+y_mn;
end
end
%C1=medfilt2(C);
%C2=im2uint8(C1);
D1=imnoise(A,'salt & pepper',0.02);
D2=medfilt2(D1);

%можно контрастировать проще
J=imadjust(A,stretchlim(A),[0 1]);


%imwrite(J,'J1.tif');

subplot(2,2,1),imshow(A);title('nou adjust');
subplot(2,2,2),imshow(C);title('linear adjust');

subplot(2,2,3),imshow(D1);title('salt-pepper');
subplot(2,2,4),imshow(D2);title('medfilt2');

%adding colorbar
%h=[1 2 1; 0 0 0; -1 -2 -1];
%J_CB=filter2(h,J);
%imwrite(J_CB,'J_CB1.tif');

%subplot(1,2,1),imshow(J,[]), colorbar;title('colorbar');
%subplot(1,2,2),imshow(C2,[]), colorbar;title('colorbar');

%%%figure, imshow(J,[]), colorbar;title('colorbar');

%figure,imshow(SUM1);title('отнормировано');

