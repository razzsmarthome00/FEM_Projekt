function [L] = lengthfinder(n,m,coord)
L = sqrt((coord(n,1)-coord(m,1))^2+(coord(n,2)-coord(m,2))^2);
end

