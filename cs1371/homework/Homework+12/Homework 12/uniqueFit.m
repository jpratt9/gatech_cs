function [] = uniqueFit(x,y)
% Generates all unique regression curve fits for a set of (x,y) data as 
% subplots on the same figure

% Method:
% Forget all other plots/data
% create 100 x-vals contained within domain of points
% For each unique fit (orders up to length of x/y-vectors - 1
%   create a subplot
%   evaluate all 100 x-vals for the regression curve
%   make the axis square
%   title the subplot "Order n Fit"
%   remove upper- and right-hand ticks from axes to match soln file output
% end

hold off; 
xvals = linspace(min(x),max(x),1000);
for i = 1:length(x)-1 
    subplot(ceil((length(x)-1)/2),2,i); 
    yvals = polyval(polyfit(x,y,i), xvals); 
    plot(x,y,'rx',xvals,yvals,'k');
    axis square;
    title(['Order ' num2str(i) ' Fit']);
end
end