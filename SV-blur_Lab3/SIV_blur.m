clc;
clear all;close all;
s=imread('Mandrill.pgm');
figure();
imshow(s);
sigma = 1.6;
s=double(s);
h=[];temp =[];
[r,c]=size(s);
target= [];
f=0;
n=ceil(6*sigma+1);
if sigma ~= 0

for j=1:n
    for k=1:n
        h(j,k)=exp(-((j-ceil(n/2))^2+(k-ceil(n/2))^2)/(2*sigma^2))/(2*pi*sigma^2);
%         disp(h(j,k));
%         pause();
    end
end
else
    h(1,1) = 1;
    n = 1;
end
%     disp(h);
%     pause();
    h = h/sum(sum(h));
% temp = [];    
for i=1:r
    for j=1:c
       
       if i+n/2 < r && j+n/2 < c && i-n/2 > 0 && j - n/2 > 0
        temp = s(i-floor(n/2):i+floor(n/2),j-floor(n/2):j+floor(n/2)).*h;
%         disp(temp);
%         pause();
        f(i,j) = sum(sum(temp));
       end           
    end
end

target = mat2gray(f);
figure();
imshow(target);
imsave();
% figure();
% imshowpair(target,s,'montage');