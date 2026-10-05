%% Load sample data from MAT files
% Comment these lines out if you want to use the data recently stored in
% the data_th and data_vm variables from after running QUARC controller.
% 
% load('data_pv_step_pos.mat');
% load('data_pv_step_vm.mat');
%
%% Setup variables
% Load from variables set in workspace after running a Simulink model or
% from the previously saved response saved in the MAT files above.
t = arm_angle(:,1);
arm_sim = arm_angle(:,2);
arm_meas = arm_angle(:,3);
pend_sim = pend_angle(:,2);
pend_meas = pend_angle(:,3);
%
%% Plot response
subplot(2,1,1);
plot(t,arm_sim,'b-','linewidth',2);
hold on
plot(t,arm_meas,'r-','linewidth',2);
ylabel('Arm Angle (rad)');
%
subplot(2,1,2);
plot(t,pend_sim,'b-','linewidth',2);
hold on
subplot(2,1,2);
plot(t,pend_meas,'r-','linewidth',2);
ylabel('Pendulum Angle (rad)');
xlabel('Time (s)');
legend('Simulated', 'Measured');
%
%% Print
% print rsp_step.png -dpng -r300