function P=f_kinescara_(q1,q2,q3_mm,q3)
%Forward Kinematic solution for SCARA.
%Inputs:
%-------
%q1:Rotary Joint1 - in rad
%q2:Rotary Joint2 - in rad
%q3:Prismatic Joint3 - in mm
%q4:Rotary Joint4 - in rad
%Output:
%-------

l1=2.25;
l2=1.25;

Px=l1*cos(q1)+l2*cos(q1+q2);
Py=l1*sin(q1)+l2*sin(q1+q2);
Pz=q3_mm;
P=[Px,Py,Pz];