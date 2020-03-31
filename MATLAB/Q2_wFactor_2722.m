%% Intro
% Distribution factor, pitch factor and winding factor
% EM: 27-slot / 22-pole, 3-phase | double layer | coil span: 1 slot
%
% Author: Baris Kuseyri <baris.kuseyri@metu.edu.tr>
%
% version 1.0 | 23/03/2020
% version 1.1 | 26/03/2020

%% Initialization

clc
clear all
close all

%% Machine Parameters

m=3;    %phase number
Q=27;   %number of slots
p=22; %number of poles
pp=p/2;  %number of pole-pairs


%% Machine Variables

% q=Q/(2*pp*m);    %number of slots per pole per phase
q=9;

spm=(2*pi)/Q;     % slot pitch (mechanical)
spe=(2*pi)*pp/Q;  % slot pitch (electrical)

ppm=(2*pi)/p;     % pole pitch (mechanical)
ppe=(2*pi)*pp/p;  % pole pitch (electrical)

lambdam=(2*pi)/(Q*2*pp);  %angle between adjacent coils (mechanical)
lambdae=(2*pi)/(Q*2);  %angle between adjacent coils (electrical)

h=1:2:19;

%% Factors (Generalized)

for i=1:10
    kd(i)=(sin((2*i-1)*q*(lambdae/2)))/(q*sin(((2*i-1)*(lambdae/2))));
    kp(i)=sin((2*i-1)*spe/2);
    kp2(i)=cos((2*i-1)*(pi-spe)/2);
    kw(i)=kd(i)*kp(i);
end


%% Results

figure(1)
g1 = stem(h,abs(kd));
g1.Color = 'k';
ax = gca;
ax.XGrid = 'off';
ax.YGrid = 'on';
title('Distribution Factor Amplitudes')
ylabel('|{\itK_{dn}}|')
xticks([1 3 5 7 9 11 13 15 17 19 21])
yticks([0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0])
axis([0 22 0 1.1])
set(gcf,'units','centimeters','position',[2,5,30,6])

figure(2)
g2 = stem(h,abs(kp));
g2.Color = 'k';
ax = gca;
ax.XGrid = 'off';
ax.YGrid = 'on';
title('Pitch Factor Amplitudes')
ylabel('|{\itK_{pn}}|')
xticks([1 3 5 7 9 11 13 15 17 19 21])
yticks([0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0])
axis([0 22 0 1.1])
set(gcf,'units','centimeters','position',[2,5,30,6])

figure(3)
g3 = stem(h,abs(kw));
g3.Color = 'k';
ax = gca;
ax.XGrid = 'off';
ax.YGrid = 'on';
title('Winding Factor Amplitudes')
xlabel('Harmonic Index, {\it n}') 
ylabel('|{\itK_{wn}}|')
xticks([1 3 5 7 9 11 13 15 17 19 21])
yticks([0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0])
axis([0 22 0 1.1])
set(gcf,'units','centimeters','position',[2,5,30,6])
