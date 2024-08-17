%--------------Report-6
%----------WIRELESS COMMUNICATIONS
%--------Prof. Dr. Said E. El-Khamy
%----Communication & Electronics department
%--Student Name:
% Asmaa Gamal Abdel-Halem Mabrouk Nagy %أسماء جمال عبد الحليم مبروك ناجي
%--Student ID: 15010473  
%--Title: MATLAB-PAPR Reduction using Selective Mapping
%% The MATLAB Code: 
%selective mapping as a reduction technique for PAPR in OFDM systems
t=0:.0001:.01;
g=1;
%these are the available subcarriers (BPSK modulated) assuming all ones(all
%positive)
x1=sin(2*180*100*t);
x2=sin(2*180*200*t);
x3=sin(2*180*300*t);
x4=sin(2*180*400*t);
x5=sin(2*180*500*t);
x6=sin(2*180*600*t);
x7=sin(2*180*700*t);
x8=sin(2*180*800*t);
x9=sin(2*180*900*t);
x10=sin(2*180*1000*t);
x11=sin(2*180*1100*t);
x12=sin(2*180*1200*t);
x13=sin(2*180*1300*t);
x14=sin(2*180*1400*t);
x15=sin(2*180*1500*t);
x16=sin(2*180*1600*t);
%here the transmitted symbol uses all the subcarriers as follows
sum=x1+x2+x3+x4+x5+x6+x7+x8+x9+x10+x11+x12+x13+x14+x15+x16;
%here we use (phase rotation)by multiplying all the subcarriers
%in the sum by different phases to create a new data vector, not only that
%but also as we don't know the optimum phases to give the best PAR we
%create more than one vector and then sellect the optimum.
%first phase rotation
x1a=sin((2*180*100*t)+10);
x2a=sin((2*180*200*t)+10);
x3a=sin((2*180*300*t)+10);
x4a=sin((2*180*400*t)+10);
x5a=sin((2*180*500*t)+10);
x6a=sin((2*180*600*t)+10);
x7a=sin((2*180*700*t)+10);
x8a=sin((2*180*800*t)+10);
x9a=sin((2*180*900*t)+10);
x10a=sin((2*180*1000*t)+10);
x11a=sin((2*180*1100*t)+10);
x12a=sin((2*180*1200*t)+10);
x13a=sin((2*180*1300*t)+10);
x14a=sin((2*180*1400*t)+10);
x15a=sin((2*180*1500*t)+10);
x16a=sin((2*180*1600*t)+10);
sum1=x1a+x2a+x3a+x4a+x5a+x6a+x7a+x8a+x9a+x10a+x11a+x12a+x13a+x14a+x15a+x16a;
%second phase rotation
x1b=sin((2*180*100*t)+15);
x2b=sin((2*180*200*t)+15);
x3b=sin((2*180*300*t)+15);
x4b=sin((2*180*400*t)+15);
x5b=sin((2*180*500*t)+15);
x6b=sin((2*180*600*t)+15);
x7b=sin((2*180*700*t)+15);
x8b=sin((2*180*800*t)+15);
x9b=sin((2*180*900*t)+15);
x10b=sin((2*180*1000*t)+15);
x11b=sin((2*180*1100*t)+15);
x12b=sin((2*180*1200*t)+15);
x13b=sin((2*180*1300*t)+15);
x14b=sin((2*180*1400*t)+15);
x15b=sin((2*180*1500*t)+15);
x16b=sin((2*180*1600*t)+15);
sum2=x1b+x2b+x3b+x4b+x5b+x6b+x7b+x8b+x9b+x10b+x11b+x12b+x13b+x14b+x15b+x16b;
%third phase rotation
x1c=sin((2*180*100*t)+20);
x2c=sin((2*180*200*t)+20);
x3c=sin((2*180*300*t)+20);
x4c=sin((2*180*400*t)+20);
x5c=sin((2*180*500*t)+20);
x6c=sin((2*180*600*t)+20);
x7c=sin((2*180*700*t)+20);
x8c=sin((2*180*800*t)+20);
x9c=sin((2*180*900*t)+20);
x10c=sin((2*180*1000*t)+20);
x11c=sin((2*180*1100*t)+20);
x12c=sin((2*180*1200*t)+20);
x13c=sin((2*180*1300*t)+20);
x14c=sin((2*180*1400*t)+20);
x15c=sin((2*180*1500*t)+20);
x16c=sin((2*180*1600*t)+20);
sum3=x1c+x2c+x3c+x4c+x5c+x6c+x7c+x8c+x9c+x10c+x11c+x12c+x13c+x14c+x15c+x16c;
%now the selector should test the PAPR for the available data vectors
%and select the one with the least PAPR to use in transmission
%PAPR calculation
%calculating the PAPR
peak=max(sum);
avg=mean(sum.*sum);
papr=10*log((peak^2/avg))
peak1=max(sum1);
avg1=mean(sum1.*sum1);
papr1=10*log((peak1^2/avg1))
peak2=max(sum2);
avg2=mean(sum2.*sum2);
papr2=10*log((peak2^2/avg2))
peak3=max(sum3);
avg3=mean(sum3.*sum3);
papr3=10*log((peak3^2/avg3))
%selector
subplot (4,1,1)
plot(t,sum,t,g,t,-g)
title('sum without phase rotation')
xlabel('time')
ylabel('amp')
subplot (4,1,2)
plot(t,sum1,t,g,t,-g)
title('sum1 with phase shift 10')
xlabel('time')
ylabel('amp')
subplot (4,1,3)
plot(t,sum2,t,g,t,-g)
title('sum2 with phase shift 15')
xlabel('time')
ylabel('amp')
subplot (4,1,4)
plot(t,sum3,t,g,t,-g)
title('sum3 with phase shift 20')
xlabel('time')
ylabel('amp')