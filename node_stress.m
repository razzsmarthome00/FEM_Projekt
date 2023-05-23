function ns = node_stress(effectiveStress,edof,coord)

ns = zeros(size(coord,1),1);

for i=1:size(coord,1)
[c0,~]=find(edof(:,2:4)==i);
ns(i,1)=sum(effectiveStress(c0))/size(c0,1);
end



end