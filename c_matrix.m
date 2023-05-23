function C = c_matrix(E, v, G)
% This function simply defines the C-matrix for the given constans E, v and G
C = [1/E, -v/E, -v/E,0,0,0; -v/E, 1/E, -v/E,0,0,0; -v/E, -v/E, 1/E, 0, 0, 0; 0, 0, 0, 1/G, 0, 0; 0, 0, 0, 0, 1/G, 0; 0, 0, 0, 0, 0, 1/G];


end