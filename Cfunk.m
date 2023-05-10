function C = Cfunk(Ex,Ey,nelm,t,rhoCu,rhoNy,cpCu,cpNy,edof,ndof,th)
xCu =rhoCu*cpCu*th;
xNy = rhoNy*cpNy*th;

C = zeros(ndof);

for el=1:nelm
    if t(4,el)==2
        Ce = plantml(Ex(el,:),Ey(el,:),xNy);
    else
        Ce = plantml(Ex(el,:),Ey(el,:),xCu);
    end
    
    indx = edof(el,2:end);
    C(indx,indx) = C(indx,indx)+Ce;
end
end

