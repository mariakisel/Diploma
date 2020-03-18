%clear all

%x=ax;
%y=ay;

%mz=MZ0(x,y);
imshow(MZN);
%[ax,ay]=getpts
%[x,y,button] = ginput(...)
%[x,y,button] = ginput(100)

%[x,y] = ginput(100)
[ax,ay] = ginput
axi=int32(ax);
ayi=int32(ay);
mz=MZ0(ayi,axi)
text(50,50,num2str(mz),'FontSize',8)


fig=gcf;         
loc = get(fig,'Position');
haxes = findobj(fig,'type','axes');
ptr_win=get(0,'PointerWindow');
ptr_fig=get(0,'CurrentFigure');
fig_units=get(fig,'units');
pointer=get(gcf,'pointer');
pt=get(gca,'CurrentPoint');
%scrn_pt=get(0,'PointerLocatioh');
         disp(mz)

%msgbox('x','y')
%mz=MZ0(ax,ay)

%pixels = impixel(RGB,c,r) % noninteractively  для точки х=с  и у=r !!!!!
  
 %P = impixel(RGB) % interactively -для точки, обозначенной мышью!!!!!