function stress = stressFinder(Ex,Ey,Ep,Cny,Ccu,newedof,t,ndof,nelm,af)
edStress = zeros(nelm,6);
for i=1:nelm
    edStress(i,:)=af(newedof(i,2:7));
end

stress = zeros(2*ndof,1);
for el=1:nelm
    if t(4,el)==2
        [stresse,~] = plants(Ex(el,:),Ey(el,:),Ep,Cny,edStress(el,:));
    else
        [stresse,~] = plants(Ex(el,:),Ey(el,:),Ep,Ccu,edStress(el,:));
    end
    indx = newedof(el,2:end);
    stress(indx) = stress(indx)+stresse';
end
end

