function  print3(Ex,Ey,ed)
hold on
patch(Ex',Ey',ed','EdgeColor','none')
patch(-Ex'+10*10^-3,Ey',ed','EdgeColor','none')
patch(-Ex'+10*10^-3,-Ey'+5*10^-3,ed','EdgeColor','none')
patch(Ex',-Ey'+5*10^-3,ed','EdgeColor','none')
colorbar;
xlabel('x-position [m]')
ylabel('y-position [m]')
axis equal
end