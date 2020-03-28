%% Intro
% Distribution factor, pitch factor and winding factor
% EM: 30-slot / 22-pole, 3-phase | double layer | coil span: 1 slot
%
% Author: Baris Kuseyri <baris.kuseyri@metu.edu.tr>
%
% version 1.0 | 23/03/2020

%% Initialization

clc
clear all
close all

%% Machine Parameters

m=3;    %phase number
Q=30;   %number of slots
p=22; %number of poles
pp=p/2;  %number of pole-pairs


%% Machine Variables

% q=Q/(2*pp*m);    %number of slots per pole per phase
q=5;

spm=(2*pi)/Q;     %slot pitch (mechanical)
spe=(2*pi)*pp/Q;  %slot pitch (electrical)

ppm=(2*pi)/p;     %pole pitch (mechanical)
ppe=(2*pi)*pp/p;  %pole pitch (electrical)

lambdam=(2*pi)/(Q*2*pp);  %angle between adjacent coils (mechanical)
lambdae=(2*pi)/(Q*2);  %angle between adjacent coils (electrical)

h=1:2:79;

%% Factors (Generalized)

for i=1:40
    kd(i)=(sin((2*i-1)*q*(lambdae/2)))/(q*sin(((2*i-1)*(lambdae/2))));
%   kp(i)=sin((i*lambdae)/2);
    kp(i)=sin((2*i-1)*spe/2);
    kp2(i)=cos((2*i-1)*(pi-spe)/2);
    kw(i)=kd(i)*kp(i);
end



bar(h,abs(kw))

