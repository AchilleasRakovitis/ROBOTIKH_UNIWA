function P=f_kinescara(q1_deg,q2_deg,q3_dm,q4_deg)
%Λύση για το ευθύ κινηματικό πρόβλημα στον βραχίονα SCARA.
%Ορίσματα: 4
%-------
%q1_deg:Rotary Joint1 - σε μοίρες
%q2_deg:Rotary Joint2 - σε μοίρες
%q3:Prismatic Joint3 - σε mm
%q4_deg:Rotary Joint4 - σε μοίρες
%Έξοδος:
%-------

l1=2.25;
l2=1.25;
ltool=0.35;
theta1=(q1_deg*pi)/180;
theta2=(q2_deg*pi)/180;
d3=q3_dm;
theta4=(q4_deg*pi)/180;

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
         
P=[g(1,4) g(2,4) g(3,4)];