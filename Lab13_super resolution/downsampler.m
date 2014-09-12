function D = downsampler(m)
% i = 1;
% k = 1;
% while k <= m(2)
%     y(i) = (Y(k) + Y(k+1))*0.5;
%     k = k + 2;
%     i = i + 1;
% end
D = zeros(m(2),m(2));
i = 1;
j = 1;
while i <= m(2)/2
%     j = 1;
    while j <= m(2)
        D(i,j) = 1;
        D(i,j+1) = 1;
        i = i+1;
        j = j+2;
    end
end
D = D * 0.5;  
