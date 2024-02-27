function moveq4(q4_mov)
%Συνάρτηση η οποία μετακινεί την άρθρωση q4 στην τιμή που λέει το όρισμα 
%q4_mov, κατά το πλαίσιο αξόνων {0} (world), και κρατάει σταθερές
%τις υπόλοιπες.

global CURRENT_Q
global sel

if sel ~= 3
    error('This function can be used only in SCARA Robotic Arm!')
else
    moveq(CURRENT_Q(1),CURRENT_Q(2),CURRENT_Q(3),q4_mov)
end