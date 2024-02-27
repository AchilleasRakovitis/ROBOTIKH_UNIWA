function q=inv_kin_3l(xd,yd,fd_deg)
%Καλείται εσωτερικά από την εφαρμογή.
%Αφορά τον βραχίονα 3links.
%Ορίσματα: 3
%xd: Τετμημένη x επιθημητού σημείου
%yd: Τεταγμένη y επιθημητού σημείου
%fd_deg: Προσανατολισμός αρπάγης φ, σε μοίρες.

global CURRENT_Q

fd=(fd_deg*pi)/180;
l1=4;
l2=4;
l3=4;

s=[xd^2+yd^2-l3^2-2*l3*(xd*cos(fd)+yd*sin(fd))]/(2*l1*l2);
if s<-1 || s>1
    error('Impossible movement!')
end

%*********************************
%ΥΠΟΛΟΓΙΣΜΟΣ ΓΩΝΙΩΝ ΜΕ ΑΓΚΩΝΑ ΠΑΝΩ
theta2_pano=atan2(-sqrt(1-s^2),s);
k1=[(yd-l3*sin(fd))*(l1+l2*cos(theta2_pano))-(xd-l3*cos(fd))*l2*sin(theta2_pano)]/[l1^2+l2^2+2*l1*l2*cos(theta2_pano)];
k2=[(xd-l3*cos(fd))*(l1+l2*cos(theta2_pano))+(yd-l3*sin(fd))*l2*sin(theta2_pano)]/[l1^2+l2^2+2*l1*l2*cos(theta2_pano)];

theta1_pano=atan2(k1,k2);
theta3_pano=fd-theta1_pano-theta2_pano;

dq_pano=abs(CURRENT_Q(1)-theta1_pano*180/pi) + abs(CURRENT_Q(2)-theta2_pano*180/pi) + abs(CURRENT_Q(3)-theta3_pano*180/pi);
%*********************************

%*********************************
%ΥΠΟΛΟΓΙΣΜΟΣ ΓΩΝΙΩΝ ΜΕ ΑΓΚΩΝΑ ΠΑΝΩ
theta2_kato=atan2(sqrt(1-s^2),s);
k1=[(yd-l3*sin(fd))*(l1+l2*cos(theta2_kato))-(xd-l3*cos(fd))*l2*sin(theta2_kato)]/[l1^2+l2^2+2*l1*l2*cos(theta2_kato)];
k2=[(xd-l3*cos(fd))*(l1+l2*cos(theta2_kato))+(yd-l3*sin(fd))*l2*sin(theta2_kato)]/[l1^2+l2^2+2*l1*l2*cos(theta2_kato)];

theta1_kato=atan2(k1,k2);
theta3_kato=fd-theta1_kato-theta2_kato;

dq_kato=abs(CURRENT_Q(1)-theta1_kato*180/pi) + abs(CURRENT_Q(2)-theta2_kato*180/pi) + abs(CURRENT_Q(3)-theta3_kato*180/pi);
%*********************************
if dq_pano < dq_kato
    theta1 = theta1_pano;
    theta2 = theta2_pano;
    theta3 = theta3_pano;
else
    theta1 = theta1_kato;
    theta2 = theta2_kato;
    theta3 = theta3_kato;
end


q=[theta1 theta2 theta3]*180/pi; %RAD-2-DEG