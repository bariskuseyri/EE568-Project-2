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
am=(2*pi)/Q;     %slot angle (mechanical)
ae=(2*pi)*pp/Q;  %slot angle (electrical)
lambdam=q*m*am;  %coil pitch (mechanical)
lambdae=q*m*ae;  %coil pitch (electrical)

h=1:20;
%% Fundamental h=1

kd1=(sin(h(1)*q*(ae/2)))/(q*sin((h(1)*ae/2)));
kp1=sin((h(1)*lambdae)/2);
kw1=kd1*kp1;

%% 3rd Harmonics h=3

kd3=(sin(h(3)*q*(ae/2)))/(q*sin((h(3)*ae/2)));
kp3=sin((h(3)*lambdae)/2);
kw3=kd3*kp3;

%% 5th Harmonics h=5

kd5=(sin(h(5)*q*(ae/2)))/(q*sin((h(5)*ae/2)));
kp5=sin((h(5)*lambdae)/2);
kw5=kd5*kp5;

%% Factors (Generalized)

for i=1:20
    kd(i)=(sin(i*q*(ae/2)))/(q*sin((i*ae/2)));
    kp(i)=sin((i*lambdae)/2);
    kw(i)=kd(i)*kp(i);
end

%% Results

% kd=[kd1 kd3 kd5];
% kp=[kp1 kp3 kp5];
% kw=[kw1 kw3 kw5];
k=[kd;kp;kw];

bar(h,abs(kw))