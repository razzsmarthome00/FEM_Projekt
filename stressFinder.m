function stress = stressFinder(Ex,Ey,Dny,Dcu,newedof,t,nelm,af,th,alphaCu,alphaNy,deltaT)
edStress = zeros(nelm,6);
Ep= [2 th];

for i=1:nelm
    edStress(i,:)=af(newedof(i,2:7));
end

stress = zeros(nelm,6);
for el=1:nelm
    deltaTel=(deltaT(t(1,el))+deltaT(t(2,el))+deltaT(t(3,el)))/3;
    deltaTmatrix=[1,1,0,0,0,0]'*deltaTel;
    if t(4,el)==2
        [~,et] = plants(Ex(el,:),Ey(el,:),Ep,Dny,edStress(el,:));
         etd= et'-deltaTmatrix.*alphaNy;
         stresse = Dny*etd;
    else
        [~,et] = plants(Ex(el,:),Ey(el,:),Ep,Dcu,edStress(el,:));
        etd =  et'-deltaTmatrix.*alphaCu;
        stresse = Dcu*etd;
    end
    stress(el,:) = stresse;
end
end

