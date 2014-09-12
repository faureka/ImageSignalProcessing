clear all; clc;close all;
%First frequency
f0 = 4; %in Hertz

%Delta f;
delta_f = 0.3; %in hertz

%Second frequency
f1 = f0 + delta_f;

%Time Period
T = 0.1; %in seconds

%Number of samples
N = 50;

x_n = zeros(N,1);
%Generate x_n
for i = 1:N
    x_n(i) = sin(2*pi*f0*i*T) + sin(2*pi*f1*i*T);
end

%Downsampling Matrix
D = zeros(N/2,N);
D(1,1) = 1;
D(1,2) = 1;
D = circulant(D,2);

%Warp Matrix
delta_shift = 0.3;
W1 = eye(N);
W2 = zeros(N);
W2(1,1) = 1 - delta_shift;
W2(1,2) = delta_shift;
W2 = circulant(W2,1);

%Create two donsampled sequences
y1 = D * W1 * x_n;
y2 = D * W2 * x_n;

%Super-Resolve using two downscaled sequences
Y = [y1;y2];
DW = [D * W1; D * W2];

%Reconstructed sequence
x_rec = DW\Y;

%Show sequences
plot(x_n);
figure();
plot(x_rec);
figure();
plot(abs(x_rec - x_n));


