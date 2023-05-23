function nedof = newdof(edof,nelm)
% This function 'duplicates' our edof and creates a new edof matrix, nedof,
% which has taken every node and split it into two degrees of freedom.

nedof = zeros(nelm,7);
nedof(:,1) = edof(:,1);
for i = 1:nelm
    nedof(i,2) = edof(i,2)*2-1;
    nedof(i,3) = edof(i,2)*2; 
    nedof(i,4) = edof(i,3)*2-1;
    nedof(i,5) = edof(i,3)*2; 
    nedof(i,6) = edof(i,4)*2-1;
    nedof(i,7) = edof(i,4)*2; 
end

end