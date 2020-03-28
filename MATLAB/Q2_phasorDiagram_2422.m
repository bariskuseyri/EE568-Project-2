%% Intro
% Phasor diagram for a
% EM: 24-slot / 22-pole, 3-phase | 1 slot coil span
% Author: Baris Kuseyri<baris.kuseyri@metu.edu.tr>
% version 1.1 | 28/03/2020

%% Initialization

clc
clear all
close all

%% Machine Parameters

m=3;    % phase number
Q=24;   % number of slots
p=22;   % number of poles
pp=p/2; % number of pole-pairs


%% Machine Variables

q=Q/(2*pp*m);    %number of slots per pole per phase
ps=360/(Q/pp);   %phase shift between coils

am=2*pi/Q;      %slot pitch (mechanical)
ae=pp*2*pi/Q;   %slot pitch (electrical)


%% Phasor Diagram: Mechanical


figure(1)
axis equal
axis([-1.5 1.5 -1.5 1.5])
set(gca,'visible','off')
set(gca,'xtick',[])

sector_color=['r','y','b'];


for i = 1:6
    t = linspace((i-1)*(2*pi/6)-(2*pi/12), i*(2*pi/6)-(2*pi/12));
    sector = patch([0 1.2*cos(t) 0], [0 1.2*sin(t) 0], sector_color(mod(i,3)+1));
    edgea = sector.EdgeAlpha;
    facea = sector.FaceAlpha;
    sector.EdgeAlpha = 0.0;
    sector.FaceAlpha = 0.2;
    
    if i == 1
        text(1.4*cos(t(50)),1.4*sin(t(50)),'A','HorizontalAlignment','center','VerticalAlignment','middle', 'FontSize',14) 
    elseif i == 3
        text(1.4*cos(t(50)),1.4*sin(t(50)),'B','HorizontalAlignment','center','VerticalAlignment','middle', 'FontSize',14) 
    elseif i == 5
        text(1.4*cos(t(50)),1.4*sin(t(50)),'C','HorizontalAlignment','center','VerticalAlignment','middle', 'FontSize',14) 
    else
        
    end
    
end


v=zeros(1,Q);

for i = 1:Q
    x = [0 cos(am*(i-1) + am/2)];
    y = [0 sin(am*(i-1) + am/2)];
    v(i+1)=line(x,y,'Color','k','LineStyle','-');
    txt = num2str(i);
    text(1.1*cos(am*(i-1) + am/2),1.1*sin(am*(i-1) + am/2),txt,'HorizontalAlignment','center','VerticalAlignment','middle')
end


%% Phasor Diagram: Electrical

figure(2)
axis equal
axis([-1.5 1.5 -1.5 1.5])
set(gca,'visible','off')
set(gca,'xtick',[])

sector_color=['r','y','b'];


for i = 1:6
    t = linspace((i-1)*(2*pi/6)-(2*pi/12), i*(2*pi/6)-(2*pi/12));
    sector = patch([0 1.2*cos(t) 0], [0 1.2*sin(t) 0], sector_color(mod(i,3)+1));
    edgea = sector.EdgeAlpha;
    facea = sector.FaceAlpha;
    sector.EdgeAlpha = 0.0;
    sector.FaceAlpha = 0.2;
    
    if i == 1
        text(1.4*cos(t(50)),1.4*sin(t(50)),'A','HorizontalAlignment','center','VerticalAlignment','middle', 'FontSize',14) 
    elseif i == 3
        text(1.4*cos(t(50)),1.4*sin(t(50)),'B','HorizontalAlignment','center','VerticalAlignment','middle', 'FontSize',14) 
    elseif i == 5
        text(1.4*cos(t(50)),1.4*sin(t(50)),'C','HorizontalAlignment','center','VerticalAlignment','middle', 'FontSize',14) 
    else
        
    end
    
end


v=zeros(1,Q);

for i = 1:Q
    x = [0 cos(ae*(i-1) + am/2)];
    y = [0 sin(ae*(i-1) + am/2)];
    v(i+1)=line(x,y,'Color','k','LineStyle','-');
    txt = num2str(i);
    text(1.1*cos(ae*(i-1) + am/2),1.1*sin(ae*(i-1) + am/2),txt,'HorizontalAlignment','center','VerticalAlignment','middle')
end



%% Phasor Diagram: Phase - Coil Selection

figure(3)

axis equal
axis([-1.5 1.5 -1.5 1.5])
set(gca,'visible','off')
set(gca,'xtick',[])

A=[];
B=[];
C=[];

for i = 1:6
    t = linspace((i-1)*(2*pi/6)-(2*pi/12), i*(2*pi/6)-(2*pi/12));
    sector = patch([0 1.2*cos(t) 0], [0 1.2*sin(t) 0], sector_color(mod(i,3)+1));
    edgea = sector.EdgeAlpha;
    facea = sector.FaceAlpha;
    sector.EdgeAlpha = 0.0;
    sector.FaceAlpha = 0.2;
    
    if i == 1
        text(1.4*cos(t(50)),1.4*sin(t(50)),'A','HorizontalAlignment','center','VerticalAlignment','middle', 'FontSize',14) 
    elseif i == 3
        text(1.4*cos(t(50)),1.4*sin(t(50)),'B','HorizontalAlignment','center','VerticalAlignment','middle', 'FontSize',14) 
    elseif i == 5
        text(1.4*cos(t(50)),1.4*sin(t(50)),'C','HorizontalAlignment','center','VerticalAlignment','middle', 'FontSize',14) 
    else
        
    end
    
end




for i = 1 : Q
    if mod(ae*(i-1) + am/2,(2*pi)) >= (11/2)*(2*pi)/6 || mod(ae*(i-1) + am/2,(2*pi)) < (1/2)*(2*pi)/6
        x = [0 cos(ae*(i-1) + am/2)];
        y = [0 sin(ae*(i-1) + am/2)];
        line(x,y,'Color','k','LineStyle','-');
        txt = num2str(i);
        text(1.1*cos(ae*(i-1) + am/2),1.1*sin(ae*(i-1) + am/2),txt,'HorizontalAlignment','center','VerticalAlignment','middle')
        A = [A i];
    elseif mod(ae*(i-1) + am/2,(2*pi)) >= (5/2)*(2*pi)/6 && mod(ae*(i-1) + am/2,(2*pi)) < (7/2)*(2*pi)/6
        x = [0 -1*cos(ae*(i-1) + am/2)];
        y = [0 -1*sin(ae*(i-1) + am/2)];
        line(x,y,'Color','k','LineStyle','--');
        txt = strcat(num2str(i),'''');
        text(-1.3*cos(ae*(i-1) + am/2),-1.3*sin(ae*(i-1) + am/2),txt,'HorizontalAlignment','center','VerticalAlignment','middle')
        A = [A i];
        
    elseif mod(ae*(i-1) + am/2,(2*pi)) >= (3/2)*(2*pi)/6 && mod(ae*(i-1) + am/2,(2*pi)) < (5/2)*(2*pi)/6
        x = [0 cos(ae*(i-1) + am/2)];
        y = [0 sin(ae*(i-1) + am/2)];
        line(x,y,'Color','k','LineStyle','-');
        txt = num2str(i);
        text(1.1*cos(ae*(i-1) + am/2),1.1*sin(ae*(i-1) + am/2),txt,'HorizontalAlignment','center','VerticalAlignment','middle')
        B = [B i];           
    elseif mod(ae*(i-1) + am/2,(2*pi)) >= (9/2)*(2*pi)/6 && mod(ae*(i-1) + am/2,(2*pi)) < (11/2)*(2*pi)/6
        x = [0 -1*cos(ae*(i-1) + am/2)];
        y = [0 -1*sin(ae*(i-1) + am/2)];
        line(x,y,'Color','k','LineStyle','--');
        txt = strcat(num2str(i),'''');
        text(-1.3*cos(ae*(i-1) + am/2),-1.3*sin(ae*(i-1) + am/2),txt,'HorizontalAlignment','center','VerticalAlignment','middle')
        B = [B i];
        
    elseif mod(ae*(i-1) + am/2,(2*pi)) >= (1/2)*(2*pi)/6 && mod(ae*(i-1) + am/2,(2*pi)) < (3/2)*(2*pi)/6
        x = [0 -1*cos(ae*(i-1) + am/2)];
        y = [0 -1*sin(ae*(i-1) + am/2)];
        line(x,y,'Color','k','LineStyle','--');
        txt = strcat(num2str(i),'''');
        text(-1.3*cos(ae*(i-1) + am/2),-1.3*sin(ae*(i-1) + am/2),txt,'HorizontalAlignment','center','VerticalAlignment','middle')
        C = [C i];
    elseif mod(ae*(i-1) + am/2,(2*pi)) >= (7/2)*(2*pi)/6 && mod(ae*(i-1) + am/2,(2*pi)) < (9/2)*(2*pi)/6
        x = [0 cos(ae*(i-1) + am/2)];
        y = [0 sin(ae*(i-1) + am/2)];
        line(x,y,'Color','k','LineStyle','-');
        txt = num2str(i);
        text(1.1*cos(ae*(i-1) + am/2),1.1*sin(ae*(i-1) + am/2),txt,'HorizontalAlignment','center','VerticalAlignment','middle')
        C = [C i];
    else
        msgbox('Operation Failed');
        
    end   
end

%% Phasor Diagram: Phase A Phasors

figure(4)

axis([0 10 -0.5 0.5])
ax = gca;
ax.XGrid = 'off';
ax.YGrid = 'on';
y_ticks = linspace(-1,1,21);
yticks(y_ticks)

x_init = [0 0];
y_init = [0 0];

for i = 1:length(A)
    if mod(ae*(A(i)-1),(2*pi)) >= (5/2)*(2*pi)/6 && mod(ae*(A(i)-1),(2*pi)) < (7/2)*(2*pi)/6
        x_next = [0 -1*cos(ae*(A(i)-1) + am/2)];
        y_next = [0 -1*sin(ae*(A(i)-1) + am/2)];
    else
        x_next = [0 cos(ae*(A(i)-1) + am/2)];
        y_next = [0 sin(ae*(A(i)-1) + am/2)];
    end
    
    x_init(1)=x_init(2);
    y_init(1)=y_init(2);
    
    x_init = x_init+x_next;
    y_init = y_init+y_next;

    text((x_init(2)+x_init(1))/2,(y_init(2)+y_init(1))/2,num2str(A(i)),'HorizontalAlignment','center','VerticalAlignment','bottom')
    line(x_init,y_init,'Color','k','LineStyle','-');
    
    loc = strcat('[x=',num2str(x_init(2)),']');
    if i == length(A)
        text(x_init(2),y_init(2),loc,'HorizontalAlignment','center','VerticalAlignment','bottom')
    end
end




