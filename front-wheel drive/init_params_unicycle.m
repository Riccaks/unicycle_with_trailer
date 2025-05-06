%% Path Following Bicycle

close all;
clear all;
clc;

% bicycle length and velocity
L = 10;
v = -2;  % const

% initial position
q0 = [0; 10; pi/6; 0];

% lyapunov gain
K = 10;
