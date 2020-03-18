%clear all %очистить все переменные
%close all %закрыть все открытые окна с изображениями

       %h = imshow('hestain.png');
       % hp = impixelinfo;
        %set(hp,'Position',[150 290 300 20]);
   
        
       %% figure
       
        A=imread('AZN.tif');
        image(A);
        title('AZN');
        %image(X);
        %colormap(gray);xlabel('gray');
        colormap(jet),xlabel('jet');
        %colormap(lines),xlabel('lines');
        %colormap(hot),xlabel('hot');
        
        
        % set(gca,'YLim',[0 100])  
%%%%        impixelinfo
