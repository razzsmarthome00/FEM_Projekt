function a1 = plottime(a0,K,F,C,dt,i3,ndof,N,i,M)
% This function solves the problem and returns the a-vector as the solution
% for different times in the heat flow process.

di3=i3/M;
uold = a0;
    for j=1:round(di3)*i
        a1 = ((C+dt.*K)\(C*uold+dt.*F)); %Implicit Euler
        uold = a1;
    end

end