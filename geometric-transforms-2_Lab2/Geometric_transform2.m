clc; clear all; close all;
A = double(imread('C:\Users\stifler\Downloads\study material\VIII sem\image signal processing\geometric-transforms-2\IMG1.pgm'));
figure();
imshow(double(A/256));
[Tx, Ty, theta1, theta2] = matrix_solver();

B = double(imread('C:\Users\stifler\Downloads\study material\VIII sem\image signal processing\geometric-transforms-2\IMG2.pgm'));

A_r = rotate_image(B,-theta1);

transform = maketform('bilinear',[cosd(theta1) sind(theta2) 0;cosd(-theta2) sind(theta1) 0; Tx Ty 1]);
output = imtransform(B,transform);

figure();
imshow(double(output/255));
% [R,C] = size(A_r);
% A = A(1:R,1:C);
% figure();
% imshow(double(A/255));
% 
% figure();
% imshowpair(A,A_r);
% % imshow(double(diff/255));