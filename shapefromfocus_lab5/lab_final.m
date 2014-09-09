clc;
clear all;close all;
load stack.mat;
source = eval(['frame' sprintf('%0.3d',1)]);
size_init = size(source);
numframes = 100;
for q = 0:1:2
   SML = sum_mod_lapl(q,size_init,numframes);
   [foc_value ,d_indx ,d_value] = depth(size_init,SML);
   [X,Y] = meshgrid(1:1:size_init(1),1:1:size_init(2));
   figure();
   image_final = zeros(size_init(1), size_init(2),class(source));
   surf(X,Y,-d_value);
   for m=1:size_init(1)
       for n=1:size_init(2)
            img = eval(['frame' sprintf('%.3d', d_indx(m,n))]);
            image_final(m,n) = img(m,n);
       end
   end
    figure();
    imshow(image_final);
end