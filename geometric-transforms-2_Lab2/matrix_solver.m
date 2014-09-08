function [Tx, Ty, theta1, theta2] = matrix_solver()
A = [125 30 1 0 ; 30 -125 0 1;373 158 1 0;158 -373 0 1];
B = [249;94;400;329];
X = A\B;
Tx = X(3); Ty = X(4); theta1 = acosd(X(1)); theta2 = asind(X(2));