%% RANSAC Implementation
function H = RANSAC(crrsp1,crrsp2)
    len_pts = size(crrsp1);
    C = [];
    while length(C)< 0.8*len_pts(1)
        C = [];
        r = floor(1 + (len_pts(1)-1).*rand(4,1));
        %Homography
        x1 = crrsp1(r(1),1); y1 = crrsp1(r(1),2);
        x2 = crrsp1(r(2),1); y2 = crrsp1(r(2),2);
        x3 = crrsp1(r(3),1); y3 = crrsp1(r(3),2);
        x4 = crrsp1(r(4),1); y4 = crrsp1(r(4),2);
        
        x1p = crrsp2(r(1),1); y1p = crrsp2(r(1),2);
        x2p = crrsp2(r(2),1); y2p = crrsp2(r(2),2);
        x3p = crrsp2(r(3),1); y3p = crrsp2(r(3),2);
        x4p = crrsp2(r(4),1); y4p = crrsp2(r(4),2);
        A = [[-x1 -y1 -1 0 0 0 x1*x1p y1*x1p x1p];[0 0 0 -x1 -y1 -1 x1*y1p y1*y1p y1p];[-x2 -y2 -1 0 0 0 x2*x2p y2*x2p x2p];
            [0 0 0 -x2 -y2 -1 x2*y2p y2*y2p y2p];[-x3 -y3 -1 0 0 0 x3*x3p y3*x3p x3p];[0 0 0 -x3 -y3 -1 x3*y3p y3*y3p y3p];
            [-x4 -y4 -1 0 0 0 x4*x4p y4*x4p x4p];[0 0 0 -x4 -y4 -1 x4*y4p y4*y4p y4p]];
        B = null(A);
        B = B/B(9);
        for j=1:length(crrsp1)
            if j==r(1) || j==r(2) || j==r(3) || j==r(4)
                %do nothing
            else
                H = [[B(1) B(2) B(3)];[B(4) B(5) B(6)];[B(7) B(8) B(9)]]; 
                Pt = zeros(3,1);
                Pt(1:2,1) = crrsp1(j,:);
                Pt(3,1) = 1;
                Ptp = crrsp2(j,:);
                Ptpp = (H)*Pt;
                Ptpp = Ptpp/Ptpp(3);
                Distance = sqrt((Ptp(1) - Ptpp(1))^2 + (Ptp(2)-Ptpp(2))^2);
                if Distance < 10
                    C = union(C,[j]);
                end
            end
        end
    end
 %H = H_temp;         
end