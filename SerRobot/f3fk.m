function f3fk(orbits)
%DRAW FUNCTION
%Inputs: orbits[Q1_T,Q2_T,Q3_T]

global GRASP
global CURRENT_Q

Q1_T=[orbits(:,1),orbits(:,2)];
Q2_T=[orbits(:,1),orbits(:,3)];
Q3_T=[orbits(:,1),orbits(:,4)];

l1=4;
l2=4;
l3=4;

q1=Q1_T(:,2)*pi/180; %DEG2RAD
q2=Q2_T(:,2)*pi/180;
q3=Q3_T(:,2)*pi/180;
T=Q1_T(:,1);

h.world = vrworld('3links.wrl');
open(h.world)
h.J1=vrnode(h.world,'TJoint1');
h.J2=vrnode(h.world,'TJoint2');
h.J3=vrnode(h.world,'TJoint3');

    Qa=[q1(1) q2(1) q3(1)]*180/pi;
    s1=size(q1); %s1=[rows columns]->q1
    s2=size(q2); %s2=[rows columns]->q2
    s3=size(q3); %s3=[rows columns]->q3
    Qb=[q1(s1(1)) q2(s2(1)) q3(s3(1))]*180/pi; %�� ��������� �������� ��� q1,q2,q3

    % Y Axis limits for Q1
    if Qa(1)<Qb(1)
        q1_yaxis_min=Qa(1)-1;
        q1_yaxis_max=Qb(1)+1;
    else
        q1_yaxis_max=Qa(1)+1;
        q1_yaxis_min=Qb(1)-1;
    end

    % Y Axis limits for Q2
    if Qa(2)<Qb(2)
        q2_yaxis_min=Qa(2)-1;
        q2_yaxis_max=Qb(2)+1;
    else
        q2_yaxis_max=Qa(2)+1;
        q2_yaxis_min=Qb(2)-1;
    end

    % Y Axis limits for Q2
    if Qa(3)<Qb(3)
        q3_yaxis_min=Qa(3)-1;
        q3_yaxis_max=Qb(3)+1;
    else
        q3_yaxis_max=Qa(3)+1;
        q3_yaxis_min=Qb(3)-1;
    end
    
tic %start timing
    
while toc<T(end)
    a=toc;
    %-----------------------------------
    % DRAW code
    for i=1:length(T)
        
        if T(i)>a
            h.J1.rotation=[0 0 1 q1(i)];
            h.J2.rotation=[0 0 1 q2(i)];
            h.J3.rotation=[0 0 1 q3(i)];
            %-------------------------------
            %������ ������� ���� ���� ������
            xi1=cos(q1(i))*l1;
            psi1=sin(q1(i))*l1;
            psi2=l2*sin(q1(i)+q2(i))+psi1;
            xi2=l2*cos(q1(i)+q2(i))+xi1;
            psi3=l3*sin(q1(i)+q2(i)+q3(i))+psi2;
            xi3=l3*cos(q1(i)+q2(i)+q3(i))+xi2;
            if GRASP == 1
                h.T1.translation=[xi3 psi3 0];
            end
            %-------------------------------
            cc1=q1(i);
            cc2=q2(i);
            cc3=q3(i);
            break;
        end
    %-----------------------------------    
    end
       
    pause(0.0001)
    
    t=orbits(end,1);
    
    vrdrawnow
end %end of while

CURRENT_Q=[Q1_T(end,2),Q2_T(end,2),Q3_T(end,2)];