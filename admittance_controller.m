%% Admittance Control Validation Script
% This script demonstrates the time-domain and frequency-domain behavior of the verified open-loop admittance controller corresponding to Theorems 5.3 and 7.2 in the paper.

clear; clc; close all;

%% Parameters (same as in the formal model and root plots)
m  = 200;      % mass (kg)
c  = 120;      % damping (Ns/m)
Tc = 0.1;      % time constant (s)

%% Transfer Function: V(s)/FH(s) = (1/c) / ((m/c) * Tc * s^2 + ((m/c) + Tc) * s + 1)
num = [1/c];
den = [(m/c) * Tc, (m/c) + Tc, 1];
G = tf(num, den);

%% Time-Domain Analysis (Step Response)
f1 = figure;
step(G, 5); % 5 seconds simulation
%title('Step Response of Verified Open-Loop Admittance Controller');
xlabel('Time');
ylabel('Displacement (meters)');
grid on;

exportgraphics(f1, 'step_response.pdf', 'ContentType', 'vector');   % Vector PDF

f2 = figure;
rlocus(G);
%title('Root Locus of Verified Admittance Controller');
grid on;

exportgraphics(f2, 'root_locus.pdf', 'ContentType', 'vector');   % Vector PDF


