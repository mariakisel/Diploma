%clear
%ik=input('input ik=');

A1=imread('SUM1.tif');
A2=imread('SUM2.tif');
AD1=imread('SUM1_ADJ.tif');
AD2=imread('SUM2_ADJ.tif');


%SUM1=SI_S1;
%SUM2=SI_S2/ik;
%SUM1_ADJ=imadjust(SUM1);
%SUM2_ADJ=imadjust(SUM2);


%imshow(SUM);title('сумма-нормированная');
subplot(2,2,1),imshow(A1);title('SUM1');
subplot(2,2,2),imshow(A2);title('SUM2');
subplot(2,2,3),imshow(AD1);title('SUM1-imadjust');
subplot(2,2,4),imshow(AD1);title('SUM2-imadjust');
%subplot(2,2,4),imshow(J);title('imadjust');
