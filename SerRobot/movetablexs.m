function movetablexs(xs_mov)
% -> movetablexs(xs_mov)
%Συνάρτηση κίνησης, ΣΕ ΕΥΘΕΙΑ ΤΡΟΧΙΑ, κατά τον άξονα Χ του τραπεζιού
%Όρισμα 1: (tx_mov) -> απόσταση κατά x-axis (current)
%Οι κατευθύνσεις των αξόνων του table-frame και του world-frame,
%ταυτίζονται.

global sel

if sel ~= 3
    error('This function is to be used only in SCARA Robotic Arm')
end

moveworldxs(xs_mov)