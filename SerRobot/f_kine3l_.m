function P=f_kine3l(q1,q2,q3)
% Input in RAD
l1=4;
l2=4;
l3=4;

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