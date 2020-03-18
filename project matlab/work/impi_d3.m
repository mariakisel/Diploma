%clear all %очистить все переменные
%close all %закрыть все открытые окна с изображениями


%h = imshow('hestain.png');
%hp = impixelinfo;
%set(hp,'Position',[150 290 300 20]);
 %set(hp,'Position',[250 50 300 200]);
 
figure
%imshow(AZN),title('AZN');
%imshow(AZN),title('MZN');
AF=medfilt2((AZN),[3,3]);

subplot(1,2,1),imshow((AF)),title('AZN medfilt2');
set(get(gca,'Title'),'Color','r','FontName','Italic font')
subplot(1,2,2),imshow((AZN)),title('AZN');
%subplot(1,2,2),imshow((MZ16)),title('MZ16');
impixelinfo
%set(get(gca,'Title'),'Color','r')
%title('New Title','Color','r') % Make text color red
set(get(gca,'XLabel'),'String','axis label','Color','b','FontSize',18)

%ax=findobj(fig,'type','axes')
%ha=findobj
%h = findobj(gca,'Type','line')
%h1 = findobj('Label','foo','-and','String','bar');
%h2=gcf
%h3=get(0,'CurrentFigure')
%h3=get(0,'title','AZN')
%h4=get(h,'title')

%patch;surface;text;line
%output = get(get(gca,'Children'),props)
%h5=get
%h6=findall(gcf)
%b = findobj(gcf)