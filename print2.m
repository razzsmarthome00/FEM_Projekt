function print2(Ex,Ey,exd,eyd,mag)
% This function patches 4 times for the displacement-problem and in the
% same plot it patches the original geometry 4 times as to make comparisons
% easier.

patch(Ex',Ey',[0 0 0],'EdgeColor','none','FaceAlpha',0.3)
hold on
patch(exd',eyd',[0 0 0],'FaceAlpha',0.3)

patch(-Ex'+10^(-2),Ey',[0 0 0],'EdgeColor','none','FaceAlpha',0.3)
hold on
patch(-exd'+10^(-2),eyd',[0 0 0],'FaceAlpha',0.3)

patch(-Ex'+10^(-2),-Ey'+5*10^(-3),[0 0 0],'EdgeColor','none','FaceAlpha',0.3)
hold on
patch(-exd'+10^(-2),-eyd'+5*10^(-3),[0 0 0],'FaceAlpha',0.3)

patch(Ex',-Ey'+5*10^(-3),[0 0 0],'EdgeColor','none','FaceAlpha',0.3)
hold on
patch(exd',-eyd'+5*10^(-3),[0 0 0],'FaceAlpha',0.3)

title('Displacement field [Magnitude enhancement]',mag)

end