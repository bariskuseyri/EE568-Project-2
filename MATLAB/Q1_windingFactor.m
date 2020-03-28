%% Intro
% Distribution factor, pitch factor and winding factor
% EM: 120-slot / 20-pole, 3-phase | double layer | coil span: 6 slot
%
% Author: Baris Kuseyri <baris.kuseyri@metu.edu.tr>
% 
% version 1.0 | 19/03/2020
% version 1.1 | 23/03/2020
% version 1.2 | 26/03/2020

%% Initialization

clc
clear all
close all

%% Machine Parameters

m = 3;      % phase number
Q = 120;    % number of slots
p = 20;     % number of poles
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

h=1:21;

%% Fundamental h=1

% kd1=(sin(h(1)*q*(spe/2)))/(q*sin((h(1)*spe/2)));
% kp1=sin((h(1)*lambdae)/2);
% kw1=kd1*kp1;

%% 3rd Harmonics h=3

% kd3=(sin(h(3)*q*(spe/2)))/(q*sin((h(3)*spe/2)));
% kp3=sin((h(3)*lambdae)/2);
% kw3=kd3*kp3;

%% 5th Harmonics h=5

% kd5=(sin(h(5)*q*(spe/2)))/(q*sin((h(5)*spe/2)));
% kp5=sin((h(5)*lambdae)/2);
% kw5=kd5*kp5;

%% Factors (Generalized)

for i=1:21
    kd(i)=(sin(i*q*(spe/2)))/(q*sin((i*spe/2)));
    kp(i)=sin((i*lambdae)/2);
    kw(i)=kd(i)*kp(i);
end

%% Results

% subplot(3,1,1)
figure(1)
g1 = stem(h,abs(kw));
ax = gca;
ax.XGrid = 'off';
ax.YGrid = 'on';
title('Winding Factor Amplitudes')
xlabel('Harmonic Index, {\it n}') 
ylabel('|{\itK_{wn}}|')
xticks([1 3 5 7 9 11 13 15 17 19 21])
yticks([0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0])
axis([0 22 0 1.1])


% subplot(3,1,2)
figure(2)
g2 = stem(h,abs(kp));
ax = gca;
ax.XGrid = 'off';
ax.YGrid = 'on';
title('Pitch Factor Amplitudes')
xlabel('Harmonic Index, {\it n}') 
ylabel('|{\itK_{pn}}|')
xticks([1 3 5 7 9 11 13 15 17 19 21])
yticks([0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0])
axis([0 22 0 1.1])

% subplot(3,1,3)
figure(3)
g3 = stem(h,abs(kd));
ax = gca;
ax.XGrid = 'off';
ax.YGrid = 'on';
title('Distribution Factor Amplitudes')
xlabel('Harmonic Index, {\it n}') 
ylabel('|{\itK_{dn}}|')
xticks([1 3 5 7 9 11 13 15 17 19 21])
yticks([0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0])
axis([0 22 0 1.1])




g1.Color = 'k';
g2.Color = 'k';
g3.Color = 'k';