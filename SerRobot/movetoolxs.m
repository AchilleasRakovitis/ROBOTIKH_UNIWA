function movetoolxs(tx_mov)
% -> movetoolxs(tx_mov)
%Συνάρτηση κίνησης, ΣΕ ΕΥΘΕΙΑ ΤΡΟΧΙΑ, κατά τον άξονα Χ της αρπάγης
%Όρισμα 1: (tx_mov) -> απόσταση κατά x-axis (current)


global CURRENT_Q
global ORBITS
global sel

if sel == 1 % -> F2L
    
    theta1=CURRENT_Q(1)*pi/180;
    theta2=CURRENT_Q(2)*pi/180;

    l1=4;
    l2=4;

    g01=[cos(theta1) -sin(theta1) 0   0;
         sin(theta1)  cos(theta1) 0   0;
         0              0         1   0;
         0              0         0   1];

    g12=[cos(theta2) -sin(theta2) 0 l1;
         sin(theta2)  cos(theta2) 0 0;
         0                0       1 0;
         0                0       0 1];

    g2e=[1 0 0 l2;
         0 1 0 0;
         0 0 1 0;
         0 0 0 1];

    g0e=g01*g12*g2e;
    gnew=[1 0 0 tx_mov;
          0 1 0   0;
          0 0 1   0;
          0 0 0   1];

    %Πολλαπλασιασμός από δεξιά (current)
    G=g0e*gnew;
    xd=G(1,4); %Συντεταγμένες
    yd=G(2,4); %νέου σημείου

    Qalpha=[CURRENT_Q(1),CURRENT_Q(2)];
    Qbeta=inv_kin_2l(xd,yd);
    
    dq1=abs(Qbeta(1)-Qalpha(1)); %Inputs for time.m
    dq2=abs(Qbeta(2)-Qalpha(2)); %Inputs for time.m
    tf=time(dq1,dq2);
    
    dx=abs(G(1,4)-g0e(1,4));
    dy=abs(G(2,4)-g0e(2,4));

    if dx>dy

        h=traj(g0e(1,4),xd,tf);
        x=h(:,2);
        t=h(:,1);

        lamda=(yd-g0e(2,4))/(xd-g0e(1,4));
        y=lamda*(x-g0e(1,4))+g0e(2,4);


        for i=1:length(x)

            Qa=inv_kin_2l_straight(x(i),y(i));
            lq1(i)=Qa(1);
            lq2(i)=Qa(2);

        end

    else %dx<dy

        h=traj(g0e(2,4),yd,tf);
        y=h(:,2);
        t=h(:,1);

        lamda=(xd-g0e(1,4))/(yd-g0e(2,4));
        x=lamda*(y-g0e(2,4))+g0e(1,4);


        for i=1:length(y)

            Qa=inv_kin_2l_straight(x(i),y(i));
            lq1(i)=Qa(1);
            lq2(i)=Qa(2);

        end

    end %IF

    ORBITS=[t lq1' lq2'];

    f2fk(ORBITS)
    
elseif sel == 2 % -> F3L
    
    theta1=CURRENT_Q(1)*pi/180;
    theta2=CURRENT_Q(2)*pi/180;
    theta3=CURRENT_Q(3)*pi/180;

    l1=4;
    l2=4;
    l3=4;

    g01=[cos(theta1) -sin(theta1) 0   0;
         sin(theta1)  cos(theta1) 0   0;
         0              0         1   0;
         0              0         0   1];

    g12=[cos(theta2) -sin(theta2) 0 l1;
         sin(theta2)  cos(theta2) 0 0;
         0                0       1 0;
         0                0       0 1];

    g23=[cos(theta3) -sin(theta3) 0 l2;
         sin(theta3)  cos(theta3) 0 0;
         0                0       1 0;
         0                0       0 1];
     
    g3e=[1 0 0 l3;
         0 1 0 0;
         0 0 1 0;
         0 0 0 1];

    g0e=g01*g12*g23*g3e;
    gnew=[1 0 0 tx_mov;
          0 1 0 0;
          0 0 1 0;
          0 0 0 1];

    %Πολλαπλασιασμός από δεξιά (current)
    G=g0e*gnew;
    xd=G(1,4); %Συντεταγμένες
    yd=G(2,4); %νέου σημείου

    Qalpha=[CURRENT_Q(1),CURRENT_Q(2),CURRENT_Q(3)];
    fd_current=CURRENT_Q(1)+CURRENT_Q(2)+CURRENT_Q(3);
    Qbeta=inv_kin_3l(xd,yd,fd_current);
    
    dq1=abs(Qbeta(1)-Qalpha(1)); %Inputs for time.m
    dq2=abs(Qbeta(2)-Qalpha(2)); %Inputs for time.m
    dq3=abs(Qbeta(3)-Qalpha(3)); %Inputs for time.m
    tf=time(dq1,dq2,dq3);
    
    dx=abs(G(1,4)-g0e(1,4));
    dy=abs(G(2,4)-g0e(2,4));

    if dx>dy

        h=traj(g0e(1,4),xd,tf);
        x=h(:,2);
        t=h(:,1);

        lamda=(yd-g0e(2,4))/(xd-g0e(1,4));
        y=lamda*(x-g0e(1,4))+g0e(2,4);


        for i=1:length(x)

            Qa=inv_kin_3l_straight(x(i),y(i));
            lq1(i)=Qa(1);
            lq2(i)=Qa(2);
            lq3(i)=Qa(3);

        end

    else %dx<dy

        h=traj(g0e(2,4),yd,tf);
        y=h(:,2);
        t=h(:,1);

        lamda=(xd-g0e(1,4))/(yd-g0e(2,4));
        x=lamda*(y-g0e(2,4))+g0e(1,4);


        for i=1:length(y)

            Qa=inv_kin_3l_straight(x(i),y(i));
            lq1(i)=Qa(1);
            lq2(i)=Qa(2);
            lq3(i)=Qa(3);

        end

    end %IF

    ORBITS=[t lq1' lq2' lq3'];

    f3fk(ORBITS)
    
elseif sel == 3 % -> SCARA
    
    theta1=CURRENT_Q(1)*pi/180;
    theta2=CURRENT_Q(2)*pi/180;
    d3=CURRENT_Q(3);
    theta4=CURRENT_Q(4)*pi/180;   
    
    l1=2.25;
    l2=1.25;
    ltool=0.35; %Μήκος αρπάγης

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
    gnew=[1 0 0 tx_mov;
          0 1 0   0;
          0 0 1   0;
          0 0 0   1];

    %Πολλαπλασιασμός από δεξιά (current)
    G=g*gnew;
    xd=G(1,4); %Συντεταγμένες
    yd=G(2,4); %νέου σημείου

    Qalpha=[CURRENT_Q(1),CURRENT_Q(2),CURRENT_Q(3),CURRENT_Q(4)];
    fd_current=CURRENT_Q(1)+CURRENT_Q(2)+CURRENT_Q(4);
    
    Qbeta=inv_kin_scara(xd,yd,d3-ltool,fd_current);
    
    dq1=abs(Qbeta(1)-Qalpha(1)); %Inputs for time.m
    dq2=abs(Qbeta(2)-Qalpha(2)); %Inputs for time.m
    dq3=0; %Inputs for time.m
    dq4=abs(Qbeta(4)-Qalpha(4)); %Inputs for time.m
    tf=time(dq1,dq2,dq3,dq4);
    
    dx=abs(G(1,4)-g(1,4));
    dy=abs(G(2,4)-g(2,4));

    if dx>dy

        h=traj(g(1,4),xd,tf);
        x=h(:,2);
        t=h(:,1);

        lamda=(yd-g(2,4))/(xd-g(1,4));
        y=lamda*(x-g(1,4))+g(2,4);


        for i=1:length(x)

            Qa=inv_kin_scara_straight(x(i),y(i),fd_current);
            lq1(i)=Qa(1);
            lq2(i)=Qa(2);
            lq4(i)=Qa(3);

        end

    else %dx<dy

        h=traj(g(2,4),yd,tf);
        y=h(:,2);
        t=h(:,1);

        lamda=(xd-g(1,4))/(yd-g(2,4));
        x=lamda*(y-g(2,4))+g(1,4);


        for i=1:length(y)

            Qa=inv_kin_scara_straight(x(i),y(i),fd_current);
            lq1(i)=Qa(1); %q1
            lq2(i)=Qa(2); %q2
            lq4(i)=Qa(3); %q4

        end

    end %IF
    
    s=size(lq1);
    for j=1:s(2)
        lq3(j)=CURRENT_Q(3);
    end
    
    ORBITS=[t lq1' lq2' lq3' lq4'];

    scarafk(ORBITS)
    
else 
    error('There was an error reading CURRENT_Q data. Please run -robsim- again...')
end % MAIN IF