clc;clear all; close all;
image = double(imread('car.ppm'));
% mean1 = [255 0 0];
% mean2 = [0 0 0];
% mean3 = [255 255 255];
image_size = size(image);


% n  = 10;
for n = 1:5
    if n == 1 
        mean1 = [255 0 0];
        mean2 = [0 0 0];
        mean3 = [255 255 255];
        [cluster1,cluster2,cluster3,count1,count2,count3,a,b,c] = clustering(mean1,mean2,mean3,image,image_size);
    else
        mean1 = [sum(sum(cluster1(:,:,1)))/count1 , sum(sum(cluster1(:,:,2)))/count1 , sum(sum(cluster1(:,:,3)))/count1];
        mean2 = [sum(sum(cluster2(:,:,1)))/count2 , sum(sum(cluster2(:,:,2)))/count2 , sum(sum(cluster2(:,:,3)))/count2];
        mean3 = [sum(sum(cluster3(:,:,1)))/count3 , sum(sum(cluster3(:,:,2)))/count3 , sum(sum(cluster3(:,:,3)))/count3];
        [cluster1,cluster2,cluster3,count1,count2,count3,a,b,c] = clustering(mean1,mean2,mean3,image,image_size);
    end
%     n = n - 1;
%     disp(n);
end


image_final = a+b+c ;
% for i = 1:image_size(1)
%     for j = 1:image_size(2)
%         if arr(i,j) == 1
%             image_final(i,j,:) = mean1;
%         elseif arr(i,j) == 2
%             image_final(i,j,:) = mean2;
%         else
%             image_final(i,j,:) = mean3;
%         end
%     end
% end

figure();
imshow(uint8(cluster1));
figure();
imshow(uint8(cluster2));
figure();
imshow(uint8(cluster3));
figure();
imshow(uint8(image_final));