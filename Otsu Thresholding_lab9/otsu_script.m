clear all;clc;
close all;
image1 = imread('palmleaf1.pgm');
image2 = imread('palmleaf2.pgm');

hist1 = imhist(image1);
hist2 = imhist(image2);

thresh1 = otsu(hist1,256);
thresh2 = otsu(hist2,256);

fprintf('threshold for image1 %4.2f\n',thresh1);
fprintf('threshold for image2 %4.2f\n',thresh2);

image1 = thresh_output(thresh1,image1);
image2 = thresh_output(thresh2,image2);

figure();
imshow(uint8(image1))

figure();
imshow(uint8(image2))
