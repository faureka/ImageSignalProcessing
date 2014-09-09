function [target,flag] = check(img,p,q,H)
    target = zeros([600,1600],class(img));
    flag = zeros([600,1600]);
    for Xt=1:600
        for Yt=1:1600
            Xtp = Xt-80;
            Ytp = Yt-350;
             A = (H)*[Xtp; Ytp; 1];
             a = A(1)/A(3);
             b = A(2)/A(3);
             Xs1 = floor(a);
             Xs2 = a - Xs1;
             Ys1 = floor(b);
             Ys2 = b - Ys1;
             
             if (Xs1 <= 0 || Ys1 <= 0 || Xs1 > p-1 || Ys1 > q-1)
                 target(Xt,Yt) = 0;
                 flag(Xt,Yt) = 0;
             elseif (Xs1 == p && Ys1 == q)
                 target(Xt,Yt) = img(Xs1,Ys1);
                 flag(Xt,Yt) = 0;
             elseif (Xs1 == p)
                 target(Xt,Yt) = floor((img(Xs1,Ys1)*(1-Ys2)) + (img(Xs1,Ys1+1)*Ys2));
                 flag(Xt,Yt) = 0;
             elseif (Ys1 == q)
                 target(Xt,Yt) = floor(img(Xs1,Ys1)*(1-Xs2) + img(Xs1+1,Ys1)*Xs2);
                 flag(Xt,Yt) = 0;
             else
                 target(Xt,Yt) = floor(img(Xs1,Ys1)*(1-Xs2)*(1-Ys2) + img(Xs1+1,Ys1)*Xs2*(1-Ys2) + img(Xs1,Ys1+1)*(1-Xs2)*Ys2 + img(Xs1+1,Ys1+1)*Xs2*Ys2);
                 flag(Xt,Yt) = 1;
             
                 
             end
       end
    end
end
