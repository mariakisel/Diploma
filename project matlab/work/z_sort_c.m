
clear all
%ik=input('input ik=');
%
load z3
zi=z3;
inx=size(zi);
in=inx(2)
for ix=1:in
[zm,mm]=min(zi(:));
zmin(ix,1)=ix;
zmin(ix,2)=zm;
zi(mm)=100.;
end

save zsort_c zmin -ascii
%save zmin zsort -ascii



subplot(2,2,1),plot(zmin(:,1),zmin(:,2))
%subplot(2,2,3),plot(mr(:,1),mr(:,3))
%subplot(2,2,4),plot(mr(:,1),mr(:,4))

%save mr mr -ascii     
