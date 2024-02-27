function  P=f_kine2l(q1_deg,q2_deg)
% Input in DEGREES
l1=4;
l2=4;
q1=(q1_deg*pi)/180;
q2=(q2_deg*pi)/180;

Px=l1*cos(q1)+l2*cos(q1+q2);
Py=l1*sin(q1)+l2*sin(q1+q2);

P=[Px,Py];