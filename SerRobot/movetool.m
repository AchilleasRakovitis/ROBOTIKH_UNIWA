function movetool(x_tool,y_tool,z_tool,fd)
% -> movetool(x_tool,y_tool,z_tool,fd)
%Συνάρτηση κίνησης ως προς το σύστημα αξόνων που είναι τοποθετημένο στην
%αρπάγη.
%INPUTS 4: x_tool,y_tool,z_tool,fd - Συντεταγμένες x,y,z, και προσανατολισμός φ, ως
%προς το αδρανειακό σύστημα αξόνων που είναι τοποθετημένο στην αρπάγη

global CURRENT_Q
global sel

if nargin == 2 && sel == 1 %F2L
    tool_point=g0e*[x_tool y_tool 0 1]';
    movew(tool_point(1),tool_point(2))
elseif nargin == 2 && sel == 2 %F3L
    tool_point=g0e*[x_tool y_tool 0 1]';
    fd=CURRENT_Q(1)+CURRENT_Q(2)+CURRENT_Q(3);
    movew(tool_point(1),tool_point(2))
elseif nargin == 4 && sel == 3 %SCARA
    tool_point=g0e*[x_tool y_tool z_tool+0.35 1]';
    %fd=CURRENT_Q(1)+CURRENT_Q(2)+CURRENT_Q(4);
    movew(tool_point(1),tool_point(2),tool_point(3),CURRENT_Q(1)+CURRENT_Q(2)+CURRENT_Q(4)+fd)

    
else
    error('Syntax error!')
end