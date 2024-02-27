function movetoolzs(zs_mov)
% -> movetoolzs(zs_mov)
%Συνάρτηση κίνησης κατά τον άξονα Ζ, της αρπάγης, στο βραχίονα SCARA
%Όρισμα 1: (zs_mov) -> απόσταση κατά z-axis (tool)

global CURRENT_Q
global sel

d3=CURRENT_Q(3)+zs_mov;

if sel ~= 3
    error('This function is to be used only in SCARA arm!')
end

if d3 < -1.20001 || d3 > 1e-5
    error('Input must be between -1.2..0')
end

moveq(CURRENT_Q(1),CURRENT_Q(2),d3,CURRENT_Q(4))

CURRENT_Q=[CURRENT_Q(1),CURRENT_Q(2),d3,CURRENT_Q(4)];