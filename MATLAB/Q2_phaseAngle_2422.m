%% Intro
% Phase angle of the induced voltage in each slot
% EM: 24-slot / 22-pole, 3-phase | double layer | coil span: 1 slot
%
% Author: Baris Kuseyri <baris.kuseyri@metu.edu.tr>
% 
% version 1.0 | 19/03/2020
%% Initialization

clc
clear all
close all

%% Machine Parameters

m = 3;      % phase number
Q = 24;     % number of slots
p = 22;     % number of poles
l = 1;      % number of layers
cs = 1;     % coil span [slots]


pp = p/2;           % number of pole-pairs
q = Q/(2*pp*m);    % number of slots per pole per phase

spm = (2*pi)/Q;     % slot pitch (mechanical)
spe = (2*pi)*pp/Q;  % slot pitch (electrical)

ppm=(2*pi)/p;      % pole pitch (mechanical)
ppe=(2*pi)*pp/p;   % pole pitch (electrical)

lambdam = spm*cs;      % coil pitch (mechanical)
lambdae = spm*cs*pp;   % coil pitch (electrical)

%% Results

pA = zeros(2,24);

for i = 1:24
    pA(1,i) = i;
    pA(2,i) = round(mod(spe*(360/(2*pi))*(i-1), 360),2);
end

pAT = array2table(pA);

writetable(pAT,'phaseAngle_2422.txt');
% type tabledata.txt;


