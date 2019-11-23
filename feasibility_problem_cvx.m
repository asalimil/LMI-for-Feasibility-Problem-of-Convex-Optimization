%% LMI for Feasibility Problem
clc; clear; close all;

t = sdpvar(1);

x1 = sdpvar(1);
x2 = sdpvar(1);

A0 = [3  1; 2 1];
A1 = [2 -1; 1 2];
A2 = [1  2; 1 3];

B0 = [6 -4; 1 1];
B1 = [8 -2; -2 2];
B2 = [5 -1; 3 3];


eta = 0.00000001;
C = [];
A = A0 + A1*x1 + A2*x2;
B = B0 + B1*x1 + B2*x2;
M = A - B - t*eye(2);
F = [C, M <= -eta*eye(2)];
optimize(F,t);

% minimized t
t = value(t)

% x_{i}
x1 = value(x1)
x2 = value(x2)

% matrix functions
A = A0 + A1*x1 + A2*x2
B = B0 + B1*x1 + B2*x2
A - B - t*eye(2)
