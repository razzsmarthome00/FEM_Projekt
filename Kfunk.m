function K = Kfunk(Ex,Ey,ndof,nelm,edof,t,coord,qNewtonCu,ac,th,DCu,DNyl)
K = zeros(ndof);

for el=1:nelm
    if t(4,el)==2
        Ke = flw2te(Ex(el,:),Ey(el,:),th,DNyl);
    else
        Ke = flw2te(Ex(el,:),Ey(el,:),th,DCu);
    end
    
    indx = edof(el,2:end);
    K(indx,indx) = K(indx,indx)+Ke;
end

for el=1:length(qNewtonCu(1,:))
    n=qNewtonCu(1:2,el);
    L = lengthfinder(n(1),n(2),coord);
    Kc=th*ac*(L/6);
    K(n(1),n(1))=K(n(1),n(1))+2*Kc;
    K(n(1),n(2))=K(n(1),n(2))+Kc;
    K(n(2),n(1))=K(n(2),n(1))+Kc;
    K(n(2),n(2))=K(n(2),n(2))+2*Kc;
%     Kc=th*ac*(L/6)*[0 0 0; 0 2 1; 0 1 2];
%     indx = edof(elementFinder(n(2),n(1), edof),2:end);
%     K(indx,indx) = K(indx,indx)+Kc;
end

end

