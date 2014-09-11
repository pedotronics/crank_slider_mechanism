function [A]= func_constraints(q)
%%%%%%  func_constraints.m
%%%%  06-Sep-2014 20:04:38
%%%%
%%%% Authors(s): Pedotronics LLC
%%%%
%%%%
%%%%
%%%%
% Read model parameters
[r1,r2,e1,e2,e3,m1,m2,m3,J1,J2] = func_model_parameters;
X1 = q(1);
Y1 = q(2);
theta1 = q(3);
X2 = q(4);
Y2 = q(5);
theta2 = q(6);
X3 = q(7);
Y3 = q(8);
theta3 = q(9);
X4 = q(10);
Y4 = q(11);
theta4 = q(12);
A = zeros(12,1);
A(1)= X1*cos(theta1) - Y1*sin(theta1);
A(2)= Y1*cos(theta1) + X1*sin(theta1);
A(3)= theta1;
A(4)= Y2*(sin(theta1 + theta2) - e1*cos(theta1)) - (X2 - e1)*(cos(theta1 + theta2) + e1*cos(theta1)) + X1*cos(theta1) - Y1*sin(theta1);
A(5)= Y1*cos(theta1) - Y2*(cos(theta1 + theta2) + e1*sin(theta1)) + X1*sin(theta1) - (X2 - e1)*(sin(theta1 + theta2) + e1*sin(theta1));
A(6)= (cos(theta1 + theta2) + e1*cos(theta1))*(X2 - e1 + r1) - Y2*(sin(theta1 + theta2) - e1*cos(theta1)) - Y3*(e2*cos(theta2) - sin(theta1 + theta3) + r1*cos(theta1)) - (X3 - e2)*(cos(theta1 + theta3) + e2*cos(theta2) + r1*cos(theta1));
A(7)= (sin(theta1 + theta2) + e1*sin(theta1))*(X2 - e1 + r1) - Y3*(cos(theta1 + theta3) + e2*sin(theta2) + r1*sin(theta1)) - (X3 - e2)*(sin(theta1 + theta3) + e2*sin(theta2) + r1*sin(theta1)) + Y2*(cos(theta1 + theta2) + e1*sin(theta1));
A(8)= Y3*(e2*cos(theta2) - sin(theta1 + theta3) + r1*cos(theta1)) - X4*(cos(theta1 + theta4) + r1*cos(theta1) + r2*cos(theta2)) - Y4*(r1*cos(theta1) - sin(theta1 + theta4) + r2*cos(theta2)) + (cos(theta1 + theta3) + e2*cos(theta2) + r1*cos(theta1))*(X3 - e2 + r2);
A(9)= Y3*(cos(theta1 + theta3) + e2*sin(theta2) + r1*sin(theta1)) - Y4*(cos(theta1 + theta4) + r1*sin(theta1) + r2*sin(theta2)) - X4*(sin(theta1 + theta4) + r1*sin(theta1) + r2*sin(theta2)) + (sin(theta1 + theta3) + e2*sin(theta2) + r1*sin(theta1))*(X3 - e2 + r2);
A(10)= X4*Y1*r1 - Y1*e3*sin(theta4) + Y1*Y4*r1 + Y1*e3*r1 - X1*Y4*cos(theta4) + X4*Y1*cos(theta4) - X1*e3*cos(theta4) - X1*X4*sin(theta4) - Y1*Y4*sin(theta4) + X4*Y1*r2*cos(theta1 - theta2) + Y1*Y4*r2*cos(theta1 - theta2) + Y1*e3*r2*cos(theta1 - theta2) + X1*X4*r2*sin(theta1 - theta2) + X1*Y4*r2*sin(theta1 - theta2) + X1*e3*r2*sin(theta1 - theta2);
A(11)= theta1 - theta4;
A(12)= theta2 - t/1000;