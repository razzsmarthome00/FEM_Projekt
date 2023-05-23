function print3(Ex,Ey,ed)
% This function pathces 4 times to create symmetry

patch(Ex',Ey',ed','EdgeColor','none');
hold on
patch(-Ex'+10^(-2),Ey',ed','EdgeColor','none');
patch(-Ex'+10^(-2),-Ey'+5*10^(-3),ed','EdgeColor','none');
patch(Ex',-Ey'+5*10^(-3),ed','EdgeColor','none');
xlabel('x-position [m]')
ylabel('y-position [m]')
axis equal
colorbar;
end