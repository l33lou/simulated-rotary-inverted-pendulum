clear
%% Motor
% Resistance
Rm = 8.4;
% Current-torque (N-m/A)
kt = 0.042;
% Back-emf constant (V-s/rad)
km = 0.042;
%
%% Rotary Arm
% Mass (kg)
Mr = 0.095;
% Total length (m)
Lr = 0.085;
% Moment of inertia about pivot (kg-m^2)
Jr = Mr*Lr^2/12;
% Equivalent Viscous Damping Coefficient (N-m-s/rad)
Dr = 0.0015;
%
%% Pendulum Link
% Mass (kg)
Mp = 0.024;
% Total length (m)
Lp = 0.129;
% Moment of inertia about pivot (kg-m^2)
Jp = Mp*Lp^2/12;
% Equivalent Viscous Damping Coefficient (N-m-s/rad)
Dp = 0.0005;
% Gravity Constant
g = 9.81;
%
%% Get system equations
%rotpen_ABCD_eqns;
% State Space Representation
Jt = Jr*Jp + Mp*(Lp/2)^2*Jr + Jp*Mp*Lr^2;
A = [0 0 1 0;
     0 0 0 1;
     0 Mp^2*(Lp/2)^2*Lr*g/Jt -Dr*(Jp+Mp*(Lp/2)^2)/Jt -Mp*(Lp/2)*Lr*Dp/Jt;
     0 Mp*g*(Lp/2)*(Jr+Mp*Lr^2)/Jt -Mp*(Lp/2)*Lr*Dr/Jt -Dp*(Jr+Mp*Lr^2)/Jt];

B = [0; 0; (Jp+Mp*(Lp/2)^2)/Jt; Mp*(Lp/2)*Lr/Jt];
C = eye(4,4);
D = zeros(4,1);

% Add actuator dynamics
B = kt * B / Rm;
A(3,3) = A(3,3) - kt*kt/Rm*B(3);
A(4,3) = A(4,3) - kt*kt/Rm*B(4);

% Load into state-space system
rp_sys = ss(A,B,C,D)

eig(A)

%% Properties of the system
%% question 3
% Controlability
Co = ctrb(A,B);
rank(Co) == size(A,1)

%% question 4-5
% Percent overshoot and settling time
ksi = 0.65;
omega_n = 4;

% Dominant poles
sigma = ksi * omega_n;
omega_d = omega_n * sqrt(1 - ksi^2);
p1 = -sigma + 1i*omega_d;
p2 = -sigma - 1i*omega_d;

p1
p2

% Secondary poles
p3 =-40;
p4 = -45;

p_desires = [p1, p2, p3, p4];

%% matrix gain

K = place(A, B, p_desires);

A_cl = A - B*K;
B_cl = B;
C_cl = C;
D_cl = D;

A_cl
K

eig(A_cl)

%% +- 30deg input for theta
kr_deg = 30 ;
kr = kr_deg*pi/180
x0 = [0; 0; 0; 0];