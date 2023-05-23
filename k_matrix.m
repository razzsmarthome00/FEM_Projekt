function K = k_matrix(Ex,Ey,ndof,nelm,nedof,t,D_cu,D_nyl,th)
% This function calculates the new K-matrix for the displacement problem
% using plante

K = zeros(ndof);
ep = [2 th]; % 2 is for strain
for el = 1:nelm
    % The loop uses different values for elements in the copper and nylon
    % so we check in the triangle is in body 1 or body 2
    if t(4,el) == 1
        Ke = plante(Ex(el,:), Ey(el,:), ep, D_cu);     
    else 
        Ke = plante(Ex(el,:), Ey(el,:), ep, D_nyl);
    end
    indx = nedof(el,2:end);
    K(indx,indx) = K(indx,indx) + Ke;
end
K = sparse(K);
end