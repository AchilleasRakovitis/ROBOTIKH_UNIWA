function h = traj(q0,qf,tfin)

global TRAJ_MODE;

if TRAJ_MODE == 1 % -> trajectory 3rd order
    
    h=traj3order(q0,qf,0,0,tfin);

elseif TRAJ_MODE == 2 % -> trajectory 5rd order
    
    h=traj5order(q0,qf,0,0,0,0,tfin);
    
elseif TRAJ_MODE == 3 % -> parabolic mixture
    
    h=par_mix(q0,0,qf,tfin);
    
else
    error('There was an error in reading trajectory mode! Please run robsim again...') 
end