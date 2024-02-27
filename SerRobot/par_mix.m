function h = par_mix(q0,t0,qf,tfin)
%Συνάρτηση Παραβολικής μίξης
%Καλείται εσωτερικά από την εφαρμογή, ΓΙΑ ΚΑΘΕΜΙΑ ΑΡΘΡΩΣΗ ΞΕΧΩΡΙΣΤΑ.
%par_mix(q0,t0,qf,tfin)
%Ορίσματα: 4
%q0:    Αρχική θέση DEG
%t0:    Αρχικός χρόνος
%qf:    Τελική θέση DEG
%tfin:  Τελικός χρόνος

global tb

a=(qf-q0)/[tb*(tfin-tb)];
V=a*tb;
t=t0:0.01:tfin;

for i=1:length(t)
    if (t(i)>=t0) && (t(i)<tb)
        qd(i)=q0+(a*t(i)^2)/2;
    elseif (t(i)>=tb) && (t(i)<=tfin-tb)
        qd(i)=[(qf+q0-V*tfin)/2]+V*t(i);
    elseif (t(i)>tfin-tb) && (t(i)<=tfin)
        qd(i)=qf-(a*tfin^2)/2+a*tfin*t(i)-(a*t(i)^2)/2;
    end
end

h=[t; qd]';