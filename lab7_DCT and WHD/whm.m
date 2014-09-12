clc; close all;
clear all;

rho = 0.91;
cov_rho =  [1 rho rho^2 rho^3 rho^4 rho^5 rho^6 rho^7];
cov_mat = zeros(8,8);
for i = 1:8
    for j = 1:8
        cov_mat(i,j) = rho^abs(i-j);
    end
end
H = [1,1;1,-1];
while size(H) ~= 8
    H = [H , H;H , -H];
end
H = (1/(2*sqrt(2))) * H;

%diagonalization
WH_daig = H*cov_mat*H;

dct_daig = dct(dct(cov_mat')');

%energy packing efficiency 
whd_daig_k = sum(diag(WH_daig));
dct_daig_k = sum(diag(dct_daig));

for i = 1:length(WH_daig)
    for j = 1:length(WH_daig) 
        if i == j && i > 1
            epe_whd(i) = WH_daig(i,i) + epe_whd(i-1);
%             epe_whd(i) = epe_whd(i)/whd_daig_k;
        elseif i == j && i == 1
            epe_whd(i) = WH_daig(i,i);    
%             epe_whd(i) = epe_whd(i)/whd_daig_k;


        end
    end
end
epe_whd = epe_whd./whd_daig_k;
for i = 1:length(dct_daig)
    for j = 1:length(dct_daig) 
        if i == j && i > 1
            epe_dct(i) = dct_daig(i,i) + epe_dct(i-1);
%             epe_whd(i) = epe_whd(i)/whd_daig_k;
        elseif i == j && i == 1
            epe_dct(i) = dct_daig(i,i);    
%             epe_whd(i) = epe_whd(i)/whd_daig_k;

        end
    end
end
epe_dct = epe_dct./dct_daig_k;

%plotting the energy packing efficiency of both
plot(epe_dct);hold all;plot(epe_whd);hold off;figure(gcf);
 
%decorrelation 
beta = sum(sum(abs(cov_mat))) - sum(diag(abs(cov_mat)));

whd_alpha = sum(sum(abs(WH_daig))) - sum(diag(abs(WH_daig)));
 
dct_alpha = sum(sum(abs(dct_daig))) - sum(diag(abs(dct_daig)));

dec_whd = 1 - (whd_alpha/beta);

dec_dct = 1 - (dct_alpha/beta);
disp('WHD_decorrealtion');
disp(dec_whd);
disp('DCT_decorrealtion');
disp(dec_dct);