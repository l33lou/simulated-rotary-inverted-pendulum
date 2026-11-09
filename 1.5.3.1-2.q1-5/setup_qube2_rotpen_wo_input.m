%% question 1
% Load Model
qube2_rotpen_param;
% Set open-loop state-space model of rotary single-inverted pendulum (SIP)
QUBE2_ROTPEN_ABCD_eqns;
% Display matrices
A
B
C
D

%% question 2
% Open-loop poles : 
eig(A)

% question 3
% Controlability :
Co = ctrb(A, B);
rank(Co) == size(A, 1)

%% question 4
% LQR
Q = eye(4, 4);
R = 1;
K = lqr(A, B, Q, R)
kr = [0; 0; 0; 0]
x0 = [1; 0; 0; 0]

eig(A-B*K)