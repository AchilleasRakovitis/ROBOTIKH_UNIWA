function  P=f_kine2l_(q1,q2)
% Input in RAD
l1=4;
l2=4;

Px=l1*cos(q1)+l2*cos(q1+q2);
Py=l1*sin(q1)+l2*sin(q1+q2);

P=[Px,Py];