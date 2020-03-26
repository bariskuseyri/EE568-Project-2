%% Intro
% Calculating distribution factor, pitch factor and winding factor for a
% 20-pole, 120-slot, 3-phase machine
% Author: Baris Kuseyri <baris.kuseyri@metu.edu.tr>
% 
% version 1.0 | 19/03/2020
%% Initialization

clc
clear all

%% Machine Parameters

m = 3;      % phase number
Q = 27;    % number of slots
p = 22;     % number of poles
l = 1;      % number of layers
cs = 6;     % coil span [slots]


pp = p/2;           % number of pole-pairs
q = Q/(2*pp*m);    % number of slots per pole per phase

spm = (2*pi)/Q;     % slot pitch (mechanical)
spe = (2*pi)*pp/Q;  % slot pitch (electrical)

ppm=(2*pi)/p;      % pole pitch (mechanical)
ppe=(2*pi)*pp/p;   % pole pitch (electrical)

lambdam = spm*cs;      % coil pitch (mechanical)
lambdae = spm*cs*pp;   % coil pitch (electrical)

h = 1:27;

for i = 1:27
    pA(i) = mod(spe*(360/(2*pi))*(i-1), 360);
end



