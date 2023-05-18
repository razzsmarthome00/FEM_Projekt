function K = Kmatrix(Ex,Ey,Ep,Cny,Ccu,newedof,t,ndof,nelm)

K = zeros(2*ndof);
for el=1:nelm
    if t(4,el)==2
        Ke = plante(Ex(el,:),Ey(el,:),Ep,Cny);
    else
        Ke = plante(Ex(el,:),Ey(el,:),Ep,Ccu);
    end
    
    indx = newedof(el,2:end);
    K(indx,indx) = K(indx,indx)+Ke;
end
end

