close all
clear
clc

addpath("D:\Program\MATLAB\toolbox\fem");
addpath("D:\Program\MATLAB\toolbox\geom");

load('pet.mat', 'p')
load('pet.mat', 'e')
load('pet.mat', 't')

[nelm,edof,coord,ndof,Ex,Ey] = trans2calfem(p,t);

[qNewtonCu,~] = bound([1 2 3 5 6 14 18 20],e);
[qhCu, ~] = bound([17],e);
[q0Cu, ~] = bound([16 8],e);
[q0Ny,~] = bound([15 7],e);

TInf = 18;
ac=40;
th = 0.005;
h= -10^5;
rhoCu = 8930;
rhoNy = 1100;
cpCu = 386;
cpNy = 1500;
kCu = 385;
kNyl= 0.26;


DCu=[kCu,0;0,kCu];
DNyl = [kNyl,0;0,kNyl];

K = sparse(Kfunk(Ex,Ey,ndof,nelm,edof,t,coord,qNewtonCu,ac,th,kCu,kNyl));
F = Ffunk(qNewtonCu,coord,TInf,ac,ndof,qhCu,h,th);
C = sparse(Cfunk(Ex,Ey,nelm,t,rhoCu,rhoNy,cpCu,cpNy,edof,ndof,th));

%% Uppgift a)
clc
close all

a= solveq(K,F);
max_stat= max(a);
ed = extract(edof,a);
print1(Ex,Ey,ed)

%% Uppgift b)
clc
close all

t0=0;
t1 = 100;
N=200;   
dt= (t1-t0)/N;
tgrid = linspace(t0,t1,dt);

a0 = 18*ones(ndof,1);
uold = a0;
i = 1;
a1 =zeros(ndof);
while max_stat*0.9 >= max(a1)
    a1 = ((C+dt.*K)\(C*uold+dt.*F)); %Implicit Euler
    uold = a1;
    i = i + 1;
end
time = i*dt;
i3 = 0.03*i;

ed = extract(edof,a1);
print1(Ex,Ey,ed)
    
M = 5;

uold = a0;

for k =1:M
    uold = a0;
    a1 = plottime(a0,K,F,C,dt,i3,ndof,N,k,M);
    figure(k)
    ed = extract(edof,a1);
    print1(Ex,Ey,ed)
    caxis([18, 27]);
end


%% Uppgift c
clc
close all
newedof=nyEdof(edof,nelm);
a0 = 18*ones(ndof,1);

Enyl = 3*10^9;
vnyl=0.39;
Gnyl=Enyl/(2*(1+vnyl));


Ecu=128*10^9;
vcu=0.36;
Gcu=Ecu/(2*(1+vcu));

Cny=Cmatrix(Enyl,vnyl,Gnyl);
Ccu=Cmatrix(Ecu,vcu,Gcu);

Dny=inv(Cny);
Dcu=inv(Ccu);

deltaT=a-a0;
alphaCu=17.6*10^(-6);
alphaNy = 80*10^(-6);

Ep= [2 th];
Km = sparse(Kmatrix(Ex,Ey,Ep,Dny,Dcu,newedof,t,ndof,nelm));
Hmatrix = Hfunk(Ex,Ey,Ep,Dny,Dcu,newedof,t,ndof,nelm,alphaCu,alphaNy,deltaT);

[~,bc1_index] = bound([17 16 15],e);
[~,bc2_index] = bound(4,e);
[~,bc3_index] = bound(21,e);
bc=zeros(length(bc1_index)*2+length(bc2_index)+length(bc3_index),2);
for i=1:length(bc1_index)
    bc(i,1)=2*bc1_index(i);
    bc(i+length(bc1_index),1)=2*bc1_index(i)-1;
end

for i=1:length(bc2_index)
    bc(i+length(bc1_index)*2,1)=2*bc2_index(i)-1;
end

for i=1:length(bc3_index)
    bc(i+length(bc1_index)*2+length(bc2_index),1)=2*bc3_index(i);
end

af = solveq(Km,Hmatrix,bc);
ed = extract(newedof,af);

mag = 1; % Magnification (due to small deformations)
exd = Ex + mag*ed(:,1:2:end);
eyd = Ey + mag*ed(:,2:2:end);
print2(Ex,Ey,exd,eyd,mag);

%Finds the stress in one ELEMENT!
stress= stressFinder(exd,eyd,Dny,Dcu,newedof,t,nelm,af,th,alphaCu,alphaNy,deltaT);

%Von Mises ELEMENTVIS!
effectiveStress_el = vonMises(stress);
effectiveStress_nod=nodeStress(effectiveStress_el,edof,coord);
figure()
ed = extract(edof,effectiveStress_nod);
print3(exd,eyd,ed);

figure()
ed = extract(edof,a);
print1(exd,eyd,ed)