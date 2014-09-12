function [cluster1,cluster2,cluster3,count1,count2,count3,a,b,c] = clustering(mean1,mean2,mean3,image,image_size)
cluster1 = zeros(size(image));
cluster2 = zeros(size(image));
cluster3 = zeros(size(image));
count1 = 0;
count2 = 0;
count3 = 0;
a = zeros(image_size);
b = zeros(image_size);
c = zeros(image_size);
for i = 1:image_size(1)
    for j = 1:image_size(2)
       arr = [image(i,j,1) image(i,j,2) image(i,j,3)];
       mean_dist1 = norm (mean1 - arr);
       mean_dist2 = norm (mean2 - arr);
       mean_dist3 = norm (mean3 - arr);
       arr_dist = [mean_dist1,mean_dist2,mean_dist3];
       if min(arr_dist) == mean_dist1
           cluster1(i,j,:) = image(i,j,:);
           a(i,j,:) = mean1;
           count1 =count1 + 1;
       elseif  min(arr_dist) == mean_dist2
           cluster2(i,j,:) = image(i,j,:);
           count2 =count2 + 1;
           b(i,j,:) = mean2;
       else
           cluster3(i,j,:) = image(i,j,:);
           count3 =count3 + 1;           
           c(i,j,:) = mean3;
       end
    end
end
