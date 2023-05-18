function [newedof] = nyEdof(edof,nelm)
newedof = zeros(nelm,7);
newedof(:,1)=edof(:,1);
for i = 1:nelm
    newedof(i,2)=edof(i,2)*2-1;
    newedof(i,3)=edof(i,2)*2;
    newedof(i,4)=edof(i,3)*2-1;
    newedof(i,5)=edof(i,3)*2;
    newedof(i,6)=edof(i,4)*2-1;
    newedof(i,7)=edof(i,4)*2;
end

end

