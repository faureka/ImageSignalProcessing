clear all;
image = double(imread('peppers.pgm'));
[R,C] = size(image);
figure();
imshow(uint8(image));
N = R;
image = double(image);
image_dft = zeros(size(image),class(image));
temp = zeros(size(image),class(image));

temp = fft(image');
image_dft = fft(temp');

figure();
imshow(abs(fftshift(image_dft)),[1, 100000]);
figure();
imshow(angle(image_dft));