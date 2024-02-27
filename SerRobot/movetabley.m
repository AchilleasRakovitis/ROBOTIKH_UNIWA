function movetabley(y_mov)
% -> movetabley(y_mov)
%Συνάρτηση κίνησης P2P κατά τον άξονα y του frame του τραπεζιού
%Όρισμα 1: (y_mov) -> απόσταση κατά y-axis 

global sel

if sel ~= 3
    error('This function is to be used only in SCARA Robotic Arm')
end

moveworldy(y_mov)