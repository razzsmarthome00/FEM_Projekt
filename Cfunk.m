function C = Cfunk(Ex,Ey,t,nelm,ndof,edof,x_cu,x_nyl)

% This method finds the Ce-matrix for each element and assembles them into
% a full C-matrix.
C = zeros(ndof);
for el = 1:nelm
    % The loop uses different values for elements in the copper and nylon
    % so we check in the triangle is in body 1 or body 2
    if t(4,el) == 1
        Ce = plantml(Ex(el,:),Ey(el,:),x_cu);
    else 
        Ce = plantml(Ex(el,:),Ey(el,:),x_nyl);
    end
    indx = edof(el,2:end);
    C(indx,indx) = C(indx,indx) + Ce;
end
% The matrix are saved as sparse matricies which saves a LOT of time
C = sparse(C);
end