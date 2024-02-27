function moveq(q1,q2,q3,q4)
% -> moveq(q1,q2,q3,q4)
%Συνάρτηση κίνησης, από την τρέχουσα θέση, σε αυτήν με γωνίες q1,q2,q3,q4
%Inputs: q1,q2,q3,q4 σε ΜΟΙΡΕΣ - Στην περίπτωση του SCARA, το q3 εισάγεται
%σε dm

global CURRENT_Q
global ORBITS
global sel
global TRAJ_MODE
global tb

if nargin == 2 % q1, q2 -> FLAT 2 LINKS
    
    if sel ~= 1 %Check if move inputs are correct
        disp('The inputs entered in move function, are for robotic arm "FLAT 2 LINKS"!')
        disp('FLAT 2 LINKS robotic arm is not activated!')
        error('Runtime error during calling moveq function...')
    end
    Qa=[CURRENT_Q(1),CURRENT_Q(2)];
    Qb=[q1,q2];
    dq1=abs(Qb(1)-Qa(1)); %Inputs for time.m
    dq2=abs(Qb(2)-Qa(2)); %Inputs for time.m
    tf=time(dq1,dq2);
    Q1_T=traj(Qa(1),Qb(1),tf);
    Q2_T=traj(Qa(2),Qb(2),tf);
    ORBITS=[Q1_T(:,1),Q1_T(:,2),Q2_T(:,2)];
    CURRENT_Q=[q1,q2];
    f2fk(ORBITS)
    
elseif nargin == 3 % q1, q2, q3 -> FLAT 3 LINKS
    
    if sel ~= 2 %Check if move inputs are correct
        disp('The inputs entered in move function, are for robotic arm "FLAT 3 LINKS"!')
        disp('FLAT 3 LINKS robotic arm is not activated!')
        error('Runtime error during calling moveq function...')
    end
    Qa=[CURRENT_Q(1),CURRENT_Q(2),CURRENT_Q(3)];
    Qb=[q1,q2,q3];
    dq1=abs(Qb(1)-Qa(1)); %Inputs for time.m
    dq2=abs(Qb(2)-Qa(2)); %Inputs for time.m
    dq3=abs(Qb(3)-Qa(3)); %Inputs for time.m
    tf=time(dq1,dq2,dq3);
    Q1_T=traj(Qa(1),Qb(1),tf);
    Q2_T=traj(Qa(2),Qb(2),tf);
    Q3_T=traj(Qa(3),Qb(3),tf);
    ORBITS=[Q1_T(:,1),Q1_T(:,2),Q2_T(:,2),Q3_T(:,2)];
    CURRENT_Q=[q1,q2,q3];
    f3fk(ORBITS)
    
elseif nargin == 4 % q1_deg, q2_deg, q3_dm, q4_deg -> SCARA
    
    if sel ~= 3 %Check if move inputs are correct
        disp('The inputs entered in move function, are for robotic arm "SCARA"!')
        disp('SCARA robotic arm is not activated!')
        error('Runtime error during calling moveq function...')
    end
    Qa=[CURRENT_Q(1),CURRENT_Q(2),CURRENT_Q(3),CURRENT_Q(4)];
    Qb=[q1,q2,q3,q4];
    
    dq1=abs(Qb(1)-Qa(1)); %Inputs for time.m
    dq2=abs(Qb(2)-Qa(2)); %Inputs for time.m
    dq3=abs(Qb(3)-Qa(3)); %Inputs for time.m
    dq4=abs(Qb(4)-Qa(4)); %Inputs for time.m
    tf=time(dq1,dq2,dq3,dq4);
    
    Q1_T=traj(Qa(1),Qb(1),tf);
    Q2_T=traj(Qa(2),Qb(2),tf);
    Q3_T=traj(Qa(3),Qb(3),tf);
    Q4_T=traj(Qa(4),Qb(4),tf);
    ORBITS=[Q1_T(:,1),Q1_T(:,2),Q2_T(:,2),Q3_T(:,2),Q4_T(:,2)];

    scarafk(ORBITS)

else
  error('Wrong amount of arguments!')
end