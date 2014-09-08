function [A_r] = rotate_image(A,theta)
A_r = imrotate(A,-theta,'bilinear');