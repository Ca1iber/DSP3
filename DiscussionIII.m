%正片部分
%**************************************************************************
FilePath = 'C:\Users\Calibrum\Desktop\1s丁真.wav';
[y, Fs] = audioread(FilePath);
duration = length(y) / Fs; 
f = 5000; 
t = 0:1/Fs:duration; 
sine_wave = sin(2*pi*f*t)'; 
sin_resampled = resample(sine_wave, length(y), length(sine_wave));
y_new = y + sin_resampled;
%soundsc(y_new, Fs);

N=length(y_new);
Y_new=fft(y_new);
F=(0:N-1)*Fs/N;
[~, idx] = max(abs(Y_new));
peak_frequency = F(idx);

%***

f0=peak_frequency;
r=0.9;
w0=2*pi*f0/Fs;
b=[1 -2*cos(w0) 1];
a=[1 -2*r*cos(w0) r*r];
y_filtered=filter(b,a,y_new);
%***

soundsc(y_new, Fs);
pause(2*duration);
soundsc(y_filtered, Fs);
%*******************************************************************************
outputFilePath = 'C:\Users\Calibrum\Desktop\5kHz啸叫丁真.wav'; % 指定输出文件路径
audiowrite(outputFilePath, y_new, Fs);
%*******************************************************************************
figure;
t = (0:length(y)-1)/Fs;
plot(t, y_filtered);
title('5kHz yfiltered的时域图');
xlabel('时间 (秒)');
ylabel('幅度');

figure;
N = length(y_filtered);
frequencies = (0:N-1) * Fs / N;
Y = fft(y_filtered);
Y_mag = abs(Y(1:N/2+1));
plot(frequencies(1:N/2+1), Y_mag);
title('5kHz yfiltered的频域图');
xlabel('频率 (Hz)');
ylabel('幅度');
%**************************************************************************
















































































































f0=250;%陷波频率
fs=600;%采样频率
r=0.9;%阻尼比
w0=2*pi*f0/fs;
b=[1 -2*cos(w0) 1];
a=[1 -2*r*cos(w0) r*r];
N=1024;
[H,w]=freqz(b,a,N);
n=0:N-1;
x=sin(2*pi*250*n/fs)+sin(2*pi*125*n/fs);
X=fft(x,N);
y=filter(b,a,x);
Y=fft(y,N);
f=fs/N*(0:N/2-1);
figure;
subplot(221);plot(n,x);grid on;title('原信号x(n)');
subplot(222);plot(f,abs(X(1:N/2)));grid on;title('x(n)的幅频谱');
subplot(223);plot(n,y);grid on;title('陷波器滤波后的信号y(n)');
subplot(224);plot(f,abs(Y(1:N/2)));grid on;title('y(n)的幅频谱');



%**************************************************************************
% 创建一个示例信号
Fs = 1000;  % 采样率为 1000 Hz
t = 0:1/Fs:1;  % 时间从0到1秒
f1 = 50;  % 频率为 50 Hz
f2 = 150;  % 频率为 150 Hz
x = sin(2*pi*f1*t) + 1.5 * sin(2*pi*f2*t);  % 合成信号





