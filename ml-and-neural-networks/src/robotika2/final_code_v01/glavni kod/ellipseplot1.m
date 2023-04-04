function [h] = ellipseplot1(x,a,b,color);

% Constants
NPOINTS = 100;                   % point density or resolution

% Compose point vector
parameter = 0:2*pi/NPOINTS:2*pi;     % index vector
p(1,:) = a*cos(parameter);           % 2 x n matrix which
p(2,:) = b*sin(parameter);           % hold ellipse points

% Translate and rotate
xo = x(1); yo = x(2); inclination_angle = x(3);
Rot  = [cos(inclination_angle) -sin(inclination_angle);...
        sin(inclination_angle) cos(inclination_angle)];
Trans  = [xo; yo]*ones(1,length(parameter));
p = Rot*p + Trans;

% Plot
[h] = plot(p(1,:),p(2,:),'Color',color,'LineWidth',2);hold on