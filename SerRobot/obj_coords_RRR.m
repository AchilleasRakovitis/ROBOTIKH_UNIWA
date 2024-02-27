function obj_coords_RRR(obj,xt,yt,zt,g_deg)
% Συνάρτηση αλλαγής θέσης των αντικειμένων
% Οι συντεταγμένες δίνονται στο σύστημα αξόνων world

global sel

if sel ~= 2
    error('This function is to be used only in 3 DOF arm!')
end

h.world = vrworld('3links.wrl');
open(h.world);

global ob1_x %Obstacle 1
global ob1_y
global ob1_z
global ob1_rad
global ob2_x %Obstacle 2
global ob2_y
global ob2_z
global ob2_rad
global ob3_x %Obstacle 3
global ob3_y
global ob3_z
global ob3_rad
global ob4_x %Obstacle 4
global ob4_y
global ob4_z
global ob4_rad
global ob5_x %Obstacle 5
global ob5_y
global ob5_z
global ob5_rad

h.T1=vrnode(h.world,'ob1');
h.T2=vrnode(h.world,'ob2');
h.T3=vrnode(h.world,'ob3');
h.T4=vrnode(h.world,'ob4');
h.T5=vrnode(h.world,'ob5');

g_rad=g_deg*pi/180;

if obj == 'ob1'
    
    h.T1.translation=[xt yt zt];
    h.T1.rotation=[0 0 1 g_rad];
    ob1_x=xt;
    ob1_y=yt;
    ob1_z=zt;
    ob1_rad=g_rad;
    
elseif obj == 'ob2'
    
    h.T2.translation=[xt yt zt];
    h.T2.rotation=[0 0 1 g_rad];
    ob2_x=xt;
    ob2_y=yt;
    ob2_z=zt;
    ob2_rad=g_rad;
    
elseif obj == 'ob3'
    
    h.T3.translation=[xt yt zt];
    h.T3.rotation=[0 0 1 g_rad];
    ob3_x=xt;
    ob3_y=yt;
    ob3_z=zt;
    ob3_rad=g_rad;
    
elseif obj == 'ob4'
    
    h.T4.translation=[xt yt zt];
    h.T4.rotation=[0 0 1 g_rad];
    ob4_x=xt;
    ob4_y=yt;
    ob4_z=zt;
    ob4_rad=g_rad;
    
elseif obj == 'ob5'
    
    h.T5.translation=[xt yt zt];
    h.T5.rotation=[0 0 1 g_rad];
    ob5_x=xt;
    ob5_y=yt;
    ob5_z=zt;
    ob5_rad=g_rad;
    
else
    disp('Wrong usage of obj_coords function!')    
end