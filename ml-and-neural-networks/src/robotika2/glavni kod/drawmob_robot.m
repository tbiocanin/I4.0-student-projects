function f = drawmob_robot(varargin);

        %   input ==> x,D,color
        
default_diameter = 1;               %
default_color = 'r';                %


inputarg = 0;

switch nargin
    case 2
        x_state = varargin{1};
        diameter = varargin{2};
        robot_color = default_color;
    case 3
        x_state = varargin{1};
        diameter = varargin{2};
        robot_color = varargin{3};
  
    otherwise
        disp('===================================')
        disp('==== You have made a mistake ======')
        disp('=== Define mobile robot properly ==')
        disp('===================================')
        inputarg = 1;
end

if ~inputarg
    x = x_state(1); y = x_state(2); theta = x_state(3);
    Trans = [x; y];
    Rot = [cos(theta), -sin(theta);...
            sin(theta), cos(theta)];
        
    h1 = ellipseplot1(x_state,diameter/2,diameter/2,robot_color);hold on
    line_pos = Rot*[diameter/2;0] + Trans;
    h2 = plot([Trans(1) line_pos(1)],[Trans(2) line_pos(2)],...
        'Color',robot_color);hold on
    h = cat(1,h1,h2);
            
end;      
            f = h;
            