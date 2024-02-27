function q=inv_kin_3l_straight(xd,yd)
%Τροποποιημένη έκδοση του inv_kin_3l.
%Η συνάρτηση χρησιμοποιείται μόνο σε υπολογισμό ευθείας τροχιάς, και
%ειδικός σκοπός της είναι να διατηρεί σταθερό τον προσανατολισμό του αγκώνα
%του βραχίονα, κατά τη διάρκεια της ευθείας κίνησης.

global CURRENT_Q

fd_deg=CURRENT_Q(1)+CURRENT_Q(2)+CURRENT_Q(3);
fd=(fd_deg*pi)/180;
l1=4;
l2=4;
l3=4;

s=[xd^2+yd^2-l3^2-2*l3*(xd*cos(fd)+yd*sin(fd))]/(2*l1*l2);
if s<-1 || s>1
    error('Impossible movement!')
end
%Agonas pano
%***********
theta2_pano=atan2(-sqrt(1-s^2),s);
k1_pano=[(yd-l3*sin(fd))*(l1+l2*cos(theta2_pano))-(xd-l3*cos(fd))*l2*sin(theta2_pano)]/[l1^2+l2^2+2*l1*l2*cos(theta2_pano)];
k2_pano=[(xd-l3*cos(fd))*(l1+l2*cos(theta2_pano))+(yd-l3*sin(fd))*l2*sin(theta2_pano)]/[l1^2+l2^2+2*l1*l2*cos(theta2_pano)];
theta1_pano=atan2(k1_pano,k2_pano);
theta3_pano=fd-theta1_pano-theta2_pano;
%***********

%Agonas kato
%***********
theta2_kato=atan2(sqrt(1-s^2),s); 
k1_kato=[(yd-l3*sin(fd))*(l1+l2*cos(theta2_kato))-(xd-l3*cos(fd))*l2*sin(theta2_kato)]/[l1^2+l2^2+2*l1*l2*cos(theta2_kato)];
k2_kato=[(xd-l3*cos(fd))*(l1+l2*cos(theta2_kato))+(yd-l3*sin(fd))*l2*sin(theta2_kato)]/[l1^2+l2^2+2*l1*l2*cos(theta2_kato)];
theta1_kato=atan2(k1_kato,k2_kato);
theta3_kato=fd-theta1_kato-theta2_kato;
%***********

if CURRENT_Q(2)<0
    q=[theta1_pano theta2_pano theta3_pano]*180/pi;
else
    q=[theta1_kato theta2_kato theta3_kato]*180/pi;
end