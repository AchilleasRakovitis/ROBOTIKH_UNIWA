function moveworldx(wx_mov)
% -> moveworldx(wx_mov)
%Συνάρτηση κίνησης P2P κατά τον άξονα x του frame {0}
%Όρισμα 1: (x_mov) -> απόσταση κατά x-axis

global CURRENT_Q
global sel

g=g0e;
gnew=[1 0 0 wx_mov; %Κίνηση από το Current position ΚΑΤΑ ΤΟΝ World-X
      0 1 0 0;
      0 0 1 0;
      0 0 0 1];

G=gnew*g;  
new_point=[G(1,4),G(2,4),G(3,4)];

if sel == 1
    movew(new_point(1),new_point(2))
elseif sel == 2
    fd=CURRENT_Q(1)+CURRENT_Q(2)+CURRENT_Q(3);
    movew(new_point(1),new_point(2),fd)
elseif sel == 3
    fd=CURRENT_Q(1)+CURRENT_Q(2)+CURRENT_Q(4);
    movew(new_point(1),new_point(2),CURRENT_Q(3),fd)
end