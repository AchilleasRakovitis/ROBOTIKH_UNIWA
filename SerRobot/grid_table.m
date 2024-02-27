function grid_table(x)
%Συνάρτηση εμφάνισης/απόκρυψης του πλέγματος του τραπεζιού
%grid_table(1): Εμφάνιση πλέγματος
%grid_table(0): Απόκρυψη πλέγματος

global sel

if sel ~= 3
    error('This function, can only be used in SCARA Robotic Arm!')
end

if x == 0 %no table grid
    obj_coords('grt',0,0,-200,0)
    obj_coords('gt2',0,0,-200,0)
elseif x == 1 %plain table grid
    obj_coords('grt',0,0,-0.1,0)
    obj_coords('gt2',0,0,-200,0)
elseif x == 2 %thick table grid
    obj_coords('grt',0,0,-0.1,0)
    obj_coords('gt2',0,0,-0.1,0)
else
    disp('Wrong input!')
end