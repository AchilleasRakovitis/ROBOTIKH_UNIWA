function grid_world(x)
%Συνάρτηση εμφάνισης/απόκρυψης του πλέγματος του world frame
%grid_world(1): Εμφάνιση πλέγματος
%grid_world(0): Απόκρυψη πλέγματος

global sel

if sel ~= 3
    error('This function, can only be used in SCARA Robotic Arm!')
end

if x == 1
    obj_coords('grw',0,-3,2.45,0)
elseif x == 0
    obj_coords('grw',0,-3,-200,0)
else
    disp('Wrong input!')
end