fs = 8000;
t = 0:1/fs:1.3;
bb = (1.1 + cos(2*pi*81*t)).*cos(2*pi*1031);
plot(t,bb);
figure;
plot(t,abs(bb));
figure;

spectrogram(bb);
title('Spectrogram of bb');
figure;
b1 = (1.1 + cos(2*pi*81*t));
spectrogram(b1);
title('Spectrogram of b1');
figure;
spectrogram(abs(bb));
title('Spectrogram of abs(bb)');
figure;

