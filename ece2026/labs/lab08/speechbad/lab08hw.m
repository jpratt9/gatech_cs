%%%John Pratt
%%%Lab HW #8
%%%ECE-2026
%%%Section L05
%%%Rec: Prof. Zhang
%%%Lecture: 11 AM
%%%12-Mar-2015
%%%HW Grader: S. Wang
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% a) 
%NOTE: The plotspec code is commented out to prevent a duplicate plot
%      in part (d).

clear;clc;
load('speechbad.mat');
%plotspecDB(xxbad,8000,256,1);
%fsamp of 8000Hz as given in problem statement, Lsect of 128 after guess
%and check, and DBrange of 25 because all values from 1-99 yielded the same
%plot

%% b)
bk1 = [1,-2*cos(2*pi*1555/8000),1];
bk2 = [1,-2*cos(2*pi*2222/8000),1];
bk = conv(bk1,bk2);

%bk1 and bk2 are based on the nulling FIR filter formula given in section
%2.4 of this lab.  Convolve these two to come up with the equivalent set of
%coefficients of the cascade of the systems.  Convolve these with the input
%signal to get the filtered, understandable signal.

%% c)  
%NOTE:  All code in part C must be commented out after generating 
%       figures so that duplicate figures are not inserted when the whole 
%       file is published.

%{
ww = -pi:1/1000:pi;
freq = freqz(bk,1,ww);
figure;
plot(ww,abs(freq));
title(['Plot of Magnitude of Frequency Response, -\pi  \leq \omega \leq '...
    '\pi']);
xlabel('\omega');
ylabel('|H(e^{j \omega})|');
axis([-pi,pi,0,max(abs(freq))]);
set(gca,'XTick',[-pi;-pi/2;0;pi/2;pi]);
set(gca,'XTickLabel',['-pi  ';'-pi/2';'0    ';'pi/2 ';'pi   ']);
set(gca,'YTick',[0;1;2;3;4;5]);
figure;
plot(ww,angle(freq));
title(['Plot of Phase of Frequency Response, -\pi  \leq \omega \leq '...
    '\pi']);
xlabel('\omega');
ylabel('\angle H(e^{j \omega})');
axis([-pi,pi,-pi,pi]);
set(gca,'XTick',[-pi;-pi/2;0;pi/2;pi]);
set(gca,'XTickLabel',['-pi  ';'-pi/2';'0    ';'pi/2 ';'pi   ']);
set(gca,'YTick',[-pi;-pi/2;0;pi/2;pi]);
set(gca,'YTickLabel',['-pi  ';'-pi/2';'0    ';'pi/2 ';'pi   ']);
%}
openfig('magfig.fig');
openfig('phasefig.fig');
figure;

%% d) 
xxgood = conv(xxbad,bk);
plotspecDB(xxbad,8000,256,1);
title('Spectrogram of unfiltered (input) signal');
xlabel('TIME');
ylabel('FREQUENCY [dB]');
figure;
plotspecDB(xxgood,8000,256,1);
title('Spectrogram of filtered (output) signal');
xlabel('TIME');
ylabel('FREQUENCY [dB]');
sound(xxgood); %"Thieves who rob friends deserve jail."

%Values used for fsamp, Lsect, and maxDB are explained in (a) above.

%In the original plot of decibel frequency vs time, there is a complete
%lack of any sort of waveform in the human vowel range.  When the signal is
%filtered, there is clearly more fluctuation in the decibel frequency,
%associated with the human vowel frequency range and natural speech
%paterns.