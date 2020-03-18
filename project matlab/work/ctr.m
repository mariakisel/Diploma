%clear
%ik=input('input ik=');

A=imread('TR14.tif');

[m n k]=size(A);

%линейное контрастирование
y_mn=0;
y_mx=1;
B=im2double(A);
x_mn=min(min(B));
x_mx=max(max(B));
ci=(y_mx-y_mn)/(x_mx-x_mn);

for nn=1:n
for mm=1:m   
C(mm,nn)=(B(mm,nn)-x_mn)*ci+y_mn;
end
end
C1=medfilt2(C);
C2=im2uint8(C1);

%можно контрастировать проще
J=imadjust(A,stretchlim(A),[0 1]);


%imwrite(J,'J1.tif');

subplot(2,2,1),imshow(A);title('nou contr');
subplot(2,2,2),imshow(C2);title('linear contr');
subplot(2,2,3),imshow(J);title('imadjust');
subplot(2,2,4),imshow(C1);title('medfilt2');

%adding colorbar
%h=[1 2 1; 0 0 0; -1 -2 -1];
%J_CB=filter2(h,J);
%imwrite(J_CB,'J_CB1.tif');

%subplot(1,2,1),imshow(J,[]), colorbar;title('colorbar');
%subplot(1,2,2),imshow(C2,[]), colorbar;title('colorbar');

%figure, imshow(J,[]), colorbar;title('colorbar');
%figure,imshow(SUM1);title('отнормировано');
%clear ml li
%save SUM1 SUM 
