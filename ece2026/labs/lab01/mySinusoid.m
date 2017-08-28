function xs = mySinusoid(amp, freq, pha, fs, tsta, tend)

tt = tsta : 1/fs : tend; % time indices for all the values
xs = amp * cos( freq*2*pi*tt + pha );
end