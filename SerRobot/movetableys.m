function movetableys(ys_mov)
% -> movetableys(ys_mov)
%Συνάρτηση κίνησης, ΣΕ ΕΥΘΕΙΑ ΤΡΟΧΙΑ, κατά τον άξονα Χ του τραπεζιού
%Όρισμα 1: (ty_mov) -> απόσταση κατά y-axis (current)
%Οι κατευθύνσεις των αξόνων του table-frame και του world-frame,
%ταυτίζονται.

global sel

if sel ~= 3
    error('This function is to be used only in SCARA Robotic Arm')
end

moveworldys(ys_mov)