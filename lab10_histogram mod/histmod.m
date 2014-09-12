clc; clear all; close all;

ref_image = imread('ref_image.pgm');
inp_image = imread('inp_image.pgm');

[count_ref, ref_hist]  = imhist(ref_image);
[count_inp, inp_hist]  = imhist(inp_image);

% figure();
% bar(inp_hist);
% title('initial hist');
% figure();
% bar(ref_hist);
% title('reference histogram');

cdf_refhist = cdf_hist(ref_hist);
cdf_image = cdf_hist(inp_hist);

cdf_refhist = cumsum(count_ref)/sum(count_ref);
cdf_image   = cumsum(count_inp)/sum(count_inp);

% figure();
% bar(cdf_refhist);
% title('reference CDF plot'); 
% figure();
% bar(cdf_image);
% title('Image CDF plot');

i  = 1;
j = 1;
% res_hist = zeros(size(inp_hist));
final = zeros(size(inp_image));
for i = 1:256
    f = find(cdf_refhist >= cdf_image(i));
    g = find(inp_image == i);
    final(g) = f(1) - 1;
end
% figure();
% bar(res_hist);
% title('final histogram'); 
figure();
imshow(uint8(final));
title('final image');
% 
% figure();
% imshow(uint8(inp_image));
% title('initial image');

% figure();
% imhist(uint8(final));
% 
% figure();
% imhist(inp_image);