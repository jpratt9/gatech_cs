function xx = DTMFdial(keyNames,fs) 
%DTMFDIAL Create a signal vector of tones that will dial 

% a DTMF (Touch Tone) telephone system % % usage: xx = DTMFdial(keyNames,fs) 
% keyNames = vector of CHARACTERS containing valid key names 
% fs = sampling frequency 
% xx = signal vector that is the concatenation of DTMF tones. 
 
TT.keys = ['1','2','3','A';
'4','5','6','B';
'7','8','9','C';
'*','0','#','D'];

TT.colTones = [1209,1336,1477,1633]; 

TT.rowTones = [697;770;852;941]; 
xx = 0;  %-initialize xx to hold the output 

silence = zeros(1, round(fs*48/1000));

for kk=1:length(keyNames)
  
xx = [xx silence];

if(any(any(keyNames(kk) == TT.keys))) 

[jrow,jcol] = find(keyNames(kk) == TT.keys); %-which key? end

else
    
    error('wrong Key')
end

DTMFsig = cos(2*pi*TT.colTones(1,jcol)*(0:round(fs*180/1000))/fs) + ...
cos(2*pi*TT.rowTones(jrow,1)*(0:round(fs*180/1000))/fs);
xx = [xx DTMFsig];

end
xx = [xx silence];
soundsc(xx, fs);
end

% xx = firfilt(num,xx);

% xx = xx(1:2:end);
% 
% plotspec(xx,2000);