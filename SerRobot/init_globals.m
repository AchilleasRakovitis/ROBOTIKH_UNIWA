global sel

if sel == 3

h.world = vrworld('scara.wrl');
open(h.world);

global qr1_x %red cube
global qr1_y
global qr1_z
global qr1_rad 
global qg1_x %green cube
global qg1_y
global qg1_z
global qg1_rad
global qb1_x %blue cube
global qb1_y
global qb1_z
global qb1_rad
global qw1_x %white cube
global qw1_y
global qw1_z
global qw1_rad
global pl1_x %plate
global pl1_y
global pl1_z
global pl1_rad
global cy1_x %yellow cylinder (children of plate)
global cy1_y
global cy1_z
global cy1_rad
global cb1_x %blue cylinder (children of plate)
global cb1_y
global cb1_z
global cb1_rad
global cg1_x %green cylinder (children of plate)
global cg1_y
global cg1_z
global cg1_rad
global cr1_x %red cylinder (children of plate)
global cr1_y
global cr1_z
global cr1_rad

global cy2_x %yellow cylinder (independent)
global cy2_y
global cy2_z
global cy2_rad
global cb2_x %blue cylinder (independent)
global cb2_y
global cb2_z
global cb2_rad
global cg2_x %green cylinder (independent)
global cg2_y
global cg2_z
global cg2_rad
global cr2_x %red cylinder (independent)
global cr2_y
global cr2_z
global cr2_rad

global g_rad

global b01_x %sticks for 'tei'
global b01_y
global b01_z
global b01_rad
global b02_x
global b02_y
global b02_z
global b02_rad
global b03_x
global b03_y
global b03_z
global b03_rad
global b04_x
global b04_y
global b04_z
global b04_rad
global b05_x
global b05_y
global b05_z
global b05_rad
global b06_x
global b06_y
global b06_z
global b06_rad
global b07_x
global b07_y
global b07_z
global b07_rad
global b08_x
global b08_y
global b08_z
global b08_rad
global b09_x
global b09_y
global b09_z
global b09_rad
global b10_x
global b10_y
global b10_z
global b10_rad
global b11_x
global b11_y
global b11_z
global b11_rad
global b12_x
global b12_y
global b12_z
global b12_rad

global s01_x
global s01_y
global s01_z
global s01_rad
global s02_x
global s02_y
global s02_z
global s02_rad
global s03_x
global s03_y
global s03_z
global s03_rad
global s04_x
global s04_y
global s04_z
global s04_rad
global s05_x
global s05_y
global s05_z
global s05_rad
global s06_x
global s06_y
global s06_z
global s06_rad
global s07_x
global s07_y
global s07_z
global s07_rad
global s08_x
global s08_y
global s08_z
global s08_rad
global s09_x
global s09_y
global s09_z
global s09_rad
global s10_x
global s10_y
global s10_z
global s10_rad
global s11_x
global s11_y
global s11_z
global s11_rad
global s12_x
global s12_y
global s12_z
global s12_rad
global s13_x
global s13_y
global s13_z
global s13_rad
global s14_x
global s14_y
global s14_z
global s14_rad
global s15_x
global s15_y
global s15_z
global s15_rad
global s16_x
global s16_y
global s16_z
global s16_rad
global s17_x
global s17_y
global s17_z
global s17_rad
global s18_x
global s18_y
global s18_z
global s18_rad
global s19_x
global s19_y
global s19_z
global s19_rad

global A01_x %objects for 'ase'
global A01_y
global A01_z
global A01_rad
global A02_x
global A02_y
global A02_z
global A02_rad
global A03_x
global A03_y
global A03_z
global A03_rad
global A04_x
global A04_y
global A04_z
global A04_rad
global A05_x
global A05_y
global A05_z
global A05_rad
global A06_x
global A06_y
global A06_z
global A06_rad
global A07_x
global A07_y
global A07_z
global A07_rad

global ob1_x %Obstacle 1
global ob1_y
global ob1_z
global ob1_rad
global ob2_x %Obstacle 2
global ob2_y
global ob2_z
global ob2_rad

global fr1_x %frames
global fr1_y
global fr1_z
global fr1_rad
global fr2_x
global fr2_y
global fr2_z
global fr2_rad
global fr3_x
global fr3_y
global fr3_z
global fr3_rad
global fr4_x
global fr4_y
global fr4_z
global fr4_rad
global fr5_x
global fr5_y
global fr5_z
global fr5_rad
global fr6_x
global fr6_y
global fr6_z
global fr6_rad
global fr7_x
global fr7_y
global fr7_z
global fr7_rad
global fr8_x
global fr8_y
global fr8_z
global fr8_rad

global co1_x %cones
global co1_y
global co1_z
global co1_rad
global co2_x
global co2_y
global co2_z
global co2_rad
global co3_x
global co3_y
global co3_z
global co3_rad
global co4_x
global co4_y
global co4_z
global co4_rad
global co5_x
global co5_y
global co5_z
global co5_rad

global sp1_x %Spheres
global sp1_y
global sp1_z
global sp2_x
global sp2_y
global sp2_z
global sp3_x
global sp3_y
global sp3_z
global sp4_x
global sp4_y
global sp4_z
global sp5_x
global sp5_y
global sp5_z

global V1_max
global V2_max
global V3_max
global V4_max
global A1_max
global A2_max
global A3_max
global A4_max

h.T1=vrnode(h.world,'qr1');
h.T2=vrnode(h.world,'qg1');
h.T3=vrnode(h.world,'qb1');
h.T4=vrnode(h.world,'qw1');
h.T5=vrnode(h.world,'pla');
h.T6=vrnode(h.world,'lab'); %Σετ Εμποδίων για την άσκηση labyrinth
h.T7=vrnode(h.world,'gra'); %grid tool
h.T8=vrnode(h.world,'trace');
h.T9=vrnode(h.world,'cy1'); %yellow cylinder (children of plate)
h.T10=vrnode(h.world,'cb1'); %blue cylinder (children of plate)
h.T11=vrnode(h.world,'cg1'); %green cylinder (children of plate)
h.T12=vrnode(h.world,'cr1'); %red cylinder (children of plate)
h.T13=vrnode(h.world,'grt'); %grid table
h.T14=vrnode(h.world,'grw'); %grid world
%h.T15=vrnode(h.world,'tei'); %Sticks για την άσκηση 'tei'
h.T16=vrnode(h.world,'ga2'); %grid-tool thick
h.T17=vrnode(h.world,'gt2'); %grid table thick
h.T18=vrnode(h.world,'ob1'); %Obstacle 1
h.T19=vrnode(h.world,'ob2'); %Obstacle 2
h.T20=vrnode(h.world,'grz'); %grid tool Z-axis

h.T21=vrnode(h.world,'cy2'); %yellow cylinder (independed)
h.T22=vrnode(h.world,'cb2'); %blue cylinder (independed)
h.T23=vrnode(h.world,'cg2'); %green cylinder (independed)
h.T24=vrnode(h.world,'cr2'); %red cylinder (independed)

h.F1=vrnode(h.world,'fr1'); %FRAMES
h.F2=vrnode(h.world,'fr2');
h.F3=vrnode(h.world,'fr3');
h.F4=vrnode(h.world,'fr4');
h.F5=vrnode(h.world,'fr5');
h.F6=vrnode(h.world,'fr6');
h.F7=vrnode(h.world,'fr7');
h.F8=vrnode(h.world,'fr8');

h.C1=vrnode(h.world,'co1'); %Cones
h.C2=vrnode(h.world,'co2');
h.C3=vrnode(h.world,'co3');
h.C4=vrnode(h.world,'co4');
h.C5=vrnode(h.world,'co5');

h.SP1=vrnode(h.world,'sp1'); %Spheres
h.SP2=vrnode(h.world,'sp2');
h.SP3=vrnode(h.world,'sp3');
h.SP4=vrnode(h.world,'sp4');
h.SP5=vrnode(h.world,'sp5');

h.A01=vrnode(h.world,'A01'); %Assemble objects
h.A02=vrnode(h.world,'A02');
h.A03=vrnode(h.world,'A03');
h.A04=vrnode(h.world,'A04');
h.A05=vrnode(h.world,'A05');
h.A06=vrnode(h.world,'A06');
h.A07=vrnode(h.world,'A07');

h.B1=vrnode(h.world,'b01'); %Sticks
h.B2=vrnode(h.world,'b02');
h.B3=vrnode(h.world,'b03');
h.B4=vrnode(h.world,'b04');
h.B5=vrnode(h.world,'b05');
h.B6=vrnode(h.world,'b06');
h.B7=vrnode(h.world,'b07');
h.B8=vrnode(h.world,'b08');
h.B9=vrnode(h.world,'b09');
h.B10=vrnode(h.world,'b10');
h.B11=vrnode(h.world,'b11');
h.B12=vrnode(h.world,'b12');

h.S1=vrnode(h.world,'s01');
h.S2=vrnode(h.world,'s02');
h.S3=vrnode(h.world,'s03');
h.S4=vrnode(h.world,'s04');
h.S5=vrnode(h.world,'s05');
h.S6=vrnode(h.world,'s06');
h.S7=vrnode(h.world,'s07');
h.S8=vrnode(h.world,'s08');
h.S9=vrnode(h.world,'s09');
h.S10=vrnode(h.world,'s10');
h.S11=vrnode(h.world,'s11');
h.S12=vrnode(h.world,'s12');
h.S13=vrnode(h.world,'s13');
h.S14=vrnode(h.world,'s14');
h.S15=vrnode(h.world,'s15');
h.S16=vrnode(h.world,'s16');
h.S17=vrnode(h.world,'s17');
h.S18=vrnode(h.world,'s18');
h.S19=vrnode(h.world,'s19');

    
elseif sel == 1 %RR
    
%future use
    
elseif sel == 2 %RRR
    
%future use
        
end