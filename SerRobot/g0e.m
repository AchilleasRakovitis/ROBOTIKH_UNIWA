function g=g0e

global CURRENT_Q
global sel

if sel == 1 %F2L
    
    l1=4;
    l2=4;
    theta1=CURRENT_Q(1)*pi/180;
    theta2=CURRENT_Q(2)*pi/180;
    
    
    g01=[cos(theta1) -sin(theta1) 0 0;
         sin(theta1)  cos(theta1) 0 0;
             0           0        1 0;
             0           0        0 1];
         
    g12=[cos(theta2) -sin(theta2) 0 l1;
         sin(theta2)  cos(theta2) 0 0;
             0           0        1 0;
             0           0        0 1];
         
    g2e=[1 0 0 l2;
         0 1 0 0;
         0 0 1 0;
         0 0 0 1];
     
    g=g01*g12*g2e;
    
elseif sel == 2 %F3L
    
    l1=4;
    l2=4;
    l3=4;
    
    theta1=CURRENT_Q(1)*pi/180;
    theta2=CURRENT_Q(2)*pi/180;
    theta3=CURRENT_Q(3)*pi/180;
    
    g01=[cos(theta1) -sin(theta1) 0 0;
         sin(theta1) cos(theta1)  0 0;
              0          0        1 0;
              0          0        0 1];
          
    g12=[cos(theta2) -sin(theta2) 0 l1;
         sin(theta2)  cos(theta2) 0 0;
              0           0       1 0;
              0           0       0 1];
          
    g23=[cos(theta3) -sin(theta3) 0 l2;
         sin(theta3)  cos(theta3) 0 0;
              0           0       1 0;
              0           0       0 1];
          
    g3e=[1 0 0 l3;
         0 1 0 0;
         0 0 1 0;
         0 0 0 1];
     
    g=g01*g12*g23*g3e;
    
elseif sel == 3 % SCARA

    l1=2.25;
    l2=1.25;
    ltool=0.35; %Μήκος αρπάγης
    
    theta1=CURRENT_Q(1)*pi/180;
    theta2=CURRENT_Q(2)*pi/180;
    d3=CURRENT_Q(3);
    theta4=CURRENT_Q(4)*pi/180;    

    g01=[cos(theta1) -sin(theta1) 0   0;
         sin(theta1)  cos(theta1) 0   0;
         0              0         1   0;
         0              0         0   1];

    g12=[cos(theta2) -sin(theta2) 0 l1;
         sin(theta2)  cos(theta2) 0 0;
         0                0       1 0;
         0                0       0 1];

    g23=[1 0 0  l2;
         0 1 0   0;
         0 0 1  d3;
         0 0 0  1];
     
    g34=[cos(theta4) -sin(theta4) 0 0;
         sin(theta4)  cos(theta4) 0 0;
         0            0           1 0;
         0            0           0 1];
     
    g4e=[1 0 0 0;
         0 1 0 0;
         0 0 1 -ltool;
         0 0 0 1];
      
    g=g01*g12*g23*g34*g4e;
    
end