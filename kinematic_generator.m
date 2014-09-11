% Ball Screw Mechanism
% 

close all; clear all; clc;

% Time
syms t

% Rotation matrix (z)
Rz = inline('[cos(x) -sin(x); sin(x) cos(x)]');

% Driving angle
Phi = inline('0.001*t');


% Angles
syms theta1 theta2 theta3 theta4

% Dimensions
syms e1 e2 e3 % CoM position
syms r1 r2  % Shaft & crank size

% Configuration variables
syms X1 Y1 theta1 X2 Y2 theta2 X3 Y3 theta3 X4 Y4 theta4
syms dX1 dY1 dtheta1 dX2 dY2 dtheta2 dX3 dY3 dtheta3 dX4 dY4 dtheta4

q = [X1 Y1 theta1 X2 Y2 theta2 X3 Y3 theta3 X4 Y4 theta4].';
dq = [dX1 dY1 dtheta1 dX2 dY2 dtheta2 dX3 dY3 dtheta3 dX4 dY4 dtheta4].';
% 

% Base vectors
% pivot
zeta1 = Rz(theta1)*[1 0].';
eta1 = Rz(theta1)*[0 1].';

% link 1
zeta2 = Rz(theta2)*(zeta1) + e1*[cos(theta1) sin(theta1)].';
eta2 = Rz(theta2)*(eta1) + + e1*[cos(theta1) sin(theta1)].';

% link 2
zeta3 = Rz(theta3)*(zeta1) + r1*[cos(theta1) sin(theta1)].' + e2*[cos(theta2) sin(theta2)].';
eta3 = Rz(theta3)*(eta1) + r1*[cos(theta1) sin(theta1)].' + e2*[cos(theta2) sin(theta2)].';

% slider
zeta4 = Rz(theta4)*(zeta1) + r1*[cos(theta1) sin(theta1)].' + r2*[cos(theta2) sin(theta2)].';
eta4 = Rz(theta4)*(eta1) + r1*[cos(theta1) sin(theta1)].' + r2*[cos(theta2) sin(theta2)].';

% Atraints
A = [];

% Pivot
A = [A ; X1*zeta1 + Y1*eta1];
A = [A ; theta1];

% Pivot & link 1
A = [A ; X1*zeta1 + Y1*eta1 - (X2-e1)*zeta2 - Y2*eta2];

% Revolute joint link 1 & link 2
A = [A ; (X2+r1-e1)*zeta2 + Y2*eta2 - (X3-e2)*zeta3 - Y3*eta3];

% Pivot & link 2
A = [A ; (X3+r2-e2)*zeta3 + Y3*eta3 - X4*zeta4 - Y4*eta4];

% Slider
c1 = X4*zeta4 + (Y4+e3)*eta4 - X1*zeta1 -Y1*eta1;
c2 = X4*zeta4 + (Y4+e3)*eta4;
c3 = c1(1)*c2(2)-c1(2)*c2(1); % Cross Prodcut c1 and c2
A = [A ; c3];

A = [A ; theta1 - theta4];

% Driving Atraint
A = [A ;  theta2-Phi(t)];
A = simplify(A);

disp('Writing constraints in file ...');

tic
write_func_constraints(A);
toc


% Jacobian 
JA = jacobian(A,q);
JA = simplify(JA);

disp('Writing jacobian of constraints in file ...');

tic
write_func_Jconstraints(JA);
toc


% Gama
JJAdq = [];
[m,n] = size(JA);

for i=1:m
    tmp = [];
    for j=1:n
        tmp = [tmp jacobian(JA(i,j),q)*dq];
    end
    JJAdq = [JJAdq;tmp];
end

% Compute Gama
Gama = -JJAdq*dq;

disp('Writing gama in file ...');

tic
write_func_gama(Gama);
toc





