function grasp
%Εντολή εμπλοκής της αρπάγης του κοντινότερου αντικειμένου.

global GRASP
global NEAREST_OBJ

GRASP=1;
init_globals
info_frames

g=g0e;
gTE=inv(gVT)*gVB*gB0*g;
xt=gTE(1,4); %Συντεταγμένες της αρπάγης ως προς το πλαίσιο του τραπεζιού
yt=gTE(2,4);
zt=gTE(3,4);

% Στον πίνακα ap() χρησιμοποιούνται οι ονομασίες όπως είναι στην obj_coords
% (Δηλαδή όπως είναι ονομασμένα στο αρχείο .wrl)
ap(1)=sqrt((xt-qr1_x)^2 + (yt-qr1_y)^2 + (zt-qr1_z)^2); % Απόσταση κάθε αντικειμένου απ' την αρπάγη
ap(2)=sqrt((xt-qg1_x)^2 + (yt-qg1_y)^2 + (zt-qg1_z)^2);
ap(3)=sqrt((xt-qb1_x)^2 + (yt-qb1_y)^2 + (zt-qb1_z)^2);
ap(4)=sqrt((xt-qw1_x)^2 + (yt-qw1_y)^2 + (zt-qw1_z)^2);
ap(5)=sqrt((xt-pl1_x)^2 + (yt-pl1_y)^2 + (zt-pl1_z)^2); %plate distance

GctY=[1 0 0 cy1_x+0.5;0 1 0 cy1_y+0.5;0 0 1 0;0 0 0 1]; %Βοηθητικές μεταβλητές για τους κυλίνδρους, που είναι children του plate
GctG=[1 0 0 cg1_x+0.5;0 1 0 cg1_y+0.5;0 0 1 0;0 0 0 1];
GctB=[1 0 0 cb1_x+0.5;0 1 0 cb1_y+0.5;0 0 1 0;0 0 0 1];
GctR=[1 0 0 cr1_x+0.5;0 1 0 cr1_y+0.5;0 0 1 0;0 0 0 1];

ye=inv(GctY)*inv(g0T)*g; %Πίνακας στροφής του κίτρινου κυλίνδρου ως προς την αρπάγη
gr=inv(GctG)*inv(g0T)*g; %              >>    πράσινου           >>
bl=inv(GctB)*inv(g0T)*g; %              >>    μπλε               >>
re=inv(GctR)*inv(g0T)*g; %              >>    κόκκινου           >>
ap(6)=sqrt((0-ye(1,4))^2 + (0-ye(2,4))^2 + (0-ye(3,4))^2);
ap(7)=sqrt((0-gr(1,4))^2 + (0-gr(2,4))^2 + (0-gr(3,4))^2);
ap(8)=sqrt((0-bl(1,4))^2 + (0-bl(2,4))^2 + (0-bl(3,4))^2);
ap(9)=sqrt((0-re(1,4))^2 + (0-re(2,4))^2 + (0-re(3,4))^2);

ap(10)=sqrt((xt-b01_x)^2 + (yt-b01_y)^2 + (zt-b01_z)^2); %big sticks άσκηση 'tei'
ap(11)=sqrt((xt-b02_x)^2 + (yt-b02_y)^2 + (zt-b02_z)^2);
ap(12)=sqrt((xt-b03_x)^2 + (yt-b03_y)^2 + (zt-b03_z)^2);
ap(13)=sqrt((xt-b04_x)^2 + (yt-b04_y)^2 + (zt-b04_z)^2);
ap(14)=sqrt((xt-b05_x)^2 + (yt-b05_y)^2 + (zt-b05_z)^2);
ap(15)=sqrt((xt-b06_x)^2 + (yt-b06_y)^2 + (zt-b06_z)^2);
ap(16)=sqrt((xt-b07_x)^2 + (yt-b07_y)^2 + (zt-b07_z)^2);
ap(17)=sqrt((xt-b08_x)^2 + (yt-b08_y)^2 + (zt-b08_z)^2);
ap(18)=sqrt((xt-b09_x)^2 + (yt-b09_y)^2 + (zt-b09_z)^2);
ap(19)=sqrt((xt-b10_x)^2 + (yt-b10_y)^2 + (zt-b10_z)^2);
ap(20)=sqrt((xt-b11_x)^2 + (yt-b11_y)^2 + (zt-b11_z)^2);
ap(21)=sqrt((xt-b12_x)^2 + (yt-b12_y)^2 + (zt-b12_z)^2);

ap(22)=sqrt((xt-s01_x)^2 + (yt-s01_y)^2 + (zt-s01_z)^2); %small sticks άσκηση 'tei'
ap(23)=sqrt((xt-s02_x)^2 + (yt-s02_y)^2 + (zt-s02_z)^2);
ap(24)=sqrt((xt-s03_x)^2 + (yt-s03_y)^2 + (zt-s03_z)^2);
ap(25)=sqrt((xt-s04_x)^2 + (yt-s04_y)^2 + (zt-s04_z)^2);
ap(26)=sqrt((xt-s05_x)^2 + (yt-s05_y)^2 + (zt-s05_z)^2);
ap(27)=sqrt((xt-s06_x)^2 + (yt-s06_y)^2 + (zt-s06_z)^2);
ap(28)=sqrt((xt-s07_x)^2 + (yt-s07_y)^2 + (zt-s07_z)^2);
ap(29)=sqrt((xt-s08_x)^2 + (yt-s08_y)^2 + (zt-s08_z)^2);
ap(30)=sqrt((xt-s09_x)^2 + (yt-s09_y)^2 + (zt-s09_z)^2);
ap(31)=sqrt((xt-s10_x)^2 + (yt-s10_y)^2 + (zt-s10_z)^2);
ap(32)=sqrt((xt-s11_x)^2 + (yt-s11_y)^2 + (zt-s11_z)^2);
ap(33)=sqrt((xt-s12_x)^2 + (yt-s12_y)^2 + (zt-s12_z)^2);
ap(34)=sqrt((xt-s13_x)^2 + (yt-s13_y)^2 + (zt-s13_z)^2);
ap(35)=sqrt((xt-s14_x)^2 + (yt-s14_y)^2 + (zt-s14_z)^2);
ap(36)=sqrt((xt-s15_x)^2 + (yt-s15_y)^2 + (zt-s15_z)^2);
ap(37)=sqrt((xt-s16_x)^2 + (yt-s16_y)^2 + (zt-s16_z)^2);
ap(38)=sqrt((xt-s17_x)^2 + (yt-s17_y)^2 + (zt-s17_z)^2);
ap(39)=sqrt((xt-s18_x)^2 + (yt-s18_y)^2 + (zt-s18_z)^2);
ap(40)=sqrt((xt-s19_x)^2 + (yt-s19_y)^2 + (zt-s19_z)^2);
ap(41)=sqrt((xt-A01_x)^2 + (yt-A01_y)^2 + (zt-A01_z)^2); %Αντικείμενα για την άσκηση assemble
ap(42)=sqrt((xt-A02_x)^2 + (yt-A02_y)^2 + (zt-A02_z)^2);
ap(43)=sqrt((xt-A03_x)^2 + (yt-A03_y)^2 + (zt-A03_z)^2);
ap(44)=sqrt((xt-A04_x)^2 + (yt-A04_y)^2 + (zt-A04_z)^2);
ap(45)=sqrt((xt-A05_x)^2 + (yt-A05_y)^2 + (zt-A05_z)^2);
ap(46)=sqrt((xt-A06_x)^2 + (yt-A06_y)^2 + (zt-A06_z)^2);
ap(47)=sqrt((xt-A07_x)^2 + (yt-A07_y)^2 + (zt-A07_z)^2);
ap(48)=sqrt((xt-co1_x)^2 + (yt-co1_y)^2 + (zt-co1_z)^2); %cones
ap(49)=sqrt((xt-co2_x)^2 + (yt-co2_y)^2 + (zt-co2_z)^2);
ap(50)=sqrt((xt-co3_x)^2 + (yt-co3_y)^2 + (zt-co3_z)^2);
ap(51)=sqrt((xt-co4_x)^2 + (yt-co4_y)^2 + (zt-co4_z)^2);
ap(52)=sqrt((xt-co5_x)^2 + (yt-co5_y)^2 + (zt-co5_z)^2);
ap(53)=sqrt((xt-sp1_x)^2 + (yt-sp1_y)^2 + (zt-sp1_z)^2); %spheres
ap(54)=sqrt((xt-sp2_x)^2 + (yt-sp2_y)^2 + (zt-sp2_z)^2);
ap(55)=sqrt((xt-sp3_x)^2 + (yt-sp3_y)^2 + (zt-sp3_z)^2);
ap(56)=sqrt((xt-sp4_x)^2 + (yt-sp4_y)^2 + (zt-sp4_z)^2);
ap(57)=sqrt((xt-sp5_x)^2 + (yt-sp5_y)^2 + (zt-sp5_z)^2);
ap(58)=sqrt((xt-cy2_x)^2 + (yt-cy2_y)^2 + (zt-cy2_z)^2); %cylinders (independed)
ap(59)=sqrt((xt-cb2_x)^2 + (yt-cb2_y)^2 + (zt-cb2_z)^2);
ap(60)=sqrt((xt-cg2_x)^2 + (yt-cg2_y)^2 + (zt-cg2_z)^2);
ap(61)=sqrt((xt-cr2_x)^2 + (yt-cr2_y)^2 + (zt-cr2_z)^2);

%EYRESH KONTINOTEROU ANTIKEIMENOU****************
                min_ap=[ap(1),1];
                for j=2:length(ap)
                    if ap(j) < min_ap(1)
                        min_ap=[ap(j),j];
                    end
                end
                
                switch(min_ap(2))
                    case 1
                        NEAREST_OBJ=1;
                        disp('Red cube grasped!')
                    case 2
                        NEAREST_OBJ=2;
                        disp('Green cube grasped!')
                    case 3
                        NEAREST_OBJ=3;
                        disp('Blue cube grasped!')
                    case 4
                        NEAREST_OBJ=4;
                        disp('Yellow cube grasped!')
                    case 5
                        NEAREST_OBJ=5;
                        disp('Plate grasped!')
                    case 6
                        NEAREST_OBJ=6;
                        disp('Yellow cylinder grasped!')
                    case 7
                        NEAREST_OBJ=7;
                        disp('Green cylinder grasped!')
                    case 8
                        NEAREST_OBJ=8;
                        disp('Blue cylinder grasped!')
                    case 9
                        NEAREST_OBJ=9;
                        disp('Red cylinder grasped!')
                    case 10
                        NEAREST_OBJ=10;
                    case 11
                        NEAREST_OBJ=11;
                    case 12
                        NEAREST_OBJ=12;
                    case 13
                        NEAREST_OBJ=13;
                    case 14
                        NEAREST_OBJ=14;
                    case 15
                        NEAREST_OBJ=15;                        
                    case 16
                        NEAREST_OBJ=16;
                    case 17
                        NEAREST_OBJ=17;
                    case 18
                        NEAREST_OBJ=18;                        
                    case 19
                        NEAREST_OBJ=19;
                    case 20
                        NEAREST_OBJ=20;
                    case 21
                        NEAREST_OBJ=21;                        
                    case 22
                        NEAREST_OBJ=22;                        
                    case 23
                        NEAREST_OBJ=23;                        
                    case 24
                        NEAREST_OBJ=24;                       
                    case 25
                        NEAREST_OBJ=25;                        
                    case 26
                        NEAREST_OBJ=26;                        
                    case 27
                        NEAREST_OBJ=27;                        
                    case 28
                        NEAREST_OBJ=28;                       
                    case 29
                        NEAREST_OBJ=29;
                    case 30
                        NEAREST_OBJ=30;
                    case 31
                        NEAREST_OBJ=31;                        
                    case 32
                        NEAREST_OBJ=32;                       
                    case 33
                        NEAREST_OBJ=33;                        
                    case 34
                        NEAREST_OBJ=34;
                    case 35
                        NEAREST_OBJ=35;                        
                    case 36
                        NEAREST_OBJ=36;                       
                    case 37
                        NEAREST_OBJ=37;                        
                    case 38
                        NEAREST_OBJ=38;                       
                    case 39
                        NEAREST_OBJ=39;                        
                    case 40
                        NEAREST_OBJ=40;
                    case 41
                        NEAREST_OBJ=41;
                        disp('A01 grasped!')
                    case 42
                        NEAREST_OBJ=42;
                        disp('A02 grasped!')
                    case 43
                        NEAREST_OBJ=43;
                        disp('A03 grasped!')
                    case 44
                        NEAREST_OBJ=44;
                        disp('A04 grasped!')
                    case 45
                        NEAREST_OBJ=45;
                        disp('A05 grasped!')
                    case 46
                        NEAREST_OBJ=46;
                        disp('A06 grasped!')
                    case 47
                        NEAREST_OBJ=47;
                        disp('A07 grasped!')
                    case 48
                        NEAREST_OBJ=48;
                        disp('Cone grasped!')
                    case 49
                        NEAREST_OBJ=49;
                        disp('Cone grasped!')
                    case 50
                        NEAREST_OBJ=50;
                        disp('Cone grasped!')
                    case 51
                        NEAREST_OBJ=51;
                        disp('Cone grasped!')
                    case 52
                        NEAREST_OBJ=52;
                        disp('Cone grasped!')
                    case 53
                        NEAREST_OBJ=53;
                        disp('Sphere grasped!')
                    case 54
                        NEAREST_OBJ=54;
                        disp('Sphere grasped!')
                    case 55
                        NEAREST_OBJ=55;
                        disp('Sphere grasped!')
                    case 56
                        NEAREST_OBJ=56;
                        disp('Sphere grasped!')
                    case 57
                        NEAREST_OBJ=57;
                        disp('Sphere grasped!')
                    case 58
                        NEAREST_OBJ=58;
                        disp('Yellow cylinder grasped!')
                    case 59
                        NEAREST_OBJ=59;
                        disp('Blue cylinder grasped!')
                    case 60
                        NEAREST_OBJ=60;
                        disp('Green cylinder grasped!')
                    case 61
                        NEAREST_OBJ=61;
                        disp('Red cylinder grasped!')
                end