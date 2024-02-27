function movew(xd,yd,zf,fd)
%ΥΠΟΛΟΓΙΣΤΙΚΗ ΚΑΙ ΣΧΕΔΙΑΣΤΙΚΗ ΣΥΝΑΡΤΗΣΗ
%
% Η movew είναι υπολογιστική και σχεδιαστική συνάρτηση, η οποία λειτουργεί βάση του αδρανειακού πλαισίου {0}.
% Μπορεί να χρησιμοποιηθεί για 3 Ρομποτικούς Βραχίονες:
% 
% -> movew('x')
% Ενεργοποίηση του κατάλληλου βραχίονα. Εφόσον έχει αποθηκευτεί μια θέση
% του βραχίονα με ένα όνομα πχ. 'a', η movew('a') θα χρησιμοποιηθεί για να
% κινήσει τον βραχίονα στη θέση 'a', αλλιώς θα ειδοποιήσει το χρήστη με
% μήνυμα ότι το stack είναι άδειο.
% 
% 
% 1: Για τον βραχίονα FLAT 2 LINKS
% --------------------------------
% Με 2 τρόπους:
% 
% A) -> movew(xd,yd)
% 
% Ενεργοποίηση του Επίπεδου Ρομποτικού Βραχίονα FLAT 2 LINKS. 
% Το όρισμα της συνάρτησης αφορά τις συντεταγμένες του σημείου στόχου, στο οποίο θέλουμε να μεταβεί ο
% βραχίονας.
% 
% B) -> movew
% Ενεργοποίηση του Βραχίονα FLAT 2 LINKS. Το σημείο στόχος εισάγεται
% μέσα από ginput.
% 
% 
% 2: Για τον βραχίονα FLAT 3 LINKS
% --------------------------------
% -> movew(xd,yd,fd)
% 
% Ενεργοποίηση του Επίπεδου Ρομποτικού Βραχίονα FLAT 3 LINKS.
% Το 3ο όρισμα αφορά τον προσανατολισμό fd του άκρου του βραχίονα, εκφρασμένο σε Μοίρες.
% 
% 
% 3: Για τον βραχίονα SCARA
% --------------------------------
% -> movew(xd,yd,zd,fd)
% 
% Ενεργοποίηση του Ρομποτικού Βραχίονα SCARA, και μετάβαση της αρπάγης στο
% σημείο με συντεταγμένες (xd,yd,zd), του πλαισίου {0}. Το fd (εκφρασμένο σε μοίρες) εκφράζει
% τον προσανατολισμό της αρπάγης.

global CURRENT_Q
global ORBITS
global here_STACK
global here_STACK_POINTER
global here_Q
global sel
global TRAJ_MODE
global tb

if nargin == 0 % A->ginput
    
    if sel == 1 %FLAT 2 LINKS
    
        set(0,'Units','pixels')
        scnsize = get(0,'ScreenSize');
        pos1  = [scnsize(3)/2+5,...
            scnsize(4)/3 + 5,...
            scnsize(3)/2.2 - 2*5,...
            scnsize(4)/1.8-10];
        figure('Position',pos1)
        hold on

        axis([-8 8 -8 8])
        x=-8:0.1:8;
        r=8;
        y1=sqrt(r.^2-x.^2);
        y2=-sqrt(r.^2-x.^2);
        plot(x,y1)
        grid on
        hold on
        plot(x,y2)
        plot(0,0,'d')
        hold on
        %new code
        cur=f_kine2l(CURRENT_Q(1),CURRENT_Q(2));
        plot(cur(1),cur(2),'x','LineWidth',2,'Color',[0 1 0])
        hold on
        %new code
        POINTS=ginput;
        plot(POINTS(1,1),POINTS(1,2),'r*')
        hold on
        grid on
        axis([-8 8 -8 8])
        pause

        % Έλεγχος χώρου εργασίας
        x_check=POINTS(1,1);y_check=POINTS(1,2);
        r_check=sqrt(x_check^2 + y_check^2);
        if r < r_check
            error('Error! Target point is out of bounds')
        end

        Qa=[CURRENT_Q(1),CURRENT_Q(2)];
        Qb=inv_kin_2l(POINTS(1,1),POINTS(1,2));

        dq1=abs(Qb(1)-Qa(1)); %Inputs for time.m
        dq2=abs(Qb(2)-Qa(2)); %Inputs for time.m
        tf=time(dq1,dq2);

        Q1_T=traj(Qa(1),Qb(1),tf);
        Q2_T=traj(Qa(2),Qb(2),tf);

        ORBITS=[Q1_T,Q2_T(:,2)];
        f2fk(ORBITS)

        szq1=size(Q1_T);
        new_q1=Q1_T(szq1(1),2);

        szq2=size(Q2_T);
        new_q2=Q2_T(szq2(1),2);

        CURRENT_Q=[new_q1 new_q2];
        
    elseif sel == 2 %FLAT 3 LINKS
        
        fd=input('Enter the orientation fd: ');
        set(0,'Units','pixels')
        scnsize = get(0,'ScreenSize');
        pos1  = [scnsize(3)/2+5,...
            scnsize(4)/3 + 5,...
            scnsize(3)/2.2 - 2*5,...
            scnsize(4)/1.8-10];
        figure('Position',pos1)
        hold on

        axis([-12 12 -12 12])
        x=-12:0.1:12;
        r=12;
        y1=sqrt(r.^2-x.^2);
        y2=-sqrt(r.^2-x.^2);
        plot(x,y1)
        grid on
        hold on
        plot(x,y2)
        plot(0,0,'d')
        hold on
        cur=f_kine3l(CURRENT_Q(1),CURRENT_Q(2),CURRENT_Q(3));
        plot(cur(1),cur(2),'x','LineWidth',2,'Color',[0 1 0])
        hold on
        POINTS=ginput;
        plot(POINTS(1,1),POINTS(1,2),'r*')
        hold on
        grid on
        axis([-12 12 -12 12])
        pause

        % Έλεγχος χώρου εργασίας
        x_check=POINTS(1,1);y_check=POINTS(1,2);
        r_check=sqrt(x_check^2 + y_check^2);
        if r < r_check
            error('Error! Target point is out of bounds')
        end

        Qa=[CURRENT_Q(1),CURRENT_Q(2),CURRENT_Q(3)];
        Qb=inv_kin_3l(POINTS(1,1),POINTS(1,2),fd);

        dq1=abs(Qb(1)-Qa(1)); %Inputs for time.m
        dq2=abs(Qb(2)-Qa(2)); %Inputs for time.m
        dq3=abs(Qb(3)-Qa(3)); %Inputs for time.m
        tf=time(dq1,dq2,dq3);

        Q1_T=traj(Qa(1),Qb(1),tf);
        Q2_T=traj(Qa(2),Qb(2),tf);
        Q3_T=traj(Qa(3),Qb(3),tf);

        ORBITS=[Q1_T,Q2_T(:,2),Q3_T(:,2)];
        f3fk(ORBITS)

        new_q1=Q1_T(end,2);
        new_q2=Q2_T(end,2);
        new_q3=Q3_T(end,2);

        CURRENT_Q=[new_q1 new_q2 new_q3];
        
    elseif sel == 3 % SCARA
        
        %Figure position on screen
        set(0,'Units','pixels')
        scnsize = get(0,'ScreenSize');
        pos1  = [scnsize(3)-scnsize(3)/3-10,...
            scnsize(4)/3 + 5,...
            scnsize(3)/3,...
            scnsize(4)/2];
        figure('Position',pos1)
        hold on

        x=0:0.1:3.5;
        r=3.5;
        y1=sqrt(r.^2-(x+0.7).^2)+3;
        y2=-sqrt(r.^2-(x+0.7).^2)+3;
        plot(x,y1)
        grid on
        hold on
        plot(x,y2)
        hold on


        axis equal
        axis([0 3.5 0 6])
        grid on
        hold on


        cur_position=where('t');
        plot(cur_position(1),cur_position(2),'x','LineWidth',2,'Color',[0 0 1])
        hold on

        POINTS=ginput;
        plot(POINTS(1,1),POINTS(1,2),'r*')
        hold on

        movetable(POINTS(1,1),POINTS(1,2),1.2+CURRENT_Q(3),0)

        hold on
        
    end% end of IF-sel
     
elseif nargin == 1
    %Μετακίνηση σε σημείο που έχει ήδη αποθηκευτεί στο stack
        
    if here_STACK_POINTER == 0 % Έλεγχος αν το stack είναι άδειο
        error('Stuck is empty!')
    end
    
    %Προσπέλαση των στοιχείων του stack    
    for j=1:here_STACK_POINTER
        if here_STACK(j)==xd
            break
        end
    end
    
    if sel == 1 % Κώδικας για FLAT 2 LINKS
        moveq(here_Q(j,1),here_Q(j,2))
        CURRENT_Q=[here_Q(j,1) here_Q(j,2)];
    elseif  sel == 2 % Κώδικας για FLAT 3 LINKS
        moveq(here_Q(j,1),here_Q(j,2),here_Q(j,3))
        CURRENT_Q=[here_Q(j,1) here_Q(j,2) here_Q(j,3)];
    elseif  sel == 3 % Κώδικας για SCARA
        moveq(here_Q(j,1),here_Q(j,2),here_Q(j,3),here_Q(j,4))
        CURRENT_Q=[here_Q(j,1) here_Q(j,2) here_Q(j,3) here_Q(j,4)];
    end
        
elseif nargin == 2 % (xd,yd) -> FLAT 2 LINKS
    
    if sel ~= 1 %Check if movew inputs are correct
        disp('The inputs entered in movew function, are for robotic arm "FLAT 2 LINKS"!')
        disp('FLAT 2 LINKS robotic arm is not activated!')
        error('Runtime error during calling movew function...')
    end
    
    r=8.001;
    x_check=xd;y_check=yd;
    r_check=sqrt(x_check^2 + y_check^2);
    if r < r_check
        error('Error! Target point is out of bounds')
    end
     
    Qa=[CURRENT_Q(1),CURRENT_Q(2)]; %q1,q2 σε Μοίρες
    Qb=inv_kin_2l(xd,yd);

    dq1=abs(Qb(1)-Qa(1)); %Inputs for time.m
    dq2=abs(Qb(2)-Qa(2)); %Inputs for time.m
    tf=time(dq1,dq2);
    
    Q1_T=traj(Qa(1),Qb(1),tf);
    Q2_T=traj(Qa(2),Qb(2),tf);
    
    ORBITS=[Q1_T(:,1),Q1_T(:,2),Q2_T(:,2)];
    f2fk(ORBITS) % ΣΧΕΔΙΑΣΜΟΣ ΤΡΟΧΙΑΣ
    %Το Q1_T είναι σε μορφή [t q], οπότε για να βρούμε το νέο q1
    %αρκεί να βρούμε το τελευταίο στοιχείο της 2ης στήλης του Q1_T
    szq1=size(Q1_T);
    new_q1=Q1_T(szq1(1),2);

    szq2=size(Q2_T);
    new_q2=Q2_T(szq2(1),2);

    CURRENT_Q=[new_q1 new_q2];
       
elseif nargin == 3 % (xd,yd,fd) -> FLAT 3 LINKS
    
    if sel ~= 2 %Check if movew inputs are correct
        disp('The inputs entered in movew function, are for robotic arm "FLAT 3 LINKS"!')
        disp('FLAT 3 LINKS robotic arm is not activated!')
        error('Runtime error during calling movew function...')
    end
    
    fd=zf;
    r=12;
    x_check=xd;y_check=yd;
    r_check=sqrt(x_check^2 + y_check^2);
    if r < r_check
        error('Error! Target point is out of bounds')
    end
    
    Qa=[CURRENT_Q(1),CURRENT_Q(2),CURRENT_Q(3)]; %q1,q2,q3 σε Μοίρες
    Qb=inv_kin_3l(xd,yd,fd);
    
    dq1=abs(Qb(1)-Qa(1)); %Inputs for time.m
    dq2=abs(Qb(2)-Qa(2)); %Inputs for time.m
    dq3=abs(Qb(3)-Qa(3)); %Inputs for time.m
    tf=time(dq1,dq2,dq3);
    
    Q1_T=traj(Qa(1),Qb(1),tf);
    Q2_T=traj(Qa(2),Qb(2),tf);
    Q3_T=traj(Qa(3),Qb(3),tf);
    
    ORBITS=[Q1_T(:,1),Q1_T(:,2),Q2_T(:,2),Q3_T(:,2)];
    f3fk(ORBITS)
    
    szq1=size(Q1_T);
    new_q1=Q1_T(szq1(1),2);
    
    szq2=size(Q2_T);
    new_q2=Q2_T(szq2(1),2);     
    
    szq3=size(Q3_T);
    new_q3=Q3_T(szq3(1),2);
    
    CURRENT_Q=[new_q1 new_q2 new_q3];
    
elseif nargin == 4 % (xd,yd,zd,fd) -> SCARA
    
    if sel ~= 3 %Check if movew inputs are correct
        disp('The inputs entered in movew function, are for robotic arm "SCARA"!')
        disp('SCARA robotic arm is not activated!')
        error('Runtime error during calling movew function...')
    end
    
    zd=zf-0.35;
    r=3.5;
    x_check=xd;y_check=yd;
    r_check=sqrt(x_check^2 + y_check^2);
    if r < r_check
        error('Error! Target point is out of bounds')
    end
    
    Qa=[CURRENT_Q(1),CURRENT_Q(2),CURRENT_Q(3),CURRENT_Q(4)]; %q1,q2 σε Μοίρες
    Qb=inv_kin_scara(xd,yd,zd,fd);

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
    scarafk(ORBITS) % ΣΧΕΔΙΑΣΜΟΣ ΤΡΟΧΙΑΣ
    %Το Q1_T είναι σε μορφή [t q], οπότε για να βρούμε το νέο q1
    %αρκεί να βρούμε το τελευταίο στοιχείο της 2ης στήλης του Q1_T
    szq1=size(Q1_T);
    new_q1=Q1_T(szq1(1),2);

    szq2=size(Q2_T);
    new_q2=Q2_T(szq2(1),2);

    szq3=size(Q3_T);
    new_q3=Q3_T(szq3(1),2);

    szq4=size(Q4_T);
    new_q4=Q4_T(szq4(1),2);
    
    CURRENT_Q=[new_q1 new_q2 new_q3 new_q4];
    
end