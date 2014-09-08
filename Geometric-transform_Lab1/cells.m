clc;
close all;
clear all;
A = double(imread('C:\Users\stifler\Downloads\study material\VIII sem\image signal processing\cells_scale.pgm'));
image(A);
scale = 2;
A_s = [];
[R,C] = size(A);
for i = 1:R*scale
    for j = 1:C*scale
        k = i/scale + 1;
        l = j/scale + 1;
         if ceil(k) >= R || ceil(l) >= C 
         else
                 imageval = bilininterp(A,l,k);
                 A_s(i,j) = imageval;
    
         end
    end
end
figure();
imshow(double(A_s/255))