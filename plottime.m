function a1 = plottime(a0,K,F,C,dt,i3,ndof,N,i,M)
aprox = zeros(ndof,N+1);
di3=i3/M;
uold = a0;
    for j=1:round(di3)*i
        aprox(:,j)=uold;
        a1 = ((C+dt.*K)\(C*uold+dt.*F)); %Implicit Euler
        uold = a1;
    end

end

