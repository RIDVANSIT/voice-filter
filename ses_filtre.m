clear all
close all

recObj = audiorecorder
disp('Start speaking.')
recordblocking(recObj, 5);
disp('End of Recording.');
y = getaudiodata(recObj);
audiowrite('ses1.wav',y,8000)
[ses, sample_rate] = audioread('ses1.wav');

f1=fft(ses);

M1=length(f1)
figure, plot(abs(f1))

f2=fftshift(f1);
figure, plot(abs(f2))



M2=round(M1/2)
N=3000
for i=1:M1
    BPF(i)=0;
end

for i=1+M2-N:M2+N
    BPF(i)=1;
end
figure, plot(BPF)


for i=1:M1
    BPF1(i)=1;
end

for i=1+M2-N:M2+N
    BPF1(i)=0;
end
figure, plot(BPF1)




for i=1:M1
f3(i)=BPF(i)*f2(i);
i;
end
figure, plot(abs(f3))

f4=ifft(fftshift(f3),M1);
sound(real(f4),sample_rate)

