%clear
%ik=input('input ik=');
in=-1;
ik=15;
mk=490;
%%%nk=810;
nk=640;
for i1=1:ik
in=in+1;
eval (['YX=imread(''TR',int2str(in),'.tif'');']);
for m=1:mk
    for n=1:nk
        MS1(m,n,ik)=YX(m,n);
    end
end
%eval(['imwrite(TR,''TR',int2str(in),'.bmp'');']);
%eval (['clear CameraFrame',int2str(in1),'.bmp')]);
%in1=in1+1;
end
save MSS MS1
%clear ml li

