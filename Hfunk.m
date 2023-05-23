function H = Hfunk(Ex,Ey,Ep,Dny,Dcu,newedof,t,ndof,nelm,alphaCu,alphaNy,deltaT)
H = zeros(2*ndof,1);
for el=1:nelm
    deltaTel=(deltaT(t(1,el))+deltaT(t(2,el))+deltaT(t(3,el)))/3;
    deltaTmatrix=[1,1,0,0,0,0]'*deltaTel;
    if t(4,el)==2
        He = plantf(Ex(el,:),Ey(el,:),Ep,(Dny*alphaNy*deltaTmatrix)');
    else
        He = plantf(Ex(el,:),Ey(el,:),Ep,(Dcu*alphaCu*deltaTmatrix)');
    end
    
    indx = newedof(el,2:end);
    H(indx) = H(indx)+He;
end
end

