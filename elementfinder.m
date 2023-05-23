function elem= elementfinder(n,m,edof)
% Given two nodes on the boundary, this function finds the element
% connected to those two nodes. On the boundary this works since two nodes
% can only share one element, something that is not true for the general
% body
    for i = 1:1:length(edof)
        if ismember(n,edof(i,2:4)) && ismember(m,edof(i,2:4))
                elem = i;
        end
    end
end