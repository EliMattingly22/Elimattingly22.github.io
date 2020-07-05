clear
set(0,'DefaultFigureWindowStyle','Docked')
[Data, Fs] = audioread('Speaking_Me.wav'); %Loading audio
DataDisc8 = DigitalDiscretize(Data,8); %Discretizing the data to 8 bit

DataDisc6 = DigitalDiscretize(Data,6); %Discretizing the data to 8 bit

DataDisc5 = DigitalDiscretize(Data,5); %Discretizing the data to 8 bit

DataDisc5_Noise = DigitalDiscretize(Data+(rand(size(DataDisc5))-.5)*2^(-4),5); %Discretizing the data to 8 bit
DataDisc6_Noise = DigitalDiscretize(Data+(rand(size(DataDisc6))-.5)*2^(-4.5),5); %Discretizing the data to 8 bit

%The line above first adds noise that is equal to the amplitude of the
%least significant bit, then decimates by a factor of four

% audiowrite('Speaking_Me_8bit.wav',DataDisc8,Fs) %Saving 8 bit
% audiowrite('Speaking_Me_6bit.wav',DataDisc6,Fs)
DecimationFac = 8;

Data_Dec_5bit_WithNoise = decimate(DataDisc5_Noise,DecimationFac);
Data_Dec_6bit_WithNoise = decimate(DataDisc6_Noise,DecimationFac);


Data_Dec_5bit_NoNoise = decimate(DataDisc5,DecimationFac);
Data_Dec_6bit_NoNoise = decimate(DataDisc6,DecimationFac);

t = 0:1/Fs:(length(Data)-1)/Fs;
t = t(:);
tDec = t(1:DecimationFac:end);

figure,
plot(t(1:1000),Data(1:1000));
hold on
plot(t(1:1000),DataDisc5(1:1000))
plot(tDec(1:125),Data_Dec_5bit_WithNoise(1:125))
xlabel('Time (seconds)')
ylabel('Amplitude (a.u.)')
legend('Raw Data','5 bit','5 bit+Noise+Dec')


figure,
plot(t(1:1000),Data(1:1000));
hold on
plot(t(1:1000),DataDisc5(1:1000))
plot(tDec(1:125),Data_Dec_5bit_NoNoise(1:125))
xlabel('Time (seconds)')
ylabel('Amplitude (a.u.)')
legend('Raw Data','5 bit','5 bit+Dec')

audiowrite('Speaking_Me_5bit_Noiseadd_Decimate.ogg',Data_Dec_5bit_WithNoise,Fs/DecimationFac)
audiowrite('Speaking_Me_5bit_NoNoise_Decimate.ogg',Data_Dec_5bit_NoNoise,Fs/DecimationFac)

audiowrite('Speaking_Me_6bit_Noiseadd_Decimate.ogg',Data_Dec_6bit_WithNoise,Fs/DecimationFac)
audiowrite('Speaking_Me_6bit_NoNoise_Decimate.ogg',Data_Dec_6bit_NoNoise,Fs/DecimationFac)
