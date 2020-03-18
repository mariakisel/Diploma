clear all %очистить все переменные
close all %закрыть все открытые окна с изображениями


%h = imshow('hestain.png');
%hp = impixelinfo;
%set(hp,'Position',[150 290 300 20]);
 %set(hp,'Position',[250 50 300 200]);
 
figure
subplot(1,2,1), imshow('liftingbody.png');
subplot(1,2,2), imshow('autumn.tif');
impixelinfo
