%% Intro
% Calculating distribution factor, pitch factor and winding factor for a
% 22-pole, 24-slot, 3-phase machine
% Author: Baris Kuseyri<baris.kuseyri@metu.edu.tr>
% version 1.0 | 23/03/2020

%% Machine Parameters

clc
clear all

m=3;    %phase number
Q=24;   %number of slots
p=22; %number of poles
pp=p/2;  %number of pole-pairs


%% Machine Variables

% q=Q/(2*pp*m);    %number of slots per pole per phase
q=4;

spm=(2*pi)/Q;     %slot pitch (mechanical)
spe=(2*pi)*pp/Q;  %slot pitch (electrical)

ppm=(2*pi)/p;     %pole pitch (mechanical)
ppe=(2*pi)*pp/p;  %pole pitch (electrical)

lambdae=(2*pi)/Q;  %angle between adjacent coils (electrical)

h=1:2:39;

%% Factors (Generalized)

for i=1:20
    kd(i)=-cos(((2*i-1)*pi*2*pp)/Q);
    kp(i)=sin((2*i-1)*spe/2);
    kp2(i)=cos((2*i-1)*(pi-spe)/2);
    kw(i)=kd(i)*kp(i);
end



bar(h,abs(kw))

