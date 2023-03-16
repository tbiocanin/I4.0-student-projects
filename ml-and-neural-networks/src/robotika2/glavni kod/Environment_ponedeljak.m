function obstacles = Environment_ponedeljak
fig = figure(2)

% set(fig, 'name', 'EKF_LOCALIZATION');
% set(gca,'NextPlot','replace');
axis ([-.1  100 -.1 150]);
% axis equal
 grid minor
 hold on

 inkrement = .01;
 
% This script outputs list of known obstacles
%
% % The warehouse #1.1

xmin = 50; xmax = 70; ymin = 90; ymax = 110;
xobs_1 = [xmin:inkrement :xmax]';
yobs_1 = [ymin*ones(size(xobs_1,1),1)];


% define upper x bound
xobs_2 = [xmin:inkrement :xmax]';
yobs_2 = [ymax*ones(size(xobs_2,1),1)];

% define lower y bound
yobs_3 = [ymin:inkrement :ymax]';
xobs_3 = [xmin*ones(size(yobs_3,1),1)];

% define upper y bound
yobs_4 = [ymin:.1:ymax]';
xobs_4 = [xmax*ones(size(yobs_4,1),1)];

obsc1 = [[xobs_1 yobs_1];[xobs_2 yobs_2];[xobs_3 yobs_3];[xobs_4 yobs_4]];

r1 = rectangle('Position',[xmin,ymin,(xmax-xmin),(ymax-ymin)],'Curvature',[.1,.1],...
          'FaceColor',[.7 .7 .7],'LineWidth',2,'LineStyle','-');
daspect([1,1,1]);
text((xmax),(100),'\leftarrow W#1')
% =========================================================================
% =========================================================================
% ==


% % The warehouse #2

xw = [80; 100; 100];
yw = [150; 150; 130];
zw = [1; 1;1];
tcolor = [.7 .7 .7];
patch(xw,yw,zw,tcolor)

text((70),(140),'W#2 \rightarrow')
%==========================================================================
%==========================================================================
% 
% 
% Machine tool #1 - makaze
% define bounds
x1min = 5; x1max = 20; y1min = 124; y1max = 129;
% define lower x bound
x1obs_1 = [x1min:inkrement :x1max]';
y1obs_1 = [y1min*ones(size(x1obs_1,1),1)];


% define upper x bound
x1obs_2 = [x1min:inkrement :x1max]';
y1obs_2 = [y1max*ones(size(x1obs_2,1),1)];

% define lower y bound
y1obs_3 = [y1min:inkrement :y1max]';
x1obs_3 = [x1min*ones(size(y1obs_3,1),1)];

% define upper y bound
y1obs_4 = [y1min:.1:y1max]';
x1obs_4 = [x1max*ones(size(y1obs_4,1),1)];

obs1 = [[x1obs_1 y1obs_1];[x1obs_2 y1obs_2];[x1obs_3 y1obs_3];[x1obs_4 y1obs_4]];

r1 = rectangle('Position',[x1min,y1min,(x1max-x1min),(y1max-y1min)],'Curvature',[.1,.1],...
          'FaceColor','r','LineWidth',2,'LineStyle','-');
daspect([1,1,1]);
text((x1max),(y1max),'\leftarrow MT#1')
%
%
% Machine tool #2 - CNC

% define bounds
x2min = 10; x2max = 24; y2min = 88; y2max = 102;
% define lower x bound
x2obs_1 = [x2min:inkrement :x2max]';
y2obs_1 = [y2min*ones(size(x2obs_1,1),1)];


% define upper x bound
x2obs_2 = [x2min:inkrement :x2max]';
y2obs_2 = [y2max*ones(size(x2obs_2,1),1)];


% define lower y bound
y2obs_3 = [y2min:inkrement :y2max]';
x2obs_3 = [x2min*ones(size(y2obs_3,1),1)];


% define upper y bound
y2obs_4 = [y2min:inkrement :y2max]';
x2obs_4 = [x2max*ones(size(y2obs_4,1),1)];

obs2 = [[x2obs_1 y2obs_1];[x2obs_2 y2obs_2];[x2obs_3 y2obs_3];[x2obs_4 y2obs_4]];

r2 = rectangle('Position',[x2min,y2min,(x2max-x2min),(y2max-y2min)],'Curvature',[.1,.1],...
          'FaceColor','r','LineWidth',2,'LineStyle','-');
daspect([1,1,1]);
      text((14),(105),'\downarrow MT#2')
%
%
% Machine tool #3 - presa
% define bounds
x3min = 9; x3max = 19; y3min = 58; y3max = 73;
% define lower x bound
x3obs_1 = [x3min:inkrement :x3max]';
y3obs_1 = [y3min*ones(size(x3obs_1,1),1)];


% define upper x bound
x3obs_2 = [x3min:inkrement :x3max]';
y3obs_2 = [y3max*ones(size(x3obs_2,1),1)];


% define lower y bound
y3obs_3 = [y3min:inkrement :y3max]';
x3obs_3 = [x3min*ones(size(y3obs_3,1),1)];


% define upper y bound
y3obs_4 = [y3min:inkrement :y3max]';
x3obs_4 = [x3max*ones(size(y3obs_4,1),1)];


obs3 = [[x3obs_1 y3obs_1]; [x3obs_2 y3obs_2];[x3obs_3 y3obs_3] ;[x3obs_4 y3obs_4]];
r3 = rectangle('Position',[x3min,y3min,(x3max-x3min),(y3max-y3min)],'Curvature',[.1,.1],...
          'FaceColor','r','LineWidth',2,'LineStyle','-');
daspect([1,1,1]);
text((x3max),(66),'\leftarrow MT#3')
      
%
%
% Machine tool #4 - masina za bakar
% define bounds
x4min = 94; x4max = 97; y4min = 5; y4max = 25;
% define lower x bound
x4obs_1 = [x4min:inkrement :x4max]';
y4obs_1 = [y4min*ones(size(x4obs_1,1),1)];


% define upper x bound
x4obs_2 = [x4min:inkrement :x4max]';
y4obs_2 = [y4max*ones(size(x4obs_2,1),1)];


% define lower y bound
y4obs_3 = [y4min:inkrement :y4max]';
x4obs_3 = [x4min*ones(size(y4obs_3,1),1)];


% define upper y bound
y4obs_4 = [y4min:inkrement :y4max]';
x4obs_4 = [x4max*ones(size(y4obs_4,1),1)];


obs4 = [[x4obs_1 y4obs_1]; [x4obs_2 y4obs_2];[x4obs_3 y4obs_3];[x4obs_4 y4obs_4]];

r4 = rectangle('Position',[x4min,y4min,(x4max-x4min),(y4max-y4min)],'Curvature',[.1,.1],...
          'FaceColor','r','LineWidth',2,'LineStyle','-');
daspect([1,1,1]);
text((85),(15),'MT#4\rightarrow')

%
%
% Machine tool #5 - tri stubne busilice
% define bounds

x51min = 4; x51max = 9; y51min = 10; y51max = 17;
x52min = 4; x52max = 9; y52min = 23; y52max = 30;
x53min = 20; x53max = 25; y53min = 25; y53max = 30;

    % #51
    % define lower x bound
    x51obs_1 = [x51min:inkrement :x51max]';
    y51obs_1 = [y51min*ones(size(x51obs_1,1),1)];
    

    % define upper x bound
    x51obs_2 = [x51min:inkrement :x51max]';
    y51obs_2 = [y51max*ones(size(x51obs_2,1),1)];
    

    % define lower y bound
    y51obs_3 = [y51min:inkrement :y51max]';
    x51obs_3 = [x51min*ones(size(y51obs_3,1),1)];
    

    % define upper y bound
    y51obs_4 = [y51min:inkrement :y51max]';
    x51obs_4 = [x51max*ones(size(y51obs_4,1),1)];
    
    
    obs51 = [[x51obs_1 y51obs_1];[x51obs_2 y51obs_2] ;[x51obs_3 y51obs_3] ;[x51obs_4 y51obs_4]];

    r4 = rectangle('Position',[x51min,y51min,(x51max-x51min),(y51max-y51min)],'Curvature',[.1,.1],...
              'FaceColor','r','LineWidth',2,'LineStyle','-');
    daspect([1,1,1]);
    text((9),(13.5),'\leftarrow MT#51')

    % #52
    % define lower x bound
    x52obs_1 = [x52min:inkrement :x52max]';
    y52obs_1 = [y52min*ones(size(x52obs_1,1),1)];
    

    % define upper x bound
    x52obs_2 = [x52min:inkrement :x52max]';
    y52obs_2 = [y52max*ones(size(x52obs_2,1),1)];
    

    % define lower y bound
    y52obs_3 = [y52min:inkrement :y52max]';
    x52obs_3 = [x52min*ones(size(y52obs_3,1),1)];
    

    % define upper y bound
    y52obs_4 = [y52min:inkrement :y52max]';
    x52obs_4 = [x52max*ones(size(y52obs_4,1),1)];
    
    obs52 = [[x52obs_1 y52obs_1];[x52obs_2 y52obs_2] ;[x52obs_3 y52obs_3] ;[x52obs_4 y52obs_4]];

    r4 = rectangle('Position',[x52min,y52min,(x52max-x52min),(y52max-y52min)],'Curvature',[.1,.1],...
              'FaceColor','r','LineWidth',2,'LineStyle','-');
    daspect([1,1,1]);
        text((4),(32),'\downarrow MT#52')
    % #53
    % define lower x bound
    x53obs_1 = [x53min:inkrement :x53max]';
    y53obs_1 = [y53min*ones(size(x53obs_1,1),1)];
    

    % define upper x bound
    x53obs_2 = [x53min:inkrement :x53max]';
    y53obs_2 = [y53max*ones(size(x53obs_2,1),1)];
    

    % define lower y bound
    y53obs_3 = [y53min:inkrement :y53max]';
    x53obs_3 = [x53min*ones(size(y53obs_3,1),1)];
    

    % define upper y bound
    y53obs_4 = [y53min:inkrement :y53max]';
    x53obs_4 = [x53max*ones(size(y53obs_4,1),1)];
    
    
    obs53 = [[x53obs_1 y53obs_1];[x53obs_2 y53obs_2] ;[x53obs_3 y53obs_3] ;[x53obs_4 y53obs_4]];

    r4 = rectangle('Position',[x53min,y53min,(x53max-x53min),(y53max-y53min)],'Curvature',[.1,.1],...
              'FaceColor','r','LineWidth',2,'LineStyle','-');
    daspect([1,1,1]);hold on
    text((20),(32),'\downarrow MT#53')
      obstacles = [obsc1;obs1;obs2;obs3;obs4;obs51; obs52;obs53];
    