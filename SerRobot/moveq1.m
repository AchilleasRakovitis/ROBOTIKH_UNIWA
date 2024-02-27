function moveq1(q1_mov)
%Συνάρτηση η οποία μετακινεί την άρθρωση q1 στην τιμή που λέει το όρισμα 
%q1_mov, κατά το πλαίσιο αξόνων {0} (world), και κρατάει σταθερές
%τις υπόλοιπες.

global CURRENT_Q
global sel

if sel == 1
    
    moveq(q1_mov,CURRENT_Q(2))
    
elseif sel == 2
    
    moveq(q1_mov,CURRENT_Q(2),CURRENT_Q(3))
    
elseif sel == 3
    
    moveq(q1_mov,CURRENT_Q(2),CURRENT_Q(3),CURRENT_Q(4))
    
end