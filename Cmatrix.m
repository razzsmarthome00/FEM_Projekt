function C = Cmatrix(E,v,G)

C=[1/E,-v/E,-v/E,0,0,0;-v/E,1/E,-v/E,0,0,0;-v/E,-v/E,1/E,0,0,0;0,0,0,1/G,0,0;0,0,0,0,1/G,0;0,0,0,0,0,1/G];
end

