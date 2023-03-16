function   plot_simulation_data(sv,C_)
%,map,wp,VL,VLNo,maxR)
           mapa = [-10 -10;90 -10;90 140;-10 140;-10 -10];

fig = figure(1); axis ([-10  100 -10 150]);
set(fig, 'name', 'EKF_LOCALIZATION');
set(gca,'NextPlot','add');
 xlim([-10 90])
 ylim([-10 140])
%axis equal
% plot(map(:,1),map(:,2),'bo','MarkerSize',2,'MarkerFaceColor','b'),hold on;
% plot(wp(:,1),wp(:,2),'ko','MarkerSize',2),hold on;
% plot(VL(1:VLNo,1),...
%     VL(1:VLNo,2),'bo','MarkerSize',10,'MarkerFaceColor','b' )   ;
line(mapa(:,1),mapa(:,2),'Color','k','LineWidth',4)
p_ = drawmob_robot(sv(1:3),8,'k'); hold on;
% p = drawmob_robot([pose(1) pose(2)...
%     pose(3)],.1,'k');hold on
% f = ellipseplot1(pose,maxR,maxR,'b');
%             d1 = plot_probellipse(sv(1:3),C_([1:3],[1:3]),'g',5);
d2 = prob_ellipse(sv,C_,'b',1); hold on

xlabel('x [cm]');
ylabel('y [cm]');

% run obstacles_sa100_150;
% grid on