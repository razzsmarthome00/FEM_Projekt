function K = Kfunk(Ex,Ey,ndof,nelm,edof,t,coord,qNewtonCu,ac,k_cu,k_nyl)
% This method calculates K for the heat flow problem using flw2te
th = 5.*10.^(-3);
D_cu = [k_cu,0;0,k_cu];
D_nyl = [k_nyl,0;0,k_nyl];

K = zeros(ndof);

% K for all elements
for el = 1:nelm
    % The loop uses different values for elements in the copper and nylon
    % so we check in the triangle is in body 1 or body 2
    if t(4,el) == 1
        Ke = flw2te(Ex(el,:), Ey(el,:), th, D_cu);     
    else 
        Ke = flw2te(Ex(el,:), Ey(el,:), th, D_nyl);
    end
    indx = edof(el,2:end);
    K(indx,indx) = K(indx,indx) + Ke;
end

% Kc
for el = 1:length(qNewtonCu(1,:))
    n=qNewtonCu(1:2,el);
    L = lengthfinder(n(1),n(2),coord);
    Kc=th*ac*(L/6);
    K(n(1),n(1))=K(n(1),n(1))+2*Kc;
    K(n(1),n(2))=K(n(1),n(2))+Kc;
    K(n(2),n(1))=K(n(2),n(1))+Kc;
    K(n(2),n(2))=K(n(2),n(2))+2*Kc; 
end
K = sparse(K);
end

