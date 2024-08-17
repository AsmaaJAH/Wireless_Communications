%--------------Report-5
%----------WIRELESS COMMUNICATIONS
%--------Prof. Dr. Said E. El-Khamy
%----Communication & Electronics department
%--Student Name:
% Asmaa Gamal Abdel-Halem Mabrouk Nagy %أسماء جمال عبد الحليم مبروك ناجي
%--Student ID: 15010473  
%Title: MATLAB CDMA2000 Wave Generator of 3G Farward Shared Channel (FSCH) for traffic between diferent RF users:
%% Generate Forward Traffic Channel
% Configure a cdma2000 forward link supporting a 307.2 kbps forward supplemental 
% channel (F-SCH) using radio configuration 4.

config = cdma2000ForwardReferenceChannels('TRAFFIC-RC4-4800',5000, ...
    'F-SCH-307200-20');
%% 
% Generate the waveform and plot its spectrum. The sample rate is equal 
% to the product of the chip rate and the oversampling ratio. RC4 uses spreading 
% rate 1, which is equivalent to a 1.2288 Mcps chip rate.
%%
wv = cdma2000ForwardWaveformGenerator(config);
fs = 1.2288e6 * config.OversamplingRatio;

sa = dsp.SpectrumAnalyzer('SampleRate',fs);
step(sa,wv)
%% 
% Change the filter type to |'cdma2000Short'| and plot the spectrum.
%%
config.FilterType = 'cdma2000Short';
wv = cdma2000ForwardWaveformGenerator(config);
step(sa,wv)
%% 
% The |'cdma2000Short'| filter does not provide as much out-of-band attenuation 
% as does the |'cdma2000Long'| filter.
%
