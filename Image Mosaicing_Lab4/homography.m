function [H] = homography(x_s,y_s,x_t,y_t)

A = [-x_s(1) -y_s(1) -1 0 0 0 x_s(1)*x_t(1) x_t(1)*y_s(1) x_t(1);0 0 0 -x_s(1) -y_s(1) -1 x_s(1)*y_t(1) y_t(1)*y_s(1) y_t(1); ...
     -x_s(2) -y_s(2) -1 0 0 0 x_s(2)*x_t(2) x_t(2)*y_s(2) x_t(1);0 0 0 -x_s(2) -y_s(2) -1 x_s(2)*y_t(2) y_t(2)*y_s(2) y_t(2); ...
     -x_s(3) -y_s(3) -1 0 0 0 x_s(3)*x_t(3) x_t(3)*y_s(3) x_t(3);0 0 0 -x_s(3) -y_s(3) -1 x_s(3)*y_t(3) y_t(3)*y_s(3) y_t(3); ...
     -x_s(4) -y_s(4) -1 0 0 0 x_s(4)*x_t(4) x_t(4)*y_s(4) x_t(4);0 0 0 -x_s(4) -y_s(4) -1 x_s(4)*y_t(4) y_t(4)*y_s(4) y_t(4); ...
    ];
H = null(A);

H= reshape(H,3,3)';

H= H_1_1./H(3,3);
end
  
    