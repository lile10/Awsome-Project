clc; clear all; close all;

mean = 1152;
stdev = 440;
s = 0.005344;
c = 0.022243;
optimal = 841;
pnums = 2;
s = s*0.8:0.01*s:s*1.2;
c = c*0.8:0.01*c:c*1.2;
% s = s*0.8:0.2*s:s*1.2;
% c = c*0.8:0.2*c:c*1.2;
[s, c] = meshgrid(s, c);
pnums = size(s,2);
tc = zeros(pnums, pnums);

syms r;

a1 = double(int((optimal-r)*1/(stdev*sqrt(2*pi))*exp(-(r-mean)*(r-mean)/(2*stdev*stdev)), r, 0, optimal));
a2 = double(int((r-optimal)*1/(stdev*sqrt(2*pi))*exp(-(r-mean)*(r-mean)/(2*stdev*stdev)), r, optimal, inf));

% for i=1:pnums
%     for j=1:pnums
%     
% %     tc(i, j) = int(c(i, j)*(optimal-r)*1/(stdev*sqrt(2*pi))*exp(-(r-mean)*(r-mean)/(2*stdev*stdev)), r, 0, optimal)+...
% %         int(s(i, j)*(r-optimal)*1/(stdev*sqrt(2*pi))*exp(-(r-mean)*(r-mean)/(2*stdev*stdev)), r, optimal, inf);
%       tc(i,j) = c(i ,j)*a1+s(i ,j)*a2;
%     j    
%     end
% end

tc = c*a1+s*a2;

h = surf(s, c, tc);

% plot(q, tc, '-')



