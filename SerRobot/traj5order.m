function h=traj5order(q0,qf,q0d,qfd,q0dd,qfdd,tfin)

% Συνάρτηση σχεδίασης τροχιάς, Ορίσματα:7
% q0: Αρχική θέση σε DEG
% qf: Τελική θέση σε DEG
% q0d: Αρχική ταχύτητα
% qfd: Τελική ταχύτητα
% q0dd: Αρχική επιτάχυνση
% qfdd: Τελική επιτάχυνση
% tfin: Χρόνος

k0=q0;
k1=q0d;
k2=q0dd/2;
k3=(10/tfin^3)*(qf-q0)-[(4*qfd+6*q0d)/tfin^2]-[(3*q0dd-qfdd)/2*tfin];
k4=-(15/tfin^4)*(qf-q0)+[(7*qfd+8*q0d)/tfin^3]+[(3*q0dd-2*qfdd)/2*tfin^2];
k5=(6/tfin^5)*(qf-q0)-[3*(qfd+q0d)/tfin^4]-[(q0dd-qfdd)/2*tfin^3];

t=0:0.01:tfin;

for i=1:length(t)
q(i)=k0+k1*t(i)+k2*t(i)^2+k3*t(i)^3+k4*t(i)^4+k5*t(i)^5; %Τροχιά
qd(i)=k1+2*k2*t(i)+3*k3*t(i)^2+4*k4*t(i)^3+5*k5*t(i)^4;  %Ταχύτητα
qdd(i)=2*k2+6*k3*t(i)+12*k4*t(i)^2+20*k5*t(i)^3;         %Επιτάχυνση
end

% h1=q;
% h2=qd;
% h3=qdd;

h=[t; q; qd]';

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