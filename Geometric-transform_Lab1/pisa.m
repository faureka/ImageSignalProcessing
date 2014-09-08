clc;
close all;
clear all;
A = double(imread('C:\Users\stifler\Downloads\study material\VIII sem\image signal processing\geometric-transform\pisa_rotate.pgm'));
theta = pi/20;                                  %theta = 15 degree

A_r = [];count = 0;
[R,C] = size(A);
c_h = R/2;
c_w = C/2;
height = R;
width = C;
t = sqrt(c_h^2+ c_w^2);
h = height + t;
w = width + t;


for i = 1:h
    i1 = i +c_h;
    for j = 1:w
        j1 = j + c_w;
        k = i*cos(theta)-j*sin(theta);
        l = i*sin(theta)+j*cos(theta);
%         k = k - c_w;
%         l = l - c_h;
        if floor(k) <= 0 || floor(l) <= 0 || ceil(k) > C || ceil(l) > R 
%            count = count +1;
        else
                 imageval = bilininterp(A,k,l);
                 A_r(j,i) = imageval;
%           
        end
%         
    end
end
% A_r = A_r(1:length(A),1:300);
imshow(double((A/255)))
figure();
% image(A_r);
imshow(double(A_r/255))
% A_r_matlab = imrotate(A,11.25,'bilinear');
% figure();
% image(A_r_matlab);