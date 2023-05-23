function[edges_conv, index] = boundaries(segment, e)
% The function calculates which nodes belong to a specific boundary region

er = e([1 2 5],:); % Reduced e
edges_conv = [];
for i = 1:size(er,2)
    if ismember(er(3,i),segment)
        edges_conv = [edges_conv er(1:2,i)]; 
    end
end

index = edges_conv(1,:);

for j = 1:length(edges_conv(2,:))
    if ismember(edges_conv(2,j),index) == false
        index(end+1) = edges_conv(2,j);
    end    
end
end