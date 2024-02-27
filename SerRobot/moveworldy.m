function moveworldy(wy_mov)
% -> moveworldy(wy_mov)
%Συνάρτηση κίνησης P2P κατά τον άξονα y του frame {0}
%Όρισμα 1: (y_mov) -> απόσταση κατά y-axis

global CURRENT_Q
global sel

g=g0e;
gnew=[1 0 0 0; %Κίνηση από το Current position ΚΑΤΑ ΤΟΝ World-Y
      0 1 0 wy_mov;
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