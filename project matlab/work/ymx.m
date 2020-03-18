%clear
%ik=input('input ik=');
ik=15;
mk=490;
nk=810;
for mi=1:mk
for ni=1:nk
for i1=1:ik
y1(i1)=MS1(m,n,i1);
end
ymxi=max(y1(:));
ymxx(m,n)=ymxi;
end
end
plot((1:15),ymxx(200,300,:))

%clear ml li
%save ymx1 ymxx  -ascii
save ymx1 ymxx 
