function grid_tool(x)
%Συνάρτηση εμφάνισης/απόκρυψης του πλέγματος της αρπάγης
%gra(1): Εμφάνιση πλέγματος
%gra(0): Απόκρυψη πλέγματος

global GRID_TOOL
global sel

if sel ~= 3
    error('This function, can only be used in SCARA Robotic Arm!')
end

if x == 0 %no tool grid
    obj_coords('gra',0,0,-200,0)
    obj_coords('ga2',0,0,-200,0)
    GRID_TOOL=0;
elseif x == 1 %plain tool grid
    obj_coords('gra',0,0,-0.1,0)
    obj_coords('ga2',0,0,-200,0)
    GRID_TOOL=1;
elseif x == 2 %thick tool grid
    obj_coords('gra',0,0,-0.1,0)
    obj_coords('ga2',0,0,-0.1,0)
    GRID_TOOL=2;
else
    disp('Wrong input!')
end