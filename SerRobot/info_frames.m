%Scara frames 
global sel

if sel ~= 3
    error('This function, can only be used in SCARA Robotic Arm!')
end

gB0=[eye(3,3) [0;0;2.54];
           zeros(1,3) 1];
         
gVB=[-1 0 0 0;
      0 0 1 0;
      0 1 0 0;
      0 0 0 1];
           
gVT=[-1 0 0 -0.7;
      0 0 1 0.99;
      0 1 0 -3;
      0 0 0 1];
           
g0T=inv(gB0)*inv(gVB)*gVT;