function cdfhist = cdf_hist(hist)
cdfhist = hist;
for i = 1: 256
    if i ~= 1
        cdfhist(i) = hist(i) + cdfhist(i-1); 
    else
        cdfhist(i) = hist(i);
    end
end
