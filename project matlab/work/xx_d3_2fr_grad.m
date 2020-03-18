
%%%RIP - ��������, ����� dt_��� = 2dt_���
%%%���������� 3D ����������� �� 2 ������


clear all %�������� ��� ����������
close all %������� ��� �������� ���� � �������������
%ik=input('input ik=');

global ZMIN DZX
       

ma1=size(MA);
ma2=ma1(1,1);
dya0=0.0005;
mb1=size(MB);
mb2=mb1(1,1);
dyb0=0.0005;

AU1=imread('VET1.tif');

%����������� 2 ����� � �������������
A1=im2double(imread('VET1.tif'));
A2=im2double(imread('VET2.tif'));

%AM1=medfilt2(A1);
%AM2=medfilt2(A2);

[a b c]=size(A2);

ax=50;
ay=30;

z01=650;  %��������������� �� ������ ���������� S_���_100% ��� 1-�� �����; �
z02=950;  %��������������� �� ������ ���������� S_���_100% ��� 2-�� �����; �
dz=50;    % ����� �����,������ ������ ������ � �����; �

[m1,n1]=size(A1);
[m2,n2]=size(A2);
am=[m1 m2];
an=[n1 n2];
mmin=min(am);
nmin=min(an);
mk=mmin;
nk=nmin;
         %%%����������� ������� �������� M11 M12, ��� ������� A2(m,n)<A1(m,n)
         %%%1-� �������� (��������� I_1_���_100%...I_1_���_100%)
i1=1;
for m=1:mk,
     for n=1:nk,
         if A2(m,n)<A1(m,n)             
                 M11(i1)=m;
                 M12(i1)=n;
                 i1=i1+1;
         end
     end
end
save M11 M11 -ascii
save M12 M12 -ascii

          %%%����������� ������� �������� M21 M22, ��� ������� A1(m,n)<A2(m,n)
         %%%2-� �������� (��������� I_2_���_100%...I_2_���_100%)
i2=1;
for m=1:mk,
     for n=1:nk,
         if A1(m,n)<A2(m,n)            
                 M21(i2)=m;
                 M22(i2)=n;
                 i2=i2+1;
         end
     end
end     %XXXXXXXXXXXXXX
save M21 M21 -ascii
save M22 M22 -ascii


       %%%��������� ��������� �������������� ��� ������� �� ��������,
       %%%��������������� ���� ����� ��������������� �������� RIP
s1=size(M11);
sx1=s1(1,2);
k1=1;
for m1=1:sx1,
    i1=M11(k1);
    j1=M12(k1);
    z1(k1)=double(A2(i1,j1)/A1(i1,j1));
    z1k1=z1(k1);
%������� - ���������� ���������� � ������ ��������������� �����
%��������� ���������
    %MZ1(i,j)=z01+z1*dz;

    for mai=1:ma2
    dya=abs(MA(mai,2)-z1k1);
       if dya<dya0
       %zax=MA(mai,1);
       MZ0(i1,j1)=MA(mai,1);
       break
       else      
       end 
    end
 %%rela=(zax-cax1)/cax21;  
    %%MZ0(i1,j1)=double(z01+rela*dz);
k1=k1+1;
end

s2=size(M21);
sx2=s2(1,2);
k2=1;
for m2=1:sx2,
    i2=M21(k2);
    j2=M22(k2);
    z2(k2)=double(A1(i2,j2)/A2(i2,j2));
    z2k2=z2(k2);
    %MZ2(i,j)=z02+z2*dz;
    
for mbi=1:mb2
    dyb=abs(MB(mbi,2)-z2k2);
   if dyb<dyb0
       %zbx=MB(mbi,1);
        MZ0(i2,j2)=MB(mbi,1);
    break
   else      
   end   
end   
%%%%%!!!!!relb=(cbx2-zbx)/cbx21; 
%relb=(zbx-cbx1)/cbx21;
    %MZ0(i2,j2)=double(z02+relb*dz);
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
MZ16=uint16(MZ0);
save MZ16 MZ16 -ascii
save z1 z1 -ascii
save z2 z2 -ascii

%%%���������� � [�]��������� ����� �������, ����� ��� ���������������
%%%�������� ������������ ����������� (grayscale - ������ ������): [0...255]
ZMIN=min(min(MZ0));
zmax=max(max(MZ0));
DZX=zmax-ZMIN;
%xi=255/mxz;
for m=1:mk,
     for n=1:nk,
         MZN(m,n)=255.*((MZ0(m,n)-ZMIN)/DZX);
         %%%MZN(m,n)=double(255.*((MZ0(m,n)-zmin)/dzx)); 
         %%%MZN(m,n)=uint8(255.*((MZ0(m,n)-zmin)/dzx));  
         %MZN(m,n)=uint8(255.*(zmax-MZ0(m,n))/dzx);
     end
end
save MZN MZN -ascii
imwrite(MZN,'MZN1.tif');

AZN=AU1;
for m=1:mk,
     for n=1:nk,
         AZN(m,n)=uint8(MZN(m,n));             
     end
end
%%%save AZN AZN -ascii
zm1=min(min(AZN));
zm2=max(max(AZN));

AZNADJ=imadjust(AZN);

 %%%imshow(imcomplement(MZN))%%%������ ����� �� ���������������
B=imread('TR12.tif');

%y=gray2rgb(MZN);
%[y,newmap]=cmpermute(MZN);

%caxis([300 350])
dz=(zmax-ZMIN)/5;
%zc1=uint16(zmin);
%zc2=uint16(zmin+2*dz);
%zc3=uint16(zmin+4*dz);
%zcmax=uint16(zmax);
zc1=round(ZMIN);
zc2=round(ZMIN+2*dz);
zc3=round(ZMIN+4*dz);
zcmax=round(zmax);

subplot(3,3,1),imshow(A1),title('A1');
subplot(3,3,2),imshow(A2),title('A2');
subplot(3,3,3),imshow(A3),title('A3');

%subplot(3,3,4),imshow(imadjust(AZN)),title('AZN uint8 0-255');
subplot(3,3,4),imshow((AZN)),title('AZN');

%subplot(3,3,5),imshow(AZNADJ),title('AZNADJ');
subplot(3,3,5),imshow(MZ16),title('MZ16');
subplot(3,3,6),imshow(B),title('TR12.tif');
%subplot(3,3,6),imshow(MZ0);title('MZ0');
subplot(3,3,7),imshow(MZN),title('MZN double');
subplot(3,3,8),imshow(AZNADJ),title('AZNADJ'),colorbar;
%subplot(3,3,9),imshow(cmpermute(y));title('y');colorbar;
%subplot(3,3,9),imshow(y);title('y');colorbar;
%subplot(3,3,9),imshow(cmpermute(MZN));title('MZN');colorbar;

%%%subplot(3,3,9),imshow(AZN),xlabel('AZN dist-m'),...
    %%%colorbar('YTickLabel', {zc1,zc2,zc3})

subplot(3,3,9),imshow(AZN),...
    colorbar('YTickLabel', {zc1,zc2,zc3})
set(gca,'YTickLabel',['1  ';'10 ';'100'])

imwrite(AZNADJ,'AZNADJ1.tif');
    
    %set(gca,'YLim',[300 800],'YTick',[300 400 500]))
    %%%%%%%%%%colorbar, %%%%caxis([-1 0])

%imshow(MZ0),title('MZ0');
%imshow(AZN),title('AZN');

%imshow(AZN),title('AZN'),colormap(jet(64)), colorbar
%imshow(AZN),title('AZN'), colorbar


%I=MZN;
%BW1 = edge(I,'prewitt');
%BW2 = edge(I,'canny');
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