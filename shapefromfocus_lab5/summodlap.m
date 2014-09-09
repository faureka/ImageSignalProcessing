function [SML,ML] = summodlap (numframes,size_init,q)
ML = zeros(size_init(1),size_init(2),numframes);
SML = zeros(size_init(1),size_init(2),numframes);
load 'stack.mat';
%% ML calculation
for i = 1:numframes
    img_eval = eval(['frame' sprintf('%0.3d',i)]);
    for m = 1:size_init(1)
        for n = 1:size_init(2)
            if (m < size_init(1) && m > 1) || (n < size_init(2) && n > 1)
                gxx = img_eval(m+1,n) - 2* img_eval(m,n) + img_eval(m-1,n);
                
                gyy = img_eval(m,n+1) - 2*img_eval(m,n) +  img_eval(m,n-1);
            elseif m == size_init(1) && n < size_init(2)
                
                tempxx = ((img_eval(m,n-1) + img_eval(m-1,n) + img_eval(m,n+1))*0.5 + img_eval(m,n))/2.5;
                 gxx = tempxx  - 2*img_eval(m,n) + img_eval(m-1,n);
                
            elseif n == size_init(2) && m < size_init(1)    
                tempyy = ((img_eval(m+1,n) + img_eval(m,n-1) + img_eval(m-1,n))*0.5 + img_eval(m,n))/2.5;
                 gyy = tempyy  - 2*img_eval(m,n) +  img_eval(m,n-1);
            
            elseif m == 1 && n > 1
                
               tempxx = ((img_eval(1,n-1) + img_eval(2,n) + img_eval(1,n+1))*0.5 + img_eval(1,n))/2.5;
                 gxx = tempxx  - 2*img_eval(m,n) + img_eval(m+1,n);
               
            elseif n == 1 && m > 1
                
               tempyy = ((img_eval(m-1,1) + img_eval(m,2) + img_eval(m+1,1))*0.5 + img_eval(m,1))/2.5;
                 gyy = tempyy  - 2*img_eval(m,n) + img_eval(m,n+1);
            end
            
            ML(m,n,i) = abs(gxx) + abs(gyy);
        end
    end
end
%% SML calculation
for j=1:numframes
        for m = 1:size(1)
            for n = 1:size(2)
                if (m>q && n>q && m<size(1)-q && n<size(2)-q)
                    SML(m,n,j) = sum(sum(ML(m-q:m+q,n-q:n+q,j)));
                else
                    SML(m,n,j) = 0;
                end
            end
        end
end
