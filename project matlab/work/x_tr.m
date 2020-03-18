%clear
%ik=input('input ik=');
in=-1;
ik=16;
for i1=1:ik
in=in+1;
eval (['X=imread(''CameraFrame',int2str(in),'.bmp'');']);
TRI=rgb2gray(X);
eval(['imwrite(TRI,''TR',int2str(in),'.tif'');']);
%eval(['imwrite(TRI,''TR',int2str(in),'.bmp'');']);
end
%clear ml li
%save SUM1 SUM 
