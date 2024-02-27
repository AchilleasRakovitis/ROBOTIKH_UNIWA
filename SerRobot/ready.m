%Συνάρτηση μετακίνησης του ενεργοποιημένου βραχίονα στο αρχικό του σημείο,
%με γωνίες q1=q2=0 για τον FLAT-2-LINKS & q1=q2=q3=0 για τον FLAT-3-LINKS
%ΔΕΝ ΠΑΙΡΝΕΙ ΟΡΙΣΜΑΤΑ
global CURRENT_Q
global GRASP
global ORBITS

qs=size(CURRENT_Q);
if qs(2) == 2 %Αν οι στήλες του qs είναι 2 -> FLAT-2-LINKS
    movew(8,0);
    CURRENT_Q=[0 0];
elseif qs(2) == 3 %Αν οι στήλες του qs είναι 3 -> FLAT-3-LINKS
    movew(12,0,0);
    CURRENT_Q=[0 0 0];
elseif qs(2) == 4 %Αν οι στήλες του qs είναι 4 -> SCARA
    movew(3.5,0,0,0);
    CURRENT_Q=[0 0 0 0];
else
    error('No Robotic Arm activated!')
end