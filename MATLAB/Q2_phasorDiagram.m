%% Intro
% Calculating distribution factor, pitch factor and winding factor for a
% 22-pole, 27-slot, 3-phase machine
%
% Author: Baris Kuseyri<baris.kuseyri@metu.edu.tr>
%
% version 1.0 | 23/03/2020

%% Initialization

clc
clear all

%% Machine Parameters

m=3;    %phase number
Q=27;   %number of slots
pp=11;  %number of pole-pairs


%% Machine Variables

q=Q/(2*pp*m);    %number of slots per pole per phase
ps=360/(Q/pp);   %phase shift between coils

am=2*pi/27;      %slot pitch (mechanical)
ae=pp*2*pi/27;      %slot pitch (electrical)


%% Results

hold on
axis equal

sector_color=['r','y','b'];

for i = 1:6
    t = linspace((i-1)*(2*pi/6)-(2*pi/12), i*(2*pi/6)-(2*pi/12));
    sector = patch([0 1.2*cos(t) 0], [0 1.2*sin(t) 0], sector_color(mod(i,3)+1));
    edgea = sector.EdgeAlpha;
    facea = sector.FaceAlpha;
    sector.EdgeAlpha = 0.0;
    sector.FaceAlpha = 0.2;
end


for i = 1:27
    x = [0 cos(ae*(i-1))];
    y = [0 sin(ae*(i-1))];
    v(i+1)=line(x,y,'Color','k','LineStyle','--');
    txt = num2str(i);
    text(1.1*cos(ae*(i-1)),1.1*sin(ae*(i-1)),txt,'HorizontalAlignment','center','VerticalAlignment','middle')
end



% 
% for i = 1 : Q
%     if i == 1
%         x = [0 cos(ae*(i-1))];
%         y = [0 sin(ae*(i-1))];
%         line(x,y,'Color','k','LineStyle','--');
%         txt1 = num2str(i);
%         text(1.1*cos(ae*(i-1)),1.1*sin(ae*(i-1)),txt1,'HorizontalAlignment','center','VerticalAlignment','middle')
%         text(1.4*cos(ae*(i-1)),1.4*sin(ae*(i-1)),'A','HorizontalAlignment','center','VerticalAlignment','middle', 'FontSize',14)
%     elseif i == 6 || i == 11 || i == 18 || i == 23
%         x = [0 cos(ae*(i-1))];
%         y = [0 sin(ae*(i-1))];
%         line(x,y,'Color','k','LineStyle','--');
%         txt = num2str(i);
%         text(1.1*cos(ae*(i-1)),1.1*sin(ae*(i-1)),txt,'HorizontalAlignment','center','VerticalAlignment','middle')
%     elseif i == 7 || i == 12 || i == 17 || i == 22
%         x = [0 -1*cos(ae*(i-1))];
%         y = [0 -1*sin(ae*(i-1))];
%         line(x,y,'Color','k','LineStyle','-');
%         txt = num2str(i+1);
%         text(-1.1*cos(ae*(i-1)),-1.1*sin(ae*(i-1)),txt,'HorizontalAlignment','center','VerticalAlignment','middle')
%       
%     elseif i == 19
%         x = [0 cos(ae*(i-1))];
%         y = [0 sin(ae*(i-1))];
%         line(x,y,'Color','k','LineStyle','--');
%         txt = num2str(i);
%         text(1.1*cos(ae*(i-1)),1.1*sin(ae*(i-1)),txt,'HorizontalAlignment','center','VerticalAlignment','middle')
%         text(1.4*cos(ae*(i-1)),1.4*sin(ae*(i-1)),'B','HorizontalAlignment','center','VerticalAlignment','middle', 'FontSize',14)
%     elseif i == 2 || i == 9 || i == 14 || i == 19 || i == 24
%         x = [0 cos(ae*(i-1))];
%         y = [0 sin(ae*(i-1))];
%         line(x,y,'Color','k','LineStyle','--');
%         txt = num2str(i);
%         text(1.1*cos(ae*(i-1)),1.1*sin(ae*(i-1)),txt,'HorizontalAlignment','center','VerticalAlignment','middle')
%     elseif i == 3 || i == 8 || i == 13 || i == 25
%         x = [0 -1*cos(ae*(i-1))];
%         y = [0 -1*sin(ae*(i-1))];
%         line(x,y,'Color','k','LineStyle','-');
%         txt = num2str(i);
%         text(-1.1*cos(ae*(i-1)),-1.1*sin(ae*(i-1)),txt,'HorizontalAlignment','center','VerticalAlignment','middle')
%         
%     elseif i == 10
%         x = [0 cos(ae*(i-1))];
%         y = [0 sin(ae*(i-1))];
%         line(x,y,'Color','k','LineStyle','--');
%         txt = num2str(i);
%         text(1.1*cos(ae*(i-1)),1.1*sin(ae*(i-1)),txt,'HorizontalAlignment','center','VerticalAlignment','middle')
%         text(1.4*cos(ae*(i-1)),1.4*sin(ae*(i-1)),'C','HorizontalAlignment','center','VerticalAlignment','middle', 'FontSize',14)    
%     elseif i == 5 || i == 10 || i == 15 || i == 20 || i == 27
%         x = [0 cos(ae*(i-1))];
%         y = [0 sin(ae*(i-1))];
%         line(x,y,'Color','k','LineStyle','--');
%         txt = num2str(i);
%         text(1.1*cos(ae*(i-1)),1.1*sin(ae*(i-1)),txt,'HorizontalAlignment','center','VerticalAlignment','middle')
%     elseif i == 4 || i == 16 || i == 21 || i == 26
%         x = [0 -1*cos(ae*(i-1))];
%         y = [0 -1*sin(ae*(i-1))];
%         line(x,y,'Color','k','LineStyle','-');
%         txt = num2str(i+1);
%         text(-1.1*cos(ae*(i-1)),-1.1*sin(ae*(i-1)),txt,'HorizontalAlignment','center','VerticalAlignment','middle')
%     
%     else
%         msgbox('Operation Failed');
%         
%     end   
% end

set(gca,'visible','off')
set(gca,'xtick',[])



