
%%%RIP - �����������, ����� dt_��� = dt_���
%%%���������� 3D ����������� �� 3 ������


clear all
%ik=input('input ik=');

AU1=imread('VET1.tif');
%A2=imread('VET2.tif');
%A3=imread('VET3.tif');

%����������� 3 ����� � �������������
A1=im2double(imread('VET1.tif'));
A2=im2double(imread('VET2.tif'));
A3=im2double(imread('VET3.tif'));

%AM1=medfilt2(A1);
%AM2=medfilt2(A2);
%AM3=medfilt2(A3);

[a b c]=size(A3);

ax=50;
ay=30;

z01=300;  %��������������� �� ������ ���������� S_���_100% ��� 1-�� �����; �
z02=350;  %��������������� �� ������ ���������� S_���_100% ��� 2-�� �����; �
z03=400;  %��������������� �� ������ ���������� S_���_100% ��� 3-�� �����; �
dz=50;    % ����� �����,������ ������ ������ � �����; �

mk=150;  %����� ����� � �����
nk=240;  %����� �������� � �����

i1=1;
for m=1:mk,
     for n=1:nk,
         if A3(m,n)<A1(m,n)             
                 M11(i1)=m;
                 M12(i1)=n;
                 i1=i1+1;
         end
     end
end
save M11 M11 -ascii
save M12 M12 -ascii

i2=1;
for m=1:mk,
     for n=1:nk,
         if A3(m,n)>A1(m,n)
                 
                 M21(i2)=m;
                 M22(i2)=n;
                 i2=i2+1;
             
         end
     end
end     %XXXXXXXXXXXXXX
save M21 M21 -ascii
save M22 M22 -ascii



%%%��������� ���������� ��� ������� �������,
%%%��������� 3 ���� ��������������� �������� RIP
AMX1=max(max(A1));
s1=size(M11);
sx1=s1(1,2);
k1=1;
for m1=1:sx1,
    i1=M11(k1);
    j1=M12(k1);
    oz1(k1)=double(A2(i1,j1)/AMX1);
    %MZ1(i,j)=z01+z1*dz;
    MZ0(i1,j1)=double(z01+oz1(k1)*dz);
     k1=k1+1;
end
AMX2=max(max(A2));
s2=size(M21);
sx2=s2(1,2);
k2=1;
for m2=1:sx2,
    i2=M21(k2);
    j2=M22(k2);
    oz2(k2)=double(A3(i2,j2)/AMX2);
    %MZ2(i,j)=z02+z2*dz;
    MZ0(i2,j2)=double(z02+oz2(k2)*dz);
    k2=k2+1;
end





for m=1:mk,
     for n=1:nk,
         if MZ0(m,n)<z01             
                 MZ0(m,n)=z01;
         end
     end
end
save MZ0 MZ0 -ascii

%%%���������� � [�]��������� ����� �������, ����� ��� ���������������
%%%�������� ������������ ����������� (grayscale - ������ ������): [0...255]
zmin=min(min(MZ0));
zmax=max(max(MZ0));
dzx=zmax-zmin;
%xi=255/mxz;
for m=1:mk,
     for n=1:nk,
         MZN(m,n)=double(255.*((MZ0(m,n)-zmin)/dzx)); 
         %%%MZN(m,n)=uint8(255.*((MZ0(m,n)-zmin)/dzx));  
         %MZN(m,n)=uint8(255.*(zmax-MZ0(m,n))/dzx);
     end
end
save MZN MZN -ascii

AZN=AU1;
for m=1:mk,
     for n=1:nk,
         AZN(m,n)=uint8(MZN(m,n));             
     end
end
%%%save AZN AZN -ascii

AZNADJ=imadjust(AZN);
%%%%%A0RGB=label2rgb(A0ADJ);%%%%%
%save MZ3 MZ3 -ascii

 %cmin=min(A2,[],240);
% [m1,i1]=min(min(AM2))
% [m2,i2]=max(max(AM2))
 %[m1,i1]=min(A2)
 %[m2,i2]=min(A2')
 
 %%%imshow(imcomplement(MZN))%%%������ ����� �� ���������������
B=imread('TR12.tif');

%y=gray2rgb(MZN);
%[y,newmap]=cmpermute(MZN);

subplot(3,3,1),imshow(A1);title('A1');
subplot(3,3,2),imshow(A2);title('A2');
subplot(3,3,3),imshow(A3);title('A3');
subplot(3,3,4),imshow(imadjust(AZN));title('AZN');
subplot(3,3,5),imshow(AZNADJ);title('AZNADJ');
subplot(3,3,6),imshow(B);title('TR12.tif');
%subplot(3,3,6),imshow(MZ0);title('MZ0');
subplot(3,3,7),imshow(MZN);title('MZN');
subplot(3,3,8),imshow(AZNADJ);title('AZNADJ');colorbar;
%subplot(3,3,9),imshow(cmpermute(y));title('y');colorbar;
%subplot(3,3,9),imshow(y);title('y');colorbar;
%subplot(3,3,9),imshow(cmpermute(MZN));title('MZN');colorbar;
subplot(3,3,9),imshow(AZN);title('AZN');colorbar;

subimage(AZN,map)
I=MZN;
BW1 = edge(I,'prewitt');
BW2 = edge(I,'canny');
%figure, imshow(BW1)
%figure, imshow(BW2)
%subplot(2,2,1),imshow(BW1);title('edge BW1');
%subplot(2,2,2),imshow(BW2);title('edge BW2');

%AI=imcomplement(MZN); %������ ���� �� ���������������
%figure,imshow(MZN),figure,imshow(AI)


%adding colorbar
%h=[1 2 1; 0 0 0; -1 -2 -1];
%J_CB=filter2(h,J);
%imwrite(J_CB,'J_CB1.tif');

%subplot(1,2,1),imshow(J,[]), colorbar;title('colorbar');
%subplot(1,2,2),imshow(C2,[]), colorbar;title('colorbar');

%figure, imshow(J,[]), colorbar;title('colorbar');
%figure,imshow(SUM1);title('�������������');
%clear ml li
%save SUM1 SUM 
