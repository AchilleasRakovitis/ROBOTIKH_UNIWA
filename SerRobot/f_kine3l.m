function P=f_kine3l(q1_deg,q2_deg,q3_deg)
% Input in DEGREES
l1=4;
l2=4;
l3=4;
q1=(q1_deg*pi)/180;
q2=(q2_deg*pi)/180;
q3=(q3_deg*pi)/180;

g01=[cos(q1) -sin(q1) 0 0;sin(q1) cos(q1) 0 0;0 0 1 0;0 0 0 1];
g12=[cos(q2) -sin(q2) 0 l1;sin(q2) cos(q2) 0 0;0 0 1 0;0 0 0 1];
g23=[cos(q3) -sin(q3) 0 l2;sin(q3) cos(q3) 0 0;0 0 1 0;0 0 0 1];
g03=g01*g12*g23;
g3e=[1 0 0 l3;0 1 0 0;0 0 1 0;0 0 0 1];
g0e=g03*g3e;

Px=g0e(13);
Py=g0e(14);
Pz=g0e(15);

P=[Px,Py,Pz];