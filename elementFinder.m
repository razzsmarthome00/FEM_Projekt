function [index] = elementFinder(n1, n2, edof)

for i=1:length(edof)
    if ismember(n1,edof(i,2:4)) && ismember(n2,edof(i,2:4))
        index = i;
    end
end

end

