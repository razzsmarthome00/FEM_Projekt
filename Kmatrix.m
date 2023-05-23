function K = Kmatrix(Ex,Ey,Ep,Dny,Dcu,newedof,t,ndof,nelm)

K = zeros(2*ndof);
for el=1:nelm
    if t(4,el)==2
        Ke = plante(Ex(el,:),Ey(el,:),Ep,Dny);
    else
        Ke = plante(Ex(el,:),Ey(el,:),Ep,Dcu);
    end
    
    indx = newedof(el,2:end);
    K(indx,indx) = K(indx,indx)+Ke;
end
end

