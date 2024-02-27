function moveq3(q3_mov)
%Συνάρτηση η οποία μετακινεί την άρθρωση q3 στην τιμή που λέει το όρισμα 
%q3_mov, κατά το πλαίσιο αξόνων {0} (world), και κρατάει σταθερές
%τις υπόλοιπες.

global CURRENT_Q
global sel

if sel == 1  
    error('This function cannot be used in FLAT-2-LINKS Robotic Arm!')   
elseif sel == 2
    moveq(CURRENT_Q(1),CURRENT_Q(2),q3_mov)    
elseif sel == 3
    moveq(CURRENT_Q(1),CURRENT_Q(2),q3_mov,CURRENT_Q(4))    
end