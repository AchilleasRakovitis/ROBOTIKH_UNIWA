function grid_z(x)
%Συνάρτηση εμφάνισης/απόκρυψης του πλέγματος της αρπάγης

global GRID_Z
global sel

if sel ~= 3
    error('This function, can only be used in SCARA Robotic Arm!')
end

if x == 0 %no tool grid
    obj_coords('grz',0,0,-200,0)
    GRID_Z=0;
elseif x == 1 %tool-z grid
        info_frames
    g=g0e;
    gTE=inv(gVT)*gVB*gB0*g;
    xt=gTE(1,4); %Συντεταγμένες της αρπάγης ως προς το πλαίσιο του τραπεζιού
    yt=gTE(2,4);
    zt=gTE(3,4);
    obj_coords('grz',xt,yt,zt-0.1,0)
    GRID_Z=1;
else
    error('Wrong input!')
end