function nStress = nodeStress(effectiveStress,edof,ndof)

nStress = zeros(ndof,1);
counter = zeros(ndof,1);

for el=1:length(edof(:,1))
    index = edof(el,2:end);
    nStress(index)=effectiveStress(el)*[1,1,1];
    counter(index)=counter(index)+1;
end
nStress=nStress./counter;
end

