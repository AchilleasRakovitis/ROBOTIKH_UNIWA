function here(alpha)

global CURRENT_Q
global here_STACK
global here_STACK_POINTER
global here_Q
global sel

if alpha == 0
    here_STACK=[];
    here_STACK_POINTER=0;
    here_Q=[];
    return
end

here_STACK_POINTER=here_STACK_POINTER+1; %Δείκτης τρέχουσας θέσης του stack
here_STACK(here_STACK_POINTER)=alpha;    %Εισαγωγή του ορίσματος (όνομα θέσης) στην τρέχουσα θέση του stack
here_STACK=char(here_STACK);             %Μετατροπή του ορίσματος σε char

% Επιλογή του κατάλληλου βραχίονα και συμπλήρωση του stack
if sel == 1 % -> F2L
    
    here_Q(here_STACK_POINTER,1)=CURRENT_Q(1);
    here_Q(here_STACK_POINTER,2)=CURRENT_Q(2);

elseif sel == 2 % -> F3L
    
    here_Q(here_STACK_POINTER,1)=CURRENT_Q(1);
    here_Q(here_STACK_POINTER,2)=CURRENT_Q(2);
    here_Q(here_STACK_POINTER,3)=CURRENT_Q(3);
    
elseif sel == 3 % -> SCARA
    
    here_Q(here_STACK_POINTER,1)=CURRENT_Q(1);
    here_Q(here_STACK_POINTER,2)=CURRENT_Q(2);
    here_Q(here_STACK_POINTER,3)=CURRENT_Q(3);
    here_Q(here_STACK_POINTER,4)=CURRENT_Q(4);
    
else
    error('There was an error in reading CURRENT_Q data! Please run robsim again...')
end