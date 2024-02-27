function movetools(xd_given,yd_given)
%Συνάρτηση υπολογισμού και σχεδιασμού τροχιάς, από το current point,
%στο (xd,yd), του ίδιου επιπέδου, με ευθεία διαδρομή

global CURRENT_Q
global ORBITS
global sel

if sel == 1 %F2L activated

    O=f_kine2l(CURRENT_Q(1),CURRENT_Q(2));
    xa=O(1);
    ya=O(2);

    target_point=g0e*[xd_given yd_given 0 1]';
    xd=target_point(1,1);
    yd=target_point(2,1);
    
    x=linspace(xa,xd,3);
    
    for i=1:length(x)
        y=[(yd-ya)*(x-xa)/(xd-xa)]+ya;
    end
        
    g=g0e;
    
    Qalpha=[CURRENT_Q(1),CURRENT_Q(2)];
    Qbeta=inv_kin_2l(xd,yd);

    dq1=abs(Qbeta(1)-Qalpha(1)); %Inputs for time.m
    dq2=abs(Qbeta(2)-Qalpha(2)); %Inputs for time.m
    tf=time(dq1,dq2);
    
    dx=abs(xa-xd);
    dy=abs(y(1)-y(end));
    
    if dx>dy

        h=traj(g(1,4),xd,tf);
        x=h(:,2);
        t=h(:,1);

        lamda=(yd-g(2,4))/(xd-g(1,4));
        y=lamda*(x-g(1,4))+g(2,4);

        for i=1:length(x)

            Qa=inv_kin_2l_straight(x(i),y(i));
            lq1(i)=Qa(1); %q1
            lq2(i)=Qa(2); %q2

        end

    else %dx<dy
        
        h=traj(g(2,4),yd,tf);
        y=h(:,2);
        t=h(:,1);

        lamda=(xd-g(1,4))/(yd-g(2,4));
        x=lamda*(y-g(2,4))+g(1,4);


        for i=1:length(y)

            Qa=inv_kin_2l_straight(x(i),y(i));
            lq1(i)=Qa(1); %q1
            lq2(i)=Qa(2); %q2

        end

    end %IF (dx~dy)

    ORBITS=[t lq1' lq2'];

    f2fk(ORBITS)

elseif sel == 2 %F3L activated
        
    O=f_kine3l(CURRENT_Q(1),CURRENT_Q(2),CURRENT_Q(3));
    fd=CURRENT_Q(1)+CURRENT_Q(2)+CURRENT_Q(3);
    xa=O(1);
    ya=O(2);
    
    target_point=g0e*[xd_given yd_given 0 1]'
    xd=target_point(1,1);
    yd=target_point(2,1);
    
    x=linspace(xa,xd,3);
    
    for i=1:length(x)
        y=[(yd-ya)*(x-xa)/(xd-xa)]+ya;
    end
        
    g=g0e;
    
    Qalpha=[CURRENT_Q(1),CURRENT_Q(2),CURRENT_Q(3)];
    Qbeta=inv_kin_3l(xd,yd,fd);

    dq1=abs(Qbeta(1)-Qalpha(1)); %Inputs for time.m
    dq2=abs(Qbeta(2)-Qalpha(2)); %Inputs for time.m
    dq3=abs(Qbeta(3)-Qalpha(3)); %Inputs for time.m
    tf=time(dq1,dq2,dq3);
    
    dx=abs(xa-xd);
    dy=abs(y(1)-y(end));
    
    if dx>dy

        h=traj(g(1,4),xd,tf);
        x=h(:,2);
        t=h(:,1);

        lamda=(yd-g(2,4))/(xd-g(1,4));
        y=lamda*(x-g(1,4))+g(2,4);

        for i=1:length(x)

            Qa=inv_kin_3l_straight(x(i),y(i));
            lq1(i)=Qa(1); %q1
            lq2(i)=Qa(2); %q2
            lq3(i)=Qa(3); %q3

        end

    else %dx<dy
        
        h=traj(g(2,4),yd,tf);
        y=h(:,2);
        t=h(:,1);

        lamda=(xd-g(1,4))/(yd-g(2,4));
        x=lamda*(y-g(2,4))+g(1,4);


        for i=1:length(y)

            Qa=inv_kin_3l_straight(x(i),y(i));
            lq1(i)=Qa(1); %q1
            lq2(i)=Qa(2); %q2
            lq3(i)=Qa(3); %q3

        end

    end %IF (dx~dy)

    ORBITS=[t lq1' lq2' lq3'];

    f3fk(ORBITS)

elseif sel == 3 %SCARA activated
    
    O=f_kinescara(CURRENT_Q(1),CURRENT_Q(2),CURRENT_Q(3),CURRENT_Q(4));
    xa=O(1);
    ya=O(2);
    fd=CURRENT_Q(1)+CURRENT_Q(2)+CURRENT_Q(4);
    
    target_point=g0e*[xd_given yd_given CURRENT_Q(3) 1]';
    xd=target_point(1,1);
    yd=target_point(2,1);
    
    x=linspace(xa,xd,3);
    
    for i=1:length(x)
        y=[(yd-ya)*(x-xa)/(xd-xa)]+ya;
    end
        
    g=g0e;
    
    Qalpha=[CURRENT_Q(1),CURRENT_Q(2),CURRENT_Q(3),CURRENT_Q(4)];
    Qbeta=inv_kin_scara(xd,yd,CURRENT_Q(3),fd);

    dq1=abs(Qbeta(1)-Qalpha(1)); %Inputs for time.m
    dq2=abs(Qbeta(2)-Qalpha(2)); %Inputs for time.m
    dq3=abs(Qbeta(3)-Qalpha(3)); %Inputs for time.m
    dq4=abs(Qbeta(4)-Qalpha(4)); %Inputs for time.m
    tf=time(dq1,dq2,dq3,dq4);
    
    dx=abs(xa-xd);
    dy=abs(y(1)-y(end));
    
    if dx>dy

        h=traj(g(1,4),xd,tf);
        x=h(:,2);
        t=h(:,1);

        lamda=(yd-g(2,4))/(xd-g(1,4));
        y=lamda*(x-g(1,4))+g(2,4);

        for i=1:length(x)

            Qa=inv_kin_scara_straight(x(i),y(i),fd);
            lq1(i)=Qa(1); %q1
            lq2(i)=Qa(2); %q2
            lq4(i)=Qa(3); %q4

        end

    else %dx<dy
        
        h=traj(g(2,4),yd,tf);
        y=h(:,2);
        t=h(:,1);

        lamda=(xd-g(1,4))/(yd-g(2,4));
        x=lamda*(y-g(2,4))+g(1,4);


        for i=1:length(y)

            Qa=inv_kin_scara_straight(x(i),y(i),fd);
            lq1(i)=Qa(1); %q1
            lq2(i)=Qa(2); %q2
            lq4(i)=Qa(3); %q4

        end

    end %IF (dx~dy)

    s=size(lq1);
    for j=1:s(2)
        lq3(j)=CURRENT_Q(3);
    end
    
    ORBITS=[t lq1' lq2' lq3' lq4'];

    scarafk(ORBITS)

else
    error('Cannot handle CURRENT_Q data...Please close "MATLAB", reopen it, and run "robsim" again')
end