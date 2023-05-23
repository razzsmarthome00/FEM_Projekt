function F = Ffunk(ndof,coord,qNewtonCu,T_inf,ac,qhCu,th,h)

% Newton boundary conditions
F = zeros(ndof,1);
for node = 1:length(qNewtonCu)
    n = qNewtonCu(1:2,node);
    L = lengthfinder(n(1),n(2),coord);
    Fe = th*T_inf*ac*L*0.5;    
    F(n(1))=F(n(1))+Fe;
    F(n(2))=F(n(2))+Fe;
    
end

% Heat convection 
for node = 1:length(qhCu(1,:))
    n = qhCu(1:2,node);
    L = lengthfinder(n(1),n(2),coord);
    Fe = -th*h*L*0.5;
    F(n(1))=F(n(1))+Fe;
    F(n(2))=F(n(2))+Fe;
end
% Other boundary conditions are zero, we don't need to add anything else to F
end