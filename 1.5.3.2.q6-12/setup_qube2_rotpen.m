%% question 1
% Load Model
qube2_rotpen_param;
% Set open-loop state-space model of rotary single-inverted pendulum (SIP)
QUBE2_ROTPEN_ABCD_eqns;

%% question 6
% LQR
Q = eye(4);
R = 1;
K = lqr(A, B, Q, R)
cons_deg = 30 ;
cons = cons_deg*(pi/180)
kr = [1; 0; 0; 0];
x0 = [0; 0; 0; 0];

eig(A-B*K)

%% question 8
% LQR
Qbis = diag([5 1 1 1]);
Kbis = lqr(A, B, Qbis, R)

eig(A-B*Kbis)

%% question 8
% LQR
Qter = diag([5 1 1 20]);
Kter = lqr(A, B, Qter, R)

eig(A-B*Kter)
