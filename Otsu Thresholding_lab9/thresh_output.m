function image = thresh_output(thresh,image)
[R,C] = size(image);
for i = 1:R
    for j = 1:C
        if image(i,j) > thresh
            image(i,j) = 255;
        else
            image(i,j) = 0;
        end
    end
end