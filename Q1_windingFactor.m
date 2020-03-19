%% Intro
% Calculating distribution factor, pitch factor and winding factor for a
% 20-pole, 120-slot, 3-phase machine
% Author: Bar?? Kuseyri<baris.kuseyri@metu.edu.tr>
% version 1.0 | 19/3/2020

%% Machine Parameters

m=3;    %phase number
Q=120;  %number of slots
pp=10;   %number of pole-pairs

q=Q/(2*pp*m);    %number of slots per pole per phase
am=(2*pi)/Q;     %angle between each coil (mechanical)
ae=(2*pi)*pp/Q;  %angle between each coil (electrical)
%% Fundamental h=1

h1=1;
kd=sin(pi/(2*m))/(q*sin(pi/(2*m*q)));
kp=sin((h1*ae)/2);
kw=kd*kp;

%% 3rd Harmonics h=3

kd3=(sin(q*ae/2))/(q*sin(ae/2));
kp3=sin(ae/2);
kw3=kd3*kp3;
%% 5th Harmonics h=5

kd5=(sin(q*ae/2))/(q*sin(ae/2));
kp5=sin(ae/2);
kw5=kd5*kp5;