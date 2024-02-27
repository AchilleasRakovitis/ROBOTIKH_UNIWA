%Script επιλογής Ρομποτικού Βραχίονα και αρχικοποίησης global μεταβλητών.
function robsim(arm)

global GRASP
global CURRENT_Q
global ORBITS
global VELOCITY_PERCENTAGE
global here_STACK
global here_STACK_POINTER
global here_Q
global sel
global TRAJ_MODE
global NEAREST_OBJ %Nearest Object code
global FRAME % Για επιλογή τροχιάς μέσω GUI
global GRID_TOOL %GRID=1->grid & trace are visible
global GRID_Z
global tb
global V1_max
global V2_max
global V3_max
global V4_max
global A1_max
global A2_max
global A3_max
global A4_max

GRID=0;
here_STACK_POINTER=0;
sel=arm;

if sel==1 % FLAT 2 LINKS

    wb = waitbar(0,'Initializing Robot. Please wait...');
    for i=1:1000
        waitbar(i/1000,wb)
    end
    close(wb)
    clear wb
    
    disp('--FLAT 2 LINKS ROBOT ARM--')
    h.world = vrworld('2links.wrl');
    open(h.world);
    
    GRASP = 0;
    CURRENT_Q = [0 0];
    V1_max=90; %deg/sec
    V2_max=70; %deg/sec
    
    A1_max=123;  %deg/sec^2
    A2_max=98.4; %deg/sec^2
  
elseif sel==2 % FLAT 3 LINKS
    
    wb = waitbar(0,'Initializing Robot. Please wait...');
    for i=1:1000
        waitbar(i/1000,wb)
    end
    close(wb)
    clear wb
    
    disp('--FLAT 3 LINKS ROBOT ARM--')
    h.world = vrworld('3links.wrl');
    open(h.world);
    
    GRASP = 0;
    CURRENT_Q = [0 0 0];
    V1_max=90; %deg/sec
    V2_max=70; %deg/sec
    V3_max=65; %deg/sec
    
    A1_max=123;  %deg/sec^2
    A2_max=98.4; %deg/sec^2
    A3_max=93.6; %deg/sec^2
          
elseif sel==3 %SCARA
    
    wb = waitbar(0,'Initializing Robot. Please wait...');
    for i=1:1000
        waitbar(i/1000,wb)
    end
    close(wb)
    clear wb
    init_globals
    
    disp('--SCARA ROBOT ARM--')
    h.world = vrworld('scara.wrl');
    open(h.world);
    
    GRASP = 0;
    CURRENT_Q = [0 0 0 0];
    V1_max=916/20;  %deg/sec
    V2_max=1650/20; %deg/sec
    V3_max=1.2;   %dm/sec
    V4_max=2600/20; %deg/sec
    
    A1_max=123;  %deg/sec^2
    A2_max=98.4; %deg/sec^2
    A3_max=9.36; %dm/sec^2
    A4_max=149;  %deg/sec^2
    clear_obj
    
else
    disp('No such option exist!')
    return    
end

view(h.world);
robsim_gui
disp('Type "fin" to quit at any time...')