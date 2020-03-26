%% Intro
% Calculating distribution factor, pitch factor and winding factor for a
% 22-pole, 27-slot, 3-phase machine
% Author: Baris Kuseyri<baris.kuseyri@metu.edu.tr>
% version 1.0 | 23/03/2020

%% Initialization

clc
clear all

%% Machine Parameters

m=3;    %phase number
Q=27;   %number of slots
pp=11;  %number of pole-pairs


%% Machine Variables

q=Q/(2*pp*m);    %number of slots per pole per phase
ps=360/(Q/pp);   %phase shift between coils

am=2*pi/27;      %slot pitch (mechanical)
ae=pp*2*pi/27;      %slot pitch (electrical)


for i=0:26
    V(1:2,(i+1))=[cos(ae*i) sin(ae*i)];
end


hold on

for i = 0:26
    x = [0 cos(ae*i)];
    y = [0 sin(ae*i)];
    line(x,y,'Color','k','LineStyle','--')
end

% r = 1;
% t = linspace(0,2*pi/6,60);
% xunit = r * cos(t);
% yunit = r * sin(t);
% h = fill(xunit, yunit);
axis equal


for i = 1:6
    t = linspace((i-1)*(2*pi/6), i*(2*pi/6));
    sector = patch([0 1.1*cos(t) 0], [0 1.1*sin(t) 0], 'r');
    edgea = sector.EdgeAlpha;
    facea = sector.FaceAlpha;
    sector.EdgeAlpha = 0.0;
    sector.FaceAlpha = 0.2;
end



dim = [.8 .45 .1 .1];
str = '1';
annotation('textbox',dim,'String',str)





