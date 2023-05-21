function [nelm,edof,coord,ndof,Ex,Ey] = trans2calfem(p,t)
%TANS2CALFEM Summary of this function goes here
%   Detailed explanation goes here
nelm=length(t(1,:));
edof(:,1)=1:nelm;
edof(:,2:4)=t(1:3,:)';
coord=p' ;
ndof=max(max(t(1:3,:)));
[Ex,Ey]=coordxtr(edof,coord,(1:ndof)',3);
%eldraw2(Ex,Ey,[1,4,1]);
end

