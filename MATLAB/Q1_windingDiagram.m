%% Intro
% Winding diagram
% EM: 120-slot / 20-pole, 3-phase | double layer | coil span: 6 slot
%
% Author: Baris Kuseyri <baris.kuseyri@metu.edu.tr>
%
% version 1.1 | 28/03/2020

%% Initialization

clc
clear all
close all

%% Machine Parameters

m=3;    % phase number
Q=120;  % number of slots
p=20;   % number of poles
pp=p/2; % number of pole-pairs


%% Machine Variables

q=Q/(2*pp*m);    % number of slots per pole per phase
ps=360/(Q/pp);   % phase shift between coils

am=2*pi/Q;      %slot pitch (mechanical)
ae=pp*2*pi/Q;      %slot pitch (electrical)


%% Winding Diagram: Poles

axis([-5 20 -10 10])

hold on

set(gca,'visible','off')
set(gca,'xtick',[])


for i = -2 : 2
    
    x_pole_N = [1.05 7.05 7.05 1.05] + (i-1)*12;
    y_pole_N = [1 1 3 3];
    pN = fill(x_pole_N, y_pole_N,'r','LineStyle','none');
    pN.FaceAlpha = 0.5;
    x_disp_N = [1.05 7.05 7.05 1.05] + (i-1)*12;
    y_disp_N = [6 6 6.1 6.1];
    pN_disp = fill(x_disp_N, y_disp_N,'r','LineStyle','none');
    pN_disp.FaceAlpha = 0.5;
    text((x_disp_N(1,1)+x_disp_N(1,2))/2,y_disp_N(1,2)+1,'N','HorizontalAlignment','center','VerticalAlignment','middle', 'Fontsize', 14)

    
    x_pole_S = [1.05 7.05 7.05 1.05] + Q/p  + (i-1)*12;
    y_pole_S = [1 1 3 3];
    pS = fill(x_pole_S, y_pole_S,'b','LineStyle','none');
    pS.FaceAlpha = 0.5;
    x_disp_S = [1.05 7.05 7.05 1.05] + Q/p  + (i-1)*12;
    y_disp_S = [6 6 6.1 6.1];
    pS_disp = fill(x_disp_S, y_disp_S,'b','LineStyle','none');
    pS_disp.FaceAlpha = 0.5;
    text((x_disp_S(1,1)+x_disp_S(1,2))/2,y_disp_S(1,2)+1,'S','HorizontalAlignment','center','VerticalAlignment','middle', 'Fontsize', 14)

end


%% Winding Diagram: Windings

for i = -7 : 20
    
    if mod(i,4) == 1 || mod(i,4) == 2
        x = [0 0.1; 0 0.1] + i;
        y = [-0.1 0; 4 4];
        line(x,y,'Color','k','LineStyle','-')
        text(x(1,2),y(1,2)-2.5,num2str(mod(i+Q,Q)),'HorizontalAlignment','center','VerticalAlignment','cap')
        
        x_end = [x(1,2) x(1,1)+3];
        y_end = [y(2,2) y(2,2)+2];
        line(x_end,y_end,'Color','k','LineStyle','-')
        
        x_end = [x(1,1)-3 x(1,1)];
        y_end = [y(2,2)+2 y(2,2)];
        line(x_end,y_end,'Color','k','LineStyle','-')
        
        x_end = [x(1,1) x(1,1)+3];
        y_end = [y(1,1) y(1,2)-1];
        line(x_end,y_end,'Color','k','LineStyle','-')
        
        x_end = [x(1,2)-3 x(1,2)];
        y_end = [y(1,2)-1 y(1,2)];
        line(x_end,y_end,'Color','k','LineStyle','-')
        
        if mod((i-1)/4,3) == 0 || mod((i-2)/4,3) == 0
            text(x(1,2),y(1,2)-1,'A','HorizontalAlignment','center','VerticalAlignment','cap')
            text(x(1,2),y(1,2)-1.5,'A','HorizontalAlignment','center','VerticalAlignment','cap')
        elseif mod((i-1)/4,3) == 1 || mod((i-2)/4,3) == 1
            text(x(1,2),y(1,2)-1,'B','HorizontalAlignment','center','VerticalAlignment','cap')
            text(x(1,2),y(1,2)-1.5,'B','HorizontalAlignment','center','VerticalAlignment','cap')
        elseif mod((i-1)/4,3) == 2 || mod((i-2)/4,3) == 2
            text(x(1,2),y(1,2)-1,'C','HorizontalAlignment','center','VerticalAlignment','cap')
            text(x(1,2),y(1,2)-1.5,'C','HorizontalAlignment','center','VerticalAlignment','cap')
        end
        
    elseif mod(i,4) == 0 || mod(i,4) == 3
        x = [0 0.1; 0 0.1] + i;
        y = [-0.1 0; 4 4];
        line(x,y,'Color','k','LineStyle','--')
        text(x(1,2),y(1,2)-2.5,num2str(mod(i+Q,Q)),'HorizontalAlignment','center','VerticalAlignment','cap')
        
        x_end = [x(1,2) x(1,1)+3];
        y_end = [y(2,2) y(2,2)+2];
        line(x_end,y_end,'Color','k','LineStyle','--')
        
        x_end = [x(1,1)-3 x(1,1)];
        y_end = [y(2,2)+2 y(2,2)];
        line(x_end,y_end,'Color','k','LineStyle','--')
        
        x_end = [x(1,1) x(1,1)+3.1];
        y_end = [y(1,1) y(1,2)-1];
        line(x_end,y_end,'Color','k','LineStyle','--')
        
        x_end = [x(1,2)-3.1 x(1,2)];
        y_end = [y(1,2)-1 y(1,2)];
        line(x_end,y_end,'Color','k','LineStyle','--')
        
        if mod((i-3)/4,3) == 0 || mod((i-4)/4,3) == 0
            text(x(1,2),y(1,2)-1,'C''','HorizontalAlignment','center','VerticalAlignment','cap')
            text(x(1,2),y(1,2)-1.5,'C''','HorizontalAlignment','center','VerticalAlignment','cap')
        elseif mod((i-3)/4,3) == 1 || mod((i-4)/4,3) == 1
            text(x(1,2),y(1,2)-1,'A''','HorizontalAlignment','center','VerticalAlignment','cap')
            text(x(1,2),y(1,2)-1.5,'A''','HorizontalAlignment','center','VerticalAlignment','cap')
        elseif mod((i-3)/4,3) == 2 || mod((i-4)/4,3) == 2
            text(x(1,2),y(1,2)-1,'B''','HorizontalAlignment','center','VerticalAlignment','cap')
            text(x(1,2),y(1,2)-1.5,'B''','HorizontalAlignment','center','VerticalAlignment','cap')
        end
        
    else
        asd
    end
        
end