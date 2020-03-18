%adjust image intensity values

%clear
%ik=input('input ik=');
ik=18;
in=0;
SI=imread('CameraFrame0.bmp');
SI_TR=rgb2gray(SI);

[m n k]=size(SI_TR);

for m=1,3;
  for n=1,3;
    for k=1,5;
ms(m,n,k)=k;
    end
  end
end
