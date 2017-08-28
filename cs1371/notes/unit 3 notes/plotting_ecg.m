clear
clc
close all


[num, txt, ~] = xlsread('ecg_data.xls');

t = num(:,1);   %time is first column
amp = num(:,2); %amplitude is second column
plot(t,amp);
title('ECG data for someone'); %gives the plot a title

ampr = amp .* rand(1);

%figure %creates a blank figure
hold on % puts everything on the same plot until "hold off" is called
plot(t,ampr,'r--');

ampr2 = amp .* 0.5;

hold off
figure

plot(t,ampr2,'g');

figure
subplot(2,2,1); %creates a 2x2 grid of plots on one window, with next plot being top-left
title('Test supertitle');
plot(t,amp);
title('subplot 1: human'); %titles the first subplot

subplot(2,2,2); %now the next plot will be the top right
plot(t,ampr,'r--');
title('???');

subplot(2,2,3); %now the next plot will be the top right
plot(t,amp2);
title('???');
subplot(2,2,2); %now the next plot will be the top right
plot(t,ampr);