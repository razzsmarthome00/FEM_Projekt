% This script is written and read by pdetool and should NOT be edited.
% There are two recommended alternatives:
% 1) Export the required variables from pdetool and create a MATLAB script
%    to perform operations on these.
% 2) Define the problem completely using a MATLAB script. See
%    https://www.mathworks.com/help/pde/examples.html for examples
%    of this approach.
function pdemodel
[pde_fig,ax]=pdeinit;
pdetool('appl_cb',1);
pdetool('snapon','on');
set(ax,'DataAspectRatio',[1 0.75 1]);
set(ax,'PlotBoxAspectRatio',[1.5 1 600]);
set(ax,'XLim',[0 0.0050000000000000001]);
set(ax,'YLim',[0 0.0025000000000000001]);
set(ax,'XTick',[ 0,...
 0.00025000000000000001,...
 0.00050000000000000001,...
 0.00075000000000000002,...
 0.001,...
 0.00125,...
 0.0015,...
 0.00175,...
 0.002,...
 0.0022500000000000003,...
 0.0025000000000000001,...
 0.0027499999999999998,...
 0.0030000000000000001,...
 0.0032500000000000003,...
 0.0035000000000000001,...
 0.0037499999999999999,...
 0.0040000000000000001,...
 0.0042500000000000003,...
 0.0045000000000000005,...
 0.0047499999999999999,...
 0.0050000000000000001,...
]);
set(ax,'YTick',[ 0,...
 0.00025000000000000001,...
 0.00050000000000000001,...
 0.00075000000000000002,...
 0.001,...
 0.00125,...
 0.0015,...
 0.00175,...
 0.002,...
 0.0022500000000000003,...
 0.0025000000000000001,...
]);
pdetool('gridon','on');

% Geometry description:
pdepoly([ 0,...
 0.00050000000000000001,...
 0.00050000000000000001,...
 0.002,...
 0.0022500000000000003,...
 0.0022500000000000003,...
 0.0045000000000000005,...
 0.0050000000000000001,...
 0.0050000000000000001,...
 0.0045000000000000005,...
 0.0022500000000000003,...
 0.00175,...
 0.00175,...
 0.00075000000000000002,...
 0.00075000000000000002,...
 0.00050000000000000001,...
 0.00050000000000000001,...
 0,...
],...
[ 0.0025000000000000001,...
 0.0025000000000000001,...
 0.002,...
 0.002,...
 0.00175,...
 0.00025000000000000001,...
 0.0015,...
 0.0015,...
 0.00125,...
 0.00125,...
 0,...
 0,...
 0.0015,...
 0.0015,...
 0.00075000000000000002,...
 0.00075000000000000002,...
 0.0015,...
 0.0015,...
],...
 'P1');
pdepoly([ 0,...
 0,...
 0.00175,...
 0.00175,...
 0.00075000000000000002,...
 0.00075000000000000002,...
 0.00050000000000000001,...
 0.00050000000000000001,...
],...
[ 0.0015,...
 0,...
 0,...
 0.0015,...
 0.0015,...
 0.00075000000000000002,...
 0.00075000000000000002,...
 0.0015,...
],...
 'P2');
pdepoly([ 0,...
 0,...
 0.00050000000000000001,...
 0.00050000000000000001,...
],...
[ 0.0025000000000000001,...
 0.002,...
 0.002,...
 0.0025000000000000001,...
],...
 'P3');
set(findobj(get(pde_fig,'Children'),'Tag','PDEEval'),'String','P1+P2+P3')

% Boundary conditions:
pdetool('changemode',0)
pdetool('removeb',[18 ]);
pdesetbd(21,...
'dir',...
1,...
'1',...
'0')
pdesetbd(20,...
'dir',...
1,...
'1',...
'0')
pdesetbd(18,...
'dir',...
1,...
'1',...
'0')
pdesetbd(17,...
'dir',...
1,...
'1',...
'0')
pdesetbd(16,...
'dir',...
1,...
'1',...
'0')
pdesetbd(15,...
'dir',...
1,...
'1',...
'0')
pdesetbd(14,...
'dir',...
1,...
'1',...
'0')
pdesetbd(8,...
'dir',...
1,...
'1',...
'0')
pdesetbd(7,...
'dir',...
1,...
'1',...
'0')
pdesetbd(6,...
'dir',...
1,...
'1',...
'0')
pdesetbd(5,...
'dir',...
1,...
'1',...
'0')
pdesetbd(4,...
'dir',...
1,...
'1',...
'0')
pdesetbd(3,...
'dir',...
1,...
'1',...
'0')
pdesetbd(2,...
'dir',...
1,...
'1',...
'0')
pdesetbd(1,...
'dir',...
1,...
'1',...
'0')

% Mesh generation:
setappdata(pde_fig,'Hgrad',1.3);
setappdata(pde_fig,'refinemethod','regular');
setappdata(pde_fig,'jiggle',char('on','mean',''));
setappdata(pde_fig,'MesherVersion','preR2013a');
pdetool('initmesh')
pdetool('refine')

% PDE coefficients:
pdeseteq(1,...
'1.0',...
'0.0',...
'10',...
'1.0',...
'0:10',...
'0.0',...
'0.0',...
'[0 100]')
setappdata(pde_fig,'currparam',...
['1.0';...
'0.0';...
'10 ';...
'1.0'])

% Solve parameters:
setappdata(pde_fig,'solveparam',...
char('0','1000','10','pdeadworst',...
'0.5','longest','0','1E-4','','fixed','Inf'))

% Plotflags and user data strings:
setappdata(pde_fig,'plotflags',[1 1 1 1 1 1 1 1 0 0 0 1 1 0 0 0 0 1]);
setappdata(pde_fig,'colstring','');
setappdata(pde_fig,'arrowstring','');
setappdata(pde_fig,'deformstring','');
setappdata(pde_fig,'heightstring','');
