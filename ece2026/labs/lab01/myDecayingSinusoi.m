function xs = myDecayingSinusoi(A, b, omega, phi, fs, tStart, tEnd)
tt = tStart : 1/fs : tEnd; % time indices for all the values
xs = A .* exp(-b.*tt) .* cos( omega.*tt + phi );
end