function f=wheref

global CURRENT_Q
global sel

if sel == 1
    f=CURRENT_Q(1)+CURRENT_Q(2);
elseif sel == 2
    f=CURRENT_Q(1)+CURRENT_Q(2)+CURRENT_Q(3);
else
    f=CURRENT_Q(1)+CURRENT_Q(2)+CURRENT_Q(4);
end