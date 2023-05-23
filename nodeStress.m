function effectiveStress_nod = nodeStress(effectiveStress_el,edof,coord)

effectiveStress_nod = zeros(size(coord,1),1);
for i=1:size(coord,1)
[c0,~]=find(edof(:,2:4)==i);
effectiveStress_nod(i,1)=sum(effectiveStress_el(c0))/size(c0,1);
end
end

