function stress = stressFinder(Ex,Ey,Dny,Dcu,newedof,t,nelm,af,th)
edStress = zeros(nelm,6);
Ep= [1 th];
for i=1:nelm
    edStress(i,:)=af(newedof(i,2:7));
end

stress = zeros(nelm,6);
for el=1:nelm
    if t(4,el)==2
        [stresse,~] = plants(Ex(el,:),Ey(el,:),Ep,Dny,edStress(el,:));
    else
        [stresse,~] = plants(Ex(el,:),Ey(el,:),Ep,Dcu,edStress(el,:));
    end
    stress(el,:) = stresse;
end
end

