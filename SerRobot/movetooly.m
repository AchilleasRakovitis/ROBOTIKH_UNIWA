function movetooly(ty_mov)
% -> movetoolty(ty_mov)
%Συνάρτηση κίνησης P2P κατά τον άξονα y του frame της αρπάγης
%Όρισμα 1: (ty_mov) -> απόσταση κατά y-axis

global CURRENT_Q
global sel

g=g0e;
new_point=g*[0 ty_mov 0 1]';

if sel == 1
    movew(new_point(1),new_point(2))
elseif sel == 2
    fd=CURRENT_Q(1)+CURRENT_Q(2)+CURRENT_Q(3);
    movew(new_point(1),new_point(2),fd)
elseif sel == 3
    fd=CURRENT_Q(1)+CURRENT_Q(2)+CURRENT_Q(4);
    movew(new_point(1),new_point(2),CURRENT_Q(3),fd)
end