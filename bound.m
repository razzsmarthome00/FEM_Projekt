function [edges_conv] = bound(vec,e)
er = e([1,2,5],:); % Reduced e
conv_segments = vec;
edges_conv = [];
for i = 1:size(er,2)
    if ismember(er(3,i),conv_segments)
        edges_conv = [edges_conv er(1:2,i)];
    end
end
end

