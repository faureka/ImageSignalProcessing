clc; clear all; close all;
load 'imageFile.mat';
im = double(eval('g'));

[V1 D1] = eig(im*im');
[V2 D2] = eig(im'*im);

sigma = sqrt(abs(D1));
% sigma = V1'*im*V2;

for i = 1:8
    C = V1(:,i)*V2(:,i)';
    if(sum(sum(im.*C))<0)
        V2(:,i) = -V2(:,i);
    else
        V2(:,i) = V2(:,i);
    end
end

im_svd = V1*sigma*V2';

% imshowpair(im,im_svd,'diff');
% imshowpair(im,im_svd);
