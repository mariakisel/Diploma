clear all

A=imread('TR14.tif');
A1=imshow(A);
%P=impixel(A)  % interactively -��� �����, ������������ �����!!!!!
              %����� ������ Enter � �� ������ �������� �������������
%���� P = impixel(A1) - �� �������� !!!!!!!!!!!!!!

%%%[x,y,I]=impixel(A) 

%pixval('off')
[x,y]=getpts  %%%������ ������� ��������� � � �

%i=input('input i=');
mx=size(y);
mi=mx(1);
for ni=1:mi
MI(1,ni)=x(ni);
MI(2,ni)=y(ni); 
MI(3,ni)=double(A(uint8(x(ni)),y(ni))); %%%����� ������������� ��� ������� �������
end
%RGB = imread('peppers.png');
%        c = [12 146 410];
 %       r = [104 156 129];
 %c = [12];
 %r = [104];
%pixels = impixel(RGB,c,r) % noninteractively  ��� ����� �=�  � �=r !!!!!
  
 %P = impixel(RGB) % interactively -��� �����, ������������ �����!!!!!