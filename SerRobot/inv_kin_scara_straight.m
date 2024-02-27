function q=inv_kin_scara_straight(xd,yd,fd)
% q=inv_kin_scara_straight(xd,yd,zd,fd)
%Τροποποιημένη έκδοση του inv_kin_scara.
%Η συνάρτηση χρησιμοποιείται μόνο σε υπολογισμό ευθείας τροχιάς, και
%ειδικός σκοπός της είναι να διατηρεί σταθερό τον προσανατολισμό του αγκώνα
%του βραχίονα, κατά τη διάρκεια της ευθείας κίνησης.

global CURRENT_Q

l1=2.25;
l2=1.25;

c2=(xd^2+yd^2-l1^2-l2^2)/(2*l1*l2);

%*********************************
%ΥΠΟΛΟΓΙΣΜΟΣ ΓΩΝΙΩΝ ΜΕ ΑΓΚΩΝΑ ΠΑΝΩ
s2_pano=-sqrt(1-c2^2); % Αγκώνας πάνω
theta2_pano=atan2(s2_pano,c2);
k1_pano=l1+l2*c2;
k2_pano=l2*s2_pano;
r_pano=sqrt(k1_pano^2+k2_pano^2);
gama_pano=atan2(k2_pano,k1_pano);
theta1_pano=atan2(yd,xd)-atan2(k2_pano,k1_pano);
theta_arp_pano=(fd*pi/180)-theta1_pano-theta2_pano;

q_pano=[theta1_pano theta2_pano theta_arp_pano]*180/pi; %RAD-2-DEG
%*********************************

%*********************************
%ΥΠΟΛΟΓΙΣΜΟΣ ΓΩΝΙΩΝ ΜΕ ΑΓΚΩΝΑ ΚΑΤΩ
s2_kato=sqrt(1-c2^2); %Αγκώνας κάτω
theta2_kato=atan2(s2_kato,c2);
k1_kato=l1+l2*c2;
k2_kato=l2*s2_kato;
r_kato=sqrt(k1_kato^2+k2_kato^2);
gama_kato=atan2(k2_kato,k1_kato);
theta1_kato=atan2(yd,xd)-atan2(k2_kato,k1_kato);
theta_arp_kato=(fd*pi/180)-theta1_kato-theta2_kato;

q_kato=[theta1_kato theta2_kato theta_arp_kato]*180/pi; %RAD-2-DEG
%*********************************

if CURRENT_Q(2)<0  
    q=[q_pano(1) q_pano(2) q_pano(3)]; %q1,q2,q4
else  
    q=[q_kato(1) q_kato(2) q_kato(3)]; %q1,q2,q4
end