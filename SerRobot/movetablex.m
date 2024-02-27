function movetablex(x_mov)
% -> movetablex(x_mov)
%Συνάρτηση κίνησης P2P κατά τον άξονα x του frame του τραπεζιού
%Όρισμα 1: (x_mov) -> απόσταση κατά x-axis

global sel

if sel ~= 3
    error('This function is to be used only in SCARA Robotic Arm')
end

moveworldx(x_mov)