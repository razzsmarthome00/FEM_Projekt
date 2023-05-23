function L = lengthfinder(n,m,coord)
% This function simply finds the distance between two nodes using the
% pythagorean theorem
L = sqrt((coord(m,1)-coord(n,1))^2 + (coord(m,2)-coord(n,2))^2);
end

