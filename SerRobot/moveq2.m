function moveq2(q2_mov)
%Συνάρτηση η οποία μετακινεί την άρθρωση q2 στην τιμή που λέει το όρισμα 
%q2_mov, κατά το πλαίσιο αξόνων {0} (world), και κρατάει σταθερές
%τις υπόλοιπες.

global CURRENT_Q
global sel

if sel == 1
    
    moveq(CURRENT_Q(1),q2_mov)
    
elseif sel == 2
    
    moveq(CURRENT_Q(1),q2_mov,CURRENT_Q(3))
    
elseif sel == 3
    
    moveq(CURRENT_Q(1),q2_mov,CURRENT_Q(3),CURRENT_Q(4))
    
end