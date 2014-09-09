clc;clear all; close all;
im = imread('Globe.pgm');
[row,col] = size(im);
pix_size = class(im);
A = 2;  
N = row;
B = 8882.91; 
s = zeros(row,col);
for i=1:row
    for j=1:col
        s(i,j) = A*exp(-((i-1-(N/2))^2 + (j-1-(N/2))^2)/B);
    end
end
out = zeros(size(im),pix_size);

for i=1:row
    for j=1:col
        sig = s(i,j);
        ks = ceil(6*sig+1);   % Gaussian kernel size = ceil(6*sig +1) x ceil(6*sig +1)
        if(mod(ks,2)==0)       % if the size of kernel is even ks=ks+1 to make it odd 
            ks=ks+1;
        end
        offs = floor(ks/2);        % offset = ks/2. blurring starts from (offs,offs) rather than(1,1)  
        ker = zeros([ks,ks],'double');


        if(sig ~= 0)
            sum=0;
            for m=1:ks
                for n=1:ks
                    p=m-offs-1;
                    q=n-offs-1;
                    ker(m,n)= (1/(2*pi*sig^2))*exp(-((p)^2 + (q)^2)/(2*sig^2));
                    sum = sum+ker(m,n);
                end
            end
            ker = ker/sum;
        else 
            ker(1,1)=1;
        end

        
        for m = -offs:offs
            for n = -offs:offs
                if((i+m)>1 && (i+m)<row+1 && (j+n)>1 && (j+n)<col+1)
                    out(i+m,j+n) = out(i+m,j+n) + im(i,j)*ker(m+offs+1,n+offs+1);    
                end
            end
        end
    end
end

figure();
imshow(im);
figure();
imshow(out);
% figure();
% imshowpair(im,out);
        





        
        
