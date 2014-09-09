function [foc_value ,d_indx ,d_value] = depth(size,SML)
    load stack.mat;
    del_d = 50.5;
    foc_value = zeros(size);
    d_indx = zeros(size);
    d_value = zeros(size);
    for m = 1:size(1)
        for n = 1:size(2)
            [F ,ind] = max(SML(m,n,:));
            foc_value(m,n) = F;
            d_indx(m,n) = ind;
            if (ind>1 && ind<numframes)
                F_L = SML(m,n,ind-1);
                F_H = SML(m,n,ind+1);
                d_L = (ind-1)*del_d;
                d_H = (ind+1)*del_d;
                d   =  ind*del_d; 
                d_value(m,n) = ((log(F/F_H)*(d^2 - d_L^2)) - (log(F/F_L)*(d^2 - d_H^2)))/(2*del_d*(log(F/F_L)+log(F/F_H)));
            else
                d_value(m,n) = 0;
            end
        end
    end
end