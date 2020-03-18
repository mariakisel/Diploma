
%%%%%вычисляется среднее значение яркости пикселя при усреднении по 
%%%%%определенной площади изображения;
%%%%%задаются координаты центра 4-х точек;


%clear
%ik=input('input ik=');

nkon=61; %число заснятых кадров
s_fr1=23.;  %расстояние (в м), соответствующее 1-му кадру
ds=1.0;      %пространственный шаг смещения (в м) от кадра к кадру

       %%%%% координаты 4-х точек для области усреднения
n1=355;   %значения х
n2=370;
m1=280;   %значения у
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