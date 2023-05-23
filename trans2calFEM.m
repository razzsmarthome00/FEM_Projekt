function[nelm,edof,coord,ndof,Ex,Ey] = trans2calFEM(p,e,t)
% The function given by the instruction which takes in p,e and t and gives
% nelm, edof, coord, Ex and Ey.

nelm=length(t(1,:));
edof(:,1)=1:nelm;
edof(:,2:4)=t(1:3,:)';
coord=p';
ndof=max(max(t(1:3,:)));
[Ex,Ey]=coordxtr(edof,coord,(1:ndof)',3);
% eldraw2(Ex,Ey,[1,4,1]); 
% This row simply drew the mesh and took a lot of time so it was commented
% out

end