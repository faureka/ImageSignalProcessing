% File: Image Mosaicing
% Author: Sunny Naresh
% college:IIT Madras
% The code takes three images and makes one single image by the process
% called Image registration.

clc;
clear all;
close all;
img1 = imread('img1.pgm');
[r1,c1] = size(img1);
img2 = imread('img2.pgm');
[r2,c2] = size(img2);%finding rows and columns
img3 = imread('img3.pgm');
[r3,c3] = size(img3);
figure();
imshow(img2);
s1 = size(img1);
s2 = size(img2);
s3 = size(img3);
img1 = double(img1);
img2 = double(img2);
img3 = double(img3);

%% finding homography between two images
 
[crrsp1,crrsp2] = sift_corresp('img2.pgm','img1.pgm');
 H21 = RANSAC(crrsp1,crrsp2);
%  out = check(img1,r2,c2,H21);
%  figure();
%  imshow(mat2gray(out));
 [crrsp1,crrsp2] = sift_corresp('img2.pgm','img3.pgm');
 H23 = RANSAC(crrsp1,crrsp2);
%  out1 = check(img3,r2,c2,H23);
%  figure();
%  imshow(mat2gray(out1));
% %  
 %% Stitching
 row = 600;
 col = 1600;
 final  = zeros([row,col],'double');
 out2  = zeros([row,col],'double');
 out2(80:80+360-1,350:350+640-1) = img2;%moving img2 to the middle of the final img
 [out1,flag1] = check(img1,r2,c2,H21);
 flag2 = zeros([row,col]);
 flag2(80:80+360-1,350:350+640-1) = 1;
 [out3,flag3] = check(img3,r2,c2,H23);
 flag = (flag1+flag2+flag3);
 for j=1:row
     for k=1:col
         
         final(j,k) = (out1(j,k) + out2(j,k) + out3(j,k))/flag(j,k);
     end
 end
 final = uint8(final);
figure();
final = final(20:550,1:1550);
imshow(mat2gray(final));




 