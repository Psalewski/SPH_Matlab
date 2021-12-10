%
% Showing effects of the smoothening kernel 
%

%==========================================================================
clear all;
close all;
%==========================================================================
spaceing = 0.01;    %Verteilung der Partikel 
h = 0.1;          %smoothining length;
k= 1;
hk = 0.2;           %Einflussradius
%==========================================================================
width = 1;
height =width;
%==========================================================================
Partikel = (width/spaceing +1);
%==========================================================================
Posx = zeros(1,Partikel);
Posy = zeros(1,Partikel);
result= zeros(1,Partikel);
resultsum= zeros(1,Partikel);
%==========================================================================

x=0;
y=0;


for i = 1:Partikel

    Posx(i) = x;
        x=x + spaceing;
end


for j = 1:Partikel

        dx = (width/2) -Posx(j);
        if sqrt(dx *dx) <= hk
         result(j) =  gauss1d(h,dx) *1000/ (spaceing * spaceing *1000);
        end
end
plot(Posx,result)



for i = 1:Partikel
for j = 1:Partikel

        dx = (Posx(i)) -Posx(j);
        if sqrt(dx *dx) <= hk
         result(j) =  gauss1d(h,dx) *1000/ (spaceing * spaceing *1000);
         resultsum(j)=resultsum(j)+result(j);
        end
end
plot(Posx,result)
hold on
end

plot(Posx,resultsum,LineStyle="--")
hold off


% for i = 1:Partikel
%     for j = 1:Partikel
% 
%         dx = Posx(i)-Posx(j);
%         
%         if sqrt(dx *dx) <= hk
% 
%             result(i) =result(i)+ gauss1d(h,dx);
%         
%         end
%     end
% end
% plot(Posx,result,LineStyle="--")
% hold off

%==========================================================================

function y= gauss1d(glaet, dx)
    y = (1/(glaet *sqrt(pi)))*  exp(-((dx*dx)/(glaet*glaet)));
end

function y= gauss2d(glaet, dx,dy)
    y = (1/(glaet *glaet *pi))*  exp(-(((dx*dx)+(dy*dy))/(glaet*glaet)));
end

%==========================================================================













