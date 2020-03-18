%clear all %очистить все переменные
%close all %закрыть все открытые окна с изображениями

       %h = imshow('hestain.png');
       % hp = impixelinfo;
        %set(hp,'Position',[150 290 300 20]);
       
        global zc1 zc2 zc3
       
        figure
        
        A=imread('AZN.tif');
        imshow(A);
        %colorbar('YTickLabel',...
    %{'Freezing','Cold','Cool','Neutral','Warm','Hot','Burning'})
        
    colorbar('YTickLabel', {zc1,zc2,zc3})
    set(gca,'YTickLabel',['1  ';'10 ';'100']),title('AZN')
        
        % set(gca,'YLim',[0 100])  
%%%%        impixelinfo
