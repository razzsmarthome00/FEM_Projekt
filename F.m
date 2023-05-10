function F = F(qNewtonCu,coord,TInf,ac,ndof,qhCu,h,th)
F = zeros(ndof,1);

%Convection Boundary 
for el=1:length(qNewtonCu(1,:))
    n=qNewtonCu(1:2,el);
    L = lengthfinder(n(1),n(2),coord);
    Fe = th*TInf*ac*L*0.5;
    F(n(1))=F(n(1))+Fe;
    F(n(2))=F(n(2))+Fe;
end

% q= h boundary conditions
for el=1:length(qhCu(1,:))
    n=qhCu(1:2,el);
    L = lengthfinder(n(1),n(2),coord);
    Fe = -th*h*L*0.5;
    F(n(1))=F(n(1))+Fe;
    F(n(2))=F(n(2))+Fe;
end
end

