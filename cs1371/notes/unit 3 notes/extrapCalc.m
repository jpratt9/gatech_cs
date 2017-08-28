function [] = extrapCalc(x,y,colors,axes)
figure %forget about all previous graphs
titles = {'Interp1: Linear','Interp1: Cubic','Spline'}; %possible titles
methods = {'linear','cubic','spline'};
for n = 1:3
    subplot(3,1,n);
    plot(x,y);
    axis(axes);
    xlabel('x values');
    ylabel('y values');
    hold on
    for i = 1:5
        newy = interp1( x(1:length(x)*i/5), y(1:length(y)*i/5), x, methods{n}, 'extrap');
        plot(x,newy,colors(i));
    end    
    title(titles{n});
end
end