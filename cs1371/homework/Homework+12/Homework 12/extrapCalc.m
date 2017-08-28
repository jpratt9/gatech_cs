function [] = extrapCalc(x,y,colors,axes)
% Creates graphs of linear, cubic, and spline interpolation given xy data,
% line colors, and axes ranges

% Method:
% Create new figure
% Create cell array of associated titles
% For each of the three types of fits
%   create a subplot, plot the xy data, change the axes ranges to the
%   inputted vector
%   label each axis appropriately and hold on
%   plot the regression curve corresponding to each of the five portions of
%   the data set required: 1/5, 2/5, 3/5, etc.
%   give the graph the corresponding title to the regression method used
% end

figure;
titles = {'Interp1: Linear','Interp1: Cubic','Spline'};
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
    set(gca,'box','off');
end
end