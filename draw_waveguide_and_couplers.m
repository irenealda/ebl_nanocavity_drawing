%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EBL exposure code for waveguides and couplers: ascii generator
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Written by M. Svendendahl and I. Alda

%Grating couplers values
lambda=1.550; %microns
n=2; %material index of refraction
s=0.95* 1550/1350;% scaling factor

%definition of the size of the gratings
rs0 = (s.*lambda/(2*n)); %first grating (material)
rs =(s.*lambda/(2*n)); %grating (material)
rb = 1*(s*lambda/2); %air gaps
rsmod = rs;

%waveguide parameters (length and width)
wgL =38; %waveguide length
wgw=1*(931/885); %waveguide width

%radii of the gratings
rb2 = 2*rs+rb+rsmod-rs0;
rb3 = rs*3+2*rb+2*(rsmod-rs0);
rb4 = rs*4+3*rb+3*(rsmod-rs0);
rb5=rs*5+4*rb+4*(rsmod-rs0);

%definitions for drawing couplers
theta = linspace(0, pi, 64); %angle to draw the semicircule
dd = s.*lambda/(2*n); %offset

%We define the different semicircles
X = [cos(theta).*rs cos(fliplr(theta)).*(rb+rs) cos(0).*rs];
Y = [sin(theta).*rs sin(fliplr(theta)).*(rb+rs) sin(0).*rb]+wgL/2+dd;

X2 = [cos(theta).*rb2 cos(fliplr(theta)).*(rb2+rb) cos(0).*rb2];
Y2 = [sin(theta).*rb2 sin(fliplr(theta)).*(rb2+rb) sin(0).*rb2]+wgL/2+dd;

X3 = [cos(theta).*rb3 cos(fliplr(theta)).*(rb3+rb) cos(0).*rb3];
Y3 = [sin(theta).*rb3 sin(fliplr(theta)).*(rb3+rb) sin(0).*rb3]+wgL/2+dd;

X4 = [cos(theta).*rb4 cos(fliplr(theta)).*(rb4+rb) cos(0).*rb4];
Y4 = [sin(theta).*rb4 sin(fliplr(theta)).*(rb4+rb) sin(0).*rb4]+wgL/2+dd;

X5 = [cos(theta).*rb5 -1*(rb5+5*rb) -1*(rb5+5*rb) 1*(rb5+5*rb) 1*(rb5+5*rb) rb5];
Y5 = [sin(theta).*rb5 0 (rb5+3*rb) (rb5+3*rb) 0 0]+wgL/2+dd;

%windowsize for exposure
windowsize=20;
WGX1 = [0 windowsize windowsize 0 0]+wgw/2; 
WGX2 = -([0 windowsize windowsize 0 0]+wgw/2);
WGY1 = [wgL/2 wgL/2 -wgL/2 -wgL/2 wgL/2];
WGY2 = WGY1;

%Offset parameters for waveguide and the structure
px = 9.7;
py = 24;
offx =25;
offy = 25;

%we draw the WG and couplers and the "air" window
figure(1), clf 
for c0 = 1:1
    for c1 = 1:1
plot(X+(c0-1)*px+offx, Y+(c1-1)*py+offy, X2+(c0-1)*px+offx, Y2+(c1-1)*py+offy,...
    X3+(c0-1)*px+offx, Y3+(c1-1)*py+offy, X4+(c0-1)*px+offx, Y4+(c1-1)*py+offy, ...
    WGX1+(c0-1)*px+offx, WGY1+(c1-1)*py+offy, WGX2+(c0-1)*px+offx, WGY2+(c1-1)*py+offy, ...
    X+(c0-1)*px+offx, -Y+(c1-1)*py+offy, X2+(c0-1)*px+offx, -Y2+(c1-1)*py+offy, ...
    X3+(c0-1)*px+offx, -Y3+(c1-1)*py+offy, X4+(c0-1)*px+offx, -Y4+(c1-1)*py+offy)
    
hold on
    end
end
hold off
axis equal
axis([0 50 -15 65])

