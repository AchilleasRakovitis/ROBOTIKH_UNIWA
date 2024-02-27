function h=traj3order(q0,qf,q0d,qfd,tfin)

% Συνάρτηση σχεδίασης τροχιάς, Ορίσματα:5
% q0: Αρχική θέση σε DEG
% qf: Τελική θέση σε DEG
% q0d: Αρχική ταχύτητα
% qfd: Τελική ταχύτητα
% tfin: Χρόνος

k0=q0;
k1=q0d;
k2=(3/tfin^2)*(qf-q0)-2*q0d/tfin-1/tfin*qfd;
k3=-(2/tfin^3)*(qf-q0)+(q0d+qfd)/tfin^2;

t=0:0.01:tfin;

for i=1:length(t) 
q(i)=k0+k1*t(i)+k2*t(i)^2+k3*t(i)^3 ; %Τροχιά
qd(i)=k1+2*k2*t(i)+3*k3*t(i)^2 ;      %Ταχύτητα
qdd(i)=2*k2+6*k3*t(i) ;               %Επιτάχυνση
end


h=[t; q]';

% h2=qd;
% h3=qdd;

% figure(1);hold on;
% title('Orbit')
% plot(t,q);hold off;
% 
% figure(2);hold on;
% title('Velocity')
% plot(t,qd);hold off;
% 
% figure(3);hold on;
% title('Acceleration')
% plot(t,qdd);hold off;