function tf=time(dq1,dq2,dq3,dq4)
%Η συνάρτηση υπολογίζει το χρόνο ολοκλήρωσης μιας κίνησης, με βάση την
%ταχύτητα που έχει εισάγει στην αρχή του προγράμματος ο χρήστης.
%Χρησιμοποιείται εσωτερικά μόνο από το πρόγραμμα.
%Οι βραχίονες χρησιμοποιούν τα εξής ορίσματα:
%F2L:   dq1,dq2
%F3L:   dq1,dq2,dq3
%SCARA: dq1,dq2,dq3,dq4

global VELOCITY_PERCENTAGE
global tb
global TRAJ_MODE
global V1_max
global V2_max
global V3_max
global V4_max
global A1_max
global A2_max
global A3_max
global A4_max

if nargin == 2 %F2L
    
%     V1_max=90; %deg/sec
%     V2_max=70; %deg/sec
%     
%     A1_max=123;  %deg/sec^2
%     A2_max=98.4; %deg/sec^2

    t1=1.5*(dq1/(V1_max*VELOCITY_PERCENTAGE/100));
    t2=1.5*(dq2/(V2_max*VELOCITY_PERCENTAGE/100));
    
    if t1 > t2
        tf=t1;
        tb=V1_max/A1_max;
        
        if tb>tf/2
            tb=sqrt(abs(dq1)/abs(A1_max));
            tf=2*tb;
        end
            
    else
        tf=t2;
        tb=V2_max/A2_max;
        
        if tb>tf/2
            tb=sqrt(abs(dq2)/abs(A2_max));
            tf=2*tb;
        end
        
    end
        
elseif nargin == 3 %F3L
    
%     V1_max=90; %deg/sec
%     V2_max=70; %deg/sec
%     V3_max=65; %deg/sec
%     
%     A1_max=123;  %deg/sec^2
%     A2_max=98.4; %deg/sec^2
%     A3_max=93.6; %deg/sec^2
    
    t1=1.5*(dq1/(V1_max*VELOCITY_PERCENTAGE/100));
    t2=1.5*(dq2/(V2_max*VELOCITY_PERCENTAGE/100));
    t3=1.5*(dq3/(V3_max*VELOCITY_PERCENTAGE/100));
    
    if t1>t2 && t1>t3
        tf=t1;
        tb=V1_max/A1_max;
        
        if tb>tf/2
            tb=sqrt(abs(dq1)/abs(A1_max));
            tf=2*tb;
        end
        
    elseif t2>t1 && t2>t3
        tf=t2;
        tb=V2_max/A2_max;
        
        if tb>tf/2
            tb=sqrt(abs(dq2)/abs(A2_max));
            tf=2*tb;
        end
        
    elseif t3>t1 && t3>t2
        tf=t3;
        tb=V3_max/A3_max;
        
        if tb>tf/2
            tb=sqrt(abs(dq3)/abs(A3_max));
            tf=2*tb;
        end
        
    end
    
elseif nargin == 4 %SCARA
    
%     V1_max=916/20;  %deg/sec
%     V2_max=1650/20; %deg/sec
%     V3_max=1.2;   %dm/sec
%     V4_max=2600/20; %deg/sec
%     
%     A1_max=123;  %deg/sec^2
%     A2_max=98.4; %deg/sec^2
%     A3_max=9.36; %dm/sec^2
%     A4_max=149;  %deg/sec^2
    
    
    if dq1 == 0 && dq2 == 0 && dq3 == 0 && dq4 == 0
        error('This is the robot''s current position!')
    end
    
    t1=(dq1/(V1_max*VELOCITY_PERCENTAGE/100));
    t2=(dq2/(V2_max*VELOCITY_PERCENTAGE/100));
    t3=(dq3/(V3_max*VELOCITY_PERCENTAGE/100));
    t4=(dq4/(V4_max*VELOCITY_PERCENTAGE/100));
    
    v1=V1_max*VELOCITY_PERCENTAGE/100;
    v2=V2_max*VELOCITY_PERCENTAGE/100;
    v3=V3_max*VELOCITY_PERCENTAGE/100;
    v4=V4_max*VELOCITY_PERCENTAGE/100;
        
    if t1>t2 && t1>t3 && t1>t4
        
        if TRAJ_MODE ~= 3
            tf=t1;
        else
            tb=V1_max/A1_max;
            tf=tb+(dq1/v1);
            
            if tb>tf/2
                tb=sqrt(abs(dq1)/abs(A1_max));
                tf=2*tb;
            end
                             
        end
        
    elseif t2>t1 && t2>t3 && t2>t4
        
        if TRAJ_MODE ~= 3
            tf=t2;
        else
            tb=V2_max/A2_max;
            tf=tb+(dq2/v2);
            
            if tb>tf/2
                tb=sqrt(abs(dq2)/abs(A2_max));
                tf=2*tb;
            end
        end
        
    elseif t3>t1 && t3>t2 && t3>t4
        
        if TRAJ_MODE ~= 3
            tf=t3;
        else
            tb=V3_max/A3_max;
            tf=tb+(dq3/v3);
            
            if tb>tf/2
                tb=sqrt(abs(dq3)/abs(A3_max));
                tf=2*tb;
            end
        end
        
    elseif t4>t1 && t4>t2 && t4>t3
        
        if TRAJ_MODE ~= 3
            tf=t4;
        else
            tb=V4_max/A4_max;
            tf=tb+(dq4/v4);
            
            if tb>tf/2
                tb=sqrt(abs(dq4)/abs(A4_max));
                tf=2*tb;
            end
        end
        
    end

else
    error('Error using time.m! Wrong amount of inputs!') 
end