%% Intro
% Calculating distribution factor, pitch factor and winding factor for a
% 22-pole, 27-slot, 3-phase machine
% Author: Baris Kuseyri<baris.kuseyri@metu.edu.tr>
% version 1.0 | 23/03/2020

%% Machine Parameters

m=3;    %phase number
Q=27;   %number of slots
pp=11;  %number of pole-pairs


%% Machine Variables

q=Q/(2*pp*m);    %number of slots per pole per phase
ps=360/(Q/pp);   %phase shift between coils

am=2*pi/27;      %slot pitch (mechanical)
ae=pp*2*pi/27;      %slot pitch (electrical)

v=[];

for i=1:27
    V(1:2,i)=[cos(ae*(i-1)+(pi/2)); sin(ae*(i-1)+(pi/2))];
    x=[0, V(1,i)];
    y=[0, V(2,i)];
    hold on;
    axis equal;
    grid on, grid minor, box on;
    axis([-1,1,-1,1]);
    plot(x,y,'-k')
end
% 
% x=[0, V(1,1)];
% y=[0, V(2,1)];
% hold on;
% axis equal;
% grid on, grid minor, box on;
% axis([-1,1,-1,1]);
% plot(x,y,'-*m')
% plot([2,2],[0,4],'--m')
% plot([0,4],[2,2],'--m')
% plot([2,2],[2,2],'--*m')







