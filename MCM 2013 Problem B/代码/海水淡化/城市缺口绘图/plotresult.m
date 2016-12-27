function plotresult(numberofyears, forecastscale, input, G)

t1 = 1999:(1999+numberofyears-1);
t2 = 1999:(1999+forecastscale-1);

name = {'Beijing', 'Tianjin', 'Shandong Province', 'Jiangsu Province', 'Shanghai', 'Zhejiang Province'};
color = {'r', 'g', 'b', 'c', 'm', 'y'};
sign = {'+', '*', '.', 'd', 's', 'p'};


for i=1:6
%     subplot(3, 2, i );
%     plot(t1, input(2*i-1,:), 'o', t2, G(2*i-1,:), 'r')
%     text(t2(18),G(2*i-1,18)*0.9, 'Supply')
%     hold on
%     plot(t1, input(2*i,:), '+', t2, G(2*i,:), 'g')
%     text(t2(22),G(2*i,22)*0.9, 'Demand')
%     plot(t1, input(2*i-1,:)-input(2*i,:), '*',t2, G(2*i-1,:)-G(2*i,:), 'b')
%     text(t2(15),(G(2*i-1,12)-G(2*i,12))*0.9, 'Gap')
%     nametmp = char(name(i));
%     title(sprintf(' %s', nametmp));
%     xlabel('year')
%     ylabel('(100 million m^3)')
%     xlim([1998 2026])
%     grid on

    subplot(3, 2, i );
    plot( t2, G(2*i-1,:), 'r',  t2, G(2*i,:), 'g', t2, G(2*i-1,:)-G(2*i,:), 'b' )
    hold on
    k = plot(t1, input(2*i-1,:), 'o', t1, input(2*i,:), '+', t1, input(2*i-1,:)-input(2*i,:), '*')
    
    text(t2(18),G(2*i-1,18)*0.9, 'Supply')
    text(t2(22),G(2*i,22)*0.9, 'Demand')
    text(t2(15),(G(2*i-1,12)-G(2*i,12))*0.9, 'Gap')
    
    nametmp = char(name(i));
    title(sprintf(' %s', nametmp));
    if (i==2 )
        legend(k, 'history supply', 'history demand', 'history gap')
    end
    xlabel('year')
    ylabel('(100 million m^3)')
    xlim([1998 2026])
    
    grid on

end

figure(2)
for i=1:6
    flag = char(color(i));
    mark = char(sign(i))
    h(i) = plot(t2, G(2*i-1,:)-G(2*i,:), flag, 'LineWidth', 2)
%     title('Forecast Gaps of Six Regions');
    xlabel('year')
    ylabel('(100 million m^3)')
    legend(h,  'Beijing', 'Tianjin', 'Shandong Province', 'Jiangsu Province', 'Shanghai', 'Zhejiang Province')
    xlim([1998 2026])
    nametmp = char(name(i));
%     text(t2(5*i-4),(G(2*i-1,12)-G(2*i,12))-0.05*abs(G(2*i-1,12)-G(2*i,12)), nametmp, 'FontSize', 11)
    hold on
    plot(t1, input(2*i-1,:)-input(2*i,:), mark);
    grid on    
end