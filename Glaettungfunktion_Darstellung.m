%
% Showing effects of the smoothening kernel 
%

%==========================================================================
clear all;
close all;
%==========================================================================
spaceing = 0.01;    %Verteilung der Partikel 
h = 0.001;          %smoothining length;
k= 1;
hk = h*k;           %Einflussradius
%==========================================================================
width = 1;
height =width;
Partikel = (width/spaceing +1) * (width/spaceing +1);
Posx = zeros(Partikel);
Posy = zeros(Partikel);
x=spaceing;
y=spaceing;
for i = 1:Partikel


    Posx(i) = x;
    Posy(i) = y;

    if x>=width
        x=spaceing;
        y = y + spaceing;
    end
    if x<width
        x=x + spaceing;
     
    end


end
%==========================================================================

function y= gauss1d(glaet, dr)
    y = (1/(pi *sqrt(glaet)))*  exp(-((dr*dr)/(glaet*glaet)));
end
