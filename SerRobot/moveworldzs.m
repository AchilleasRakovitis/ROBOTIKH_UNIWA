function moveworldzs(zs_mov)
% -> moveworldzs(zs_mov)
%Συνάρτηση κίνησης κατά τον άξονα Ζ, του βραχίονα SCARA
%Όρισμα 1: (zs_mov) -> απόσταση κατά z-axis (current=world)

global CURRENT_Q
global sel

d3=zs_mov+0.35;

if sel ~= 3
    error('This function is to be used only in SCARA arm!')
end

pb=CURRENT_Q(3)+zs_mov; %prismatic bounds check
if pb < -1.201 || pb > 0.01
    error('Input exceeds q3 bounds')
end


g=g0e;
gnew=[1 0 0 0; %Κίνηση από το Current position ΚΑΤΑ ΤΟΝ World-X
      0 1 0 0;
      0 0 1 d3;
      0 0 0 1];

G=gnew*g;
new_point=[G(1,4),G(2,4),G(3,4)];
fd=CURRENT_Q(1)+CURRENT_Q(2)+CURRENT_Q(4);
    movew(new_point(1),new_point(2),new_point(3),fd)