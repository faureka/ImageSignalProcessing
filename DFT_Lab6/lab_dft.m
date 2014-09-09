clc;
clear all;close all;
image1 = double(imread('fourier.pgm'));
image2 = double(imread('fourier_transform.pgm'));
[rows,cols] = size(image1);

N = rows;
M = cols;

image1_dft = zeros(size(image1),class(image1));
temp = zeros(([N,N]),class(image1));

temp = fft(image1');
image1_dft = fft(temp');

image2_dft = zeros(size(image2),class(image2));
temp = zeros(([N,N]),class(image2));

temp = fft(image2');
image2_dft = fft(temp');


mag_image1 = abs(image1_dft);
phase_image1 = angle(image1_dft);

mag_image2 = abs(image2_dft);
phase_image2 = angle(image2_dft);

image1_idft = double(mag_image1.*exp(1i.*phase_image2));
image2_idft = double(mag_image2.*exp(1i.*phase_image1));

temp = zeros(([N,N]),class(image1_idft));

temp = ifft(image1_idft');
image1_final = ifft(temp');

temp = zeros(([N,N]),class(image2_idft));

temp = ifft(image2_idft');
image2_final = ifft(temp');

figure();
imshow(abs(image1_final/255));
figure();
imshow(abs(image2_final/255));