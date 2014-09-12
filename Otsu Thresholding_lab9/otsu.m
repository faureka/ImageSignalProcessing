function thresh = otsu (hist,max_intensity)
total = sum(hist);
sumt = 0;
max = 0;
wB = 0;
wF = 0;
sumB = 0;
mB = 0;
mF = 0;


for i = 1:max_intensity
    sumt = sumt + i*hist(i);
end

for i = 1:max_intensity
    wB = wB + hist(i);
    if wB == 0 
        continue
    end
    wF = total - wB;
    if wF == 0
        break
    end
    sumB = sumB + i*hist(i);
    mB = sumB/wB;
    mF = (sumt-sumB)/wF;
    btw = wB * wF * (mB - mF)^2;
    if btw > max
        thresh = i;

    end
    max = btw;
end
%     wF2 = total2 - wB2;