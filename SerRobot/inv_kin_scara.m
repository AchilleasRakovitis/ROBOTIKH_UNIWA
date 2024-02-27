function q=inv_kin_scara(xd,yd,zd_given,fd)
% q=inv_kin_scara(xd,yd,zd,fd)
% Υπολογιστική συνάρτηση επίλυσης του αντίστροφου κινηματικού προβλήματος,
% για το Ρομποτικό Βραχίονα SCARA.
% Input: Συντεταγμένες σημείου στόχου, και προσανατολισμός αρπάγης
% Output: Διάνυσμα γωνιών q1, q2 σε ΜΟΙΡΕΣ, και q3 σε mm

global CURRENT_Q

l1=2.25;
l2=1.25;
zd=zd_given+0.35;

c2=(xd^2+yd^2-l1^2-l2^2)/(2*l1*l2);

%ΥΠΟΛΟΓΙΣΜΟΣ ΓΩΝΙΩΝ ΜΕ ΑΓΚΩΝΑ ΠΑΝΩ
s2_pano=-sqrt(1-c2^2); % Αγκώνας πάνω
theta2_pano=atan2(s2_pano,c2);
k1_pano=l1+l2*c2;
k2_pano=l2*s2_pano;
r_pano=sqrt(k1_pano^2+k2_pano^2);
gama_pano=atan2(k2_pano,k1_pano);
theta1_pano=atan2(yd,xd)-atan2(k2_pano,k1_pano);
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
%*********************************

%----KRITHRIO MIKROTERHS APOSTASHS
total_pano=abs(theta1_pano-CURRENT_Q(1))+abs(theta2_pano-CURRENT_Q(2));
total_kato=abs(theta1_kato-CURRENT_Q(1))+abs(theta2_kato-CURRENT_Q(2));

if total_pano <= total_kato
    theta1=theta1_pano;
    theta2=theta2_pano;
else
    theta1=theta1_kato;
    theta2=theta2_kato;
end

theta_arp=(fd*pi/180)-theta1-theta2;
q=[theta1*180/pi theta2*180/pi zd theta_arp*180/pi]; %RAD-2-DEG