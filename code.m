
Num = [1 1];
Den = [1 1 -2];
roots(Den)
[A, B, C, D] = tf2ss(Num, Den) %converts transfer function filter parameters to state-space form
eig(A)
Co = ctrb(A, B); %generate the controllability matrix 
controllability = rank(Co);
P = [-1 -2];
K = place(A, B, P); %generate matrix gain
Acl = A-B*K
eig(Acl)
Sys_cl = ss(Acl, B, C, D);
kr = 1/dcgain(Sys_cl)