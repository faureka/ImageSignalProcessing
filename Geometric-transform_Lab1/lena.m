clc;
close all;
clear all;
A = double(imread('C:\Users\stifler\Downloads\study material\VIII sem\image signal processing\lena_translate.pgm'));
Tx = 50.5;
Ty = 30.5;
A_t = [];

for i = 1: length(A)-Ty-1
    for j = 1: length(A)-Tx-1
    A_t_near(floor(Ty+i),floor(j+Tx) ) = A(i,j);
    imageval = bilininterp(A,length(A)-(j+Tx),length(A)-(i+Ty));
    A_t(floor(length(A)-(i)),floor(length(A)-(j))) = imageval;
    end
end
% A_t_near = A_t_near(1:length(A),1:length(A));
image(A)
figure();
image(A_t_near)
figure();
imshow(double(A_t/255))

% d = bilininterp(A,31.5,51.5);
