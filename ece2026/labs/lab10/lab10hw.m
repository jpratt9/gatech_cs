%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%ECE2026
%%Lab Homework 10
%%John Pratt
%%Grader: Kyle Xu
%%04-16-2015
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;
clc;

Fs = 1/(0.3e-3);
xx = DTMFdial('159D*86A',Fs);

%FREQS: component frequencies of DTMF characters in strong above
%WIDTHS: transistion widths calculated by taking the smallest difference
%between each frequency and adjacent frequencies.
%Note: many of the actual widths could be higher to meet specs, but it
%they have to be 'comparable.'
%Note: the width for the highest frequency must be as low as it is because
%Freq+delta+width must be less than the Nyquist frequency.
Freqs =  [697 770 852 941 1209 1336 1477 1633];
widths = [67  67  76  83  83   83   83   83  ];

F = [];

A = [0 1 0]; %stop1, pass, and stop2 desiredamplitudes
DEV = [0.01 0.02 0.01]; %deltas
MM = [];
ww = 0:1/Fs:pi;
www = [];
dd = [];

%We'll make a loop out of this because the same general process for
%creating and modifying the filter applies for each one.
for n = 1:7
    %Create and store each vector of stop1, pass, stop2, and transition
    %frequencies into a master array ass row vectors.
    F(n).stuff = [Freqs(n)-6-widths(n), Freqs(n)-6,...
        Freqs(n)+6, Freqs(n)+6+widths(n)];
    
    %Calculate frequency response magnitudes with firpmord, firpm, and of
    %course freqz:
    [M,Fo,Ao,W] = firpmord(F(n).stuff,A,DEV,Fs);
    M = M + (mod(M,2)~=0);
    bk = firpm(M,Fo,Ao,W);
    HHmag = abs(freqz(bk,1,ww));
    
    %We now need to test if the filter actually meets the specs for our
    %deltas given its current order.  So, we'll use freqz to evaluate the
    %ends of the transition zones to test for the correct error
    ww_special = 2*pi*F(n).stuff/Fs;
    HHmag_special = abs(freqz(bk,1,ww_special));
    
    stop1_problem = HHmag_special(1) > DEV(1);
    stop2_problem = HHmag_special(4) > DEV(3);
    passlow_problem  = HHmag_special(2) < 1-DEV(2);
    passhigh_problem  = HHmag_special(3) < 1-DEV(2);
    
    problem = any([stop1_problem stop2_problem passlow_problem ...
        passhigh_problem]);
    
    %As long as the filter's not meeting specs, keep increasing the
    %magnitude of the filter until it works.
    while( problem )
        M = M + 2;
        
        bk = firpm(M,Fo,Ao,W);
        HHmag = abs(freqz(bk,1,ww));
        HHmag_special = abs(freqz(bk,1,ww_special));
        
        stop1_problem = HHmag_special(1) > DEV(1);
        stop2_problem = HHmag_special(4) > DEV(3);
        passlow_problem  = HHmag_special(2) < 1-DEV(2);
        passhigh_problem  = HHmag_special(3) < 1-DEV(2);
        
        problem = any([stop1_problem stop2_problem passlow_problem ...
            passhigh_problem]);
        
    end
    dd = [dd; HHmag_special(1)];
    www = [www; ww_special];
    MM = [MM; M];
end
F = [1477 1627];
A = [0 1];
DEV = [0.01 0.02];
[M,Fo,Ao,W] = firpmord(F,A,DEV,Fs);
bk = firpm(76,Fo,Ao,W);
MM = [MM; 76]; 

%%the filter coefficients from lab 10 were used for filter 8 due to their
%%preexistance
