
%%%%%����������� ������� �������� ������� ������� ��� ���������� �� 
%%%%%������������ ������� �����������;
%%%%%�������� ���������� ������ 4-� �����;


%clear
%ik=input('input ik=');

nkon=61; %����� �������� ������
s_fr1=23.;  %���������� (� �), ��������������� 1-�� �����
ds=1.0;      %���������������� ��� �������� (� �) �� ����� � �����

       %%%%% ���������� 4-� ����� ��� ������� ����������
n1=355;   %�������� �
n2=370;
m1=280;   %�������� �
m2=296;
dn=n2-n1+1;
dm=m2-m1+1;
mnk=dm*dn;
MS0=0;

is=0;
for i1=1:nkon
MS1=0;

eval (['X=imread(''CameraFrame',int2str(i1-1),'.bmp'');']);
D=im2double(X);

for m=m1:m2
    for n=n1:n2
        MS1=MS1+D(m,n);
    end
end
si=s_fr1+is*ds;
MS0(i1,1)=si;
MS0(i1,2)=MS1/mnk;
%eval(['imwrite(TR,''TR',int2str(in),'.bmp'');']);
%eval (['clear CameraFrame',int2str(in1),'.bmp')]);
is=is+1;
end

save ms_mov_i MS0 -ascii
plot(MS0(:,1),MS0(:,2))

%clear ml li
