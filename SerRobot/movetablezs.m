function movetablezs(zs_mov)
% -> movetablezs(zs_mov)
%Συνάρτηση κίνησης κατά τον άξονα z του frame του τραπεζιού
%Όρισμα 1: (zs_mov) -> απόσταση κατά z-axis 

global CURRENT_Q
global sel

if sel ~= 3
    error('This function is to be used only in SCARA Robotic Arm')
end

pb=CURRENT_Q(3)+zs_mov; %prismatic bounds check
if pb < -1.201 || pb > 0.01
    error('Input exceeds q3 bounds')
else
    moveworldzs(zs_mov)
end