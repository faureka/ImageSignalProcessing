function [ output ] = circulant( input,shift )

output = input;
for i=2:size(input,1)
    for j=1:size(input,2)
        y = j-shift;
        if y < 1
            y = size(input,2) + y;
        end
        output(i,j) = output(i-1,y);
    end
end
end

