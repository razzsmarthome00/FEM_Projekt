close all
clear
clc

addpath("D:\Program\MATLAB\toolbox\fem");
addpath("D:\Program\MATLAB\toolbox\geom");

load('pet.mat', 'p')
load('pet.mat', 'e')
load('pet.mat', 't')

[nelm,edof,coord,ndof,Ex,Ey] = trans2calfem(p,t);

qNewtonCu = bound([1 2 3 4 5 6 14 18 20 21],e);
qhCu = bound([17],e);
q0Cu = bound([16 8],e);
q0Ny = bound([15 7],e);

TInf = 18;
ac=40;
th = 0.005;
h= 0;%-10^5;   
rhoCu = 8930;
rhoNy = 1100;
cpCu = 386;
cpNy = 1500;

K = K(Ex,Ey,ndof,nelm,edof,t,coord,qNewtonCu,ac,th);
F = F(qNewtonCu,coord,TInf,ac,ndof,qhCu,h,th);
C = C(Ex,Ey,nelm,t,rhoCu,rhoNy,cpCu,cpNy,edof,ndof,th);

%% Uppgift a)
clc
close all

a= solveq(K,F);
max_stat= max(a);
ed = extract(edof,a);
patch(Ex',Ey',ed');

%% Uppgift b)
clc
close all

t0=0;
t1 = 1000;
N=50000;   
dt= (t1-t0)/N;
tgrid = linspace(t0,t1,dt);

a0 = 18*ones(ndof,1);
aprox = zeros(ndof,N+1);
uold = a0;
i = 1;
a1 =zeros(ndof);
while max_stat*0.9 > max(a1)
    aprox(:,i)=uold;
    a1 = ((C+dt.*K)\(C*uold+dt.*F)); %Implicit Euler
    uold = a1;
    i = i +1;
end
i


ed = extract(edof,a1);
patch(Ex',Ey',ed');
