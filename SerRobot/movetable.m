function movetable(x_table,y_table,z_table,fd)
% -> move_table(x_table,y_table,z_table,fd)
%Συνάρτηση κίνησης ως προς το σύστημα αξόνων ΤΟΥ ΤΡΑΠΕΖΙΟΥ, στο χώρο εργασίας
%του βραχίονα SCARA
%INPUTS 4: x_table,y_table,z_table,fd - Συντεταγμένες x,y,z, και προσανατολισμός φ, ως
%προς το αδρανειακό σύστημα αξόνων που είναι τοποθετημένο στην άκρη του τραπεζιού

global sel

if sel ~= 3
    error('This function is to be used only in SCARA Robotic Arm')
end

info_frames

table_point=g0T*[x_table y_table z_table+0.35 1]';

movew(table_point(1),table_point(2),table_point(3),fd)