clc; clear all; close all;
load 'imageFile.mat';
im = double(eval('g'));

[V1 D1] = eig(im*im');
[V2 D2] = eig(im'*im);

sigma = sqrt(abs(D1));
for i = 1:8
    C = V1(:,i)*V2(:,i)';
    if(sum(sum(im.*C))<0)
        V2(:,i) = -V2(:,i);
    else
        V2(:,i) = V2(:,i);
    end
end

im_svd = V1*sigma*V2';
sum_k = zeros(8,1);


for i = 1:8
    temp = sigma(i,i);
    sigma(i,i) = 0;
    im_svd_temp = V1*sigma*V2';
    figure();
    imshow(uint8(im_svd_temp));
    err(i,1) = norm(im_svd-im_svd_temp);
    if i == 1
        sum_k(i) = sum_k(i) + (abs(temp))^2;
    else
        sum_k(i) = sum_k(i-1) + (abs(temp))^2;
    end
%     v = genvarname('im_svd', who);
%     eval([v '= im_svd']);
%     sigma(i,i) = temp;
end

disp(err);
% mn_error1 = norm(im_svd - im_svd8);
