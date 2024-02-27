function q=inv_kin_2l(xd,yd)
% q=inv_kin_2l(xd,yd)
% Υπολογιστική συνάρτηση επίλυσης του αντίστροφου κινηματικού προβλήματος,
% για το Ρομποτικό Βραχίονα FLAT 2 LINKS.
% Input: Συντεταγμένες σημείου στόχου
% Output: Διάνυσμα γωνιών q1, q2 σε ΜΟΙΡΕΣ

global CURRENT_Q

l1=4;
l2=4;

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

q=[theta1 theta2]*180/pi; %RAD-2-DEG