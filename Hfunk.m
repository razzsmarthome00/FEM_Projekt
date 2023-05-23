function H = Hfunk(Ex,Ey,ndof,nelm,nedof,t,D_cu,D_nyl,th,deltaT,alpha_cu,alpha_nyl)
% This method calculates the function we have called H. Essentially it just
% uses plantf on all the elements and assembles a nndof x 1 matrix with all
% the values.

H = zeros(ndof,1);
ep = [2 th]; % 2 is for strain

for el = 1:nelm
    deltaTel = (deltaT(t(1,el))+deltaT(t(2,el))+deltaT(t(3,el)))/3;
    deltaTvec = [1;1;0;0;0;0]*deltaTel;
    % The loop uses different values for elements in the copper and nylon
    % so we check in the triangle is in body 1 or body 2
    if t(4,el) == 1
        He = plantf(Ex(el,:), Ey(el,:), ep, (D_cu*alpha_cu*deltaTvec)');     
    else 
        He = plantf(Ex(el,:), Ey(el,:), ep, (D_nyl*alpha_nyl*deltaTvec)');
    end
    indx = nedof(el,2:end);
    H(indx) = H(indx) + He;
end
end