function obj_coords(obj,xt,yt,zt,g_deg)
% Συνάρτηση αλλαγής θέσης των αντικειμένων
% Οι συντεταγμένες δίνονται στο σύστημα αξόνων του τραπεζιού

global sel

if sel ~= 3
    error('This function is to be used only in SCARA arm!')
end

x=-xt; %Μετατροπή του VRML-frame στο world-frame του scara
y=zt+0.1;
z=yt;

h.world = vrworld('scara.wrl');
open(h.world);

init_globals
info_frames

g_rad=g_deg*pi/180;

if obj == 'qr1'
    
    h.T1.translation=[x y-0.1 z];
    h.T1.rotation=[0 1 0 g_rad];
    qr1_x=xt;
    qr1_y=yt;
    qr1_z=zt;
    qr1_rad=g_rad;
    
elseif obj == 'qg1'
    
    h.T2.translation=[x y-0.1 z];
    h.T2.rotation=[0 1 0 g_rad];
    qg1_x=xt;
    qg1_y=yt;
    qg1_z=zt;
    qg1_rad=g_rad;
    
elseif obj == 'qb1'

    h.T3.translation=[x y-0.1 z];
    h.T3.rotation=[0 1 0 g_rad];
    qb1_x=xt;
    qb1_y=yt;
    qb1_z=zt;
    qb1_rad=g_rad;

elseif obj == 'qw1'
    
    h.T4.translation=[x y-0.1 z];
    h.T4.rotation=[0 1 0 g_rad];
    qw1_x=xt;
    qw1_y=yt;
    qw1_z=zt;
    qw1_rad=g_rad;
    
elseif obj == 'pla'
    
    h.T5.translation=[x y z];
    h.T5.rotation=[0 1 0 g_rad];
    pl1_x=xt;
    pl1_y=yt;
    pl1_z=zt;
    pl1_rad=g_rad;
    
elseif obj == 'cy1'
    
    h.T9.translation=[x y z];
    h.T9.rotation=[0 1 0 g_rad];
    cy1_x=xt;
    cy1_y=yt;
    cy1_z=zt;
    cy1_rad=g_rad;
    
elseif obj == 'cb1'
    
    h.T10.translation=[x y z];
    h.T10.rotation=[0 1 0 g_rad];
    cb1_x=xt;
    cb1_y=yt;
    cb1_z=zt;
    cb1_rad=g_rad;
    
elseif obj == 'cg1'
    
    h.T11.translation=[x y z];
    h.T11.rotation=[0 1 0 g_rad];
    cg1_x=xt;
    cg1_y=yt;
    cg1_z=zt;
    cg1_rad=g_rad;
    
elseif obj == 'cr1'
    
    h.T12.translation=[x y z];
    h.T12.rotation=[0 1 0 g_rad];
    cr1_x=xt;
    cr1_y=yt;
    cr1_z=zt;
    cr1_rad=g_rad;
    
elseif obj == 'grt' %grid table
    h.T13.translation=[x y z];
elseif obj == 'gt2' %grid table thick 
    h.T17.translation=[x y z];
elseif obj == 'grw' %grid world
    h.T14.translation=[x y z];
elseif obj == 'gra' %grid tool
    h.T7.translation=[x y z];
elseif obj == 'ga2' %grid tool thick
    h.T16.translation=[x y z];
elseif obj == 'grz'
     h.T20.translation=[x y z];
elseif obj == 'lab'
     h.T6.translation=[x y z];
elseif obj == 'A01'    
    h.A01.translation=[x y z];
    h.A01.rotation=[0 1 0 g_rad];
    A01_x=xt;
    A01_y=yt;
    A01_z=zt;
    A01_rad=g_rad;    
elseif obj == 'A02'    
    h.A02.translation=[x y z];
    h.A02.rotation=[0 1 0 g_rad];
    A02_x=xt;
    A02_y=yt;
    A02_z=zt;
    A02_rad=g_rad;    
elseif obj == 'A03'    
    h.A03.translation=[x y z];
    h.A03.rotation=[0 1 0 g_rad];
    A03_x=xt;
    A03_y=yt;
    A03_z=zt;
    A03_rad=g_rad;    
elseif obj == 'A04'    
    h.A04.translation=[x y z];
    h.A04.rotation=[0 1 0 g_rad];
    A04_x=xt;
    A04_y=yt;
    A04_z=zt;
    A04_rad=g_rad;    
elseif obj == 'A05'
    h.A05.translation=[x y z];
    h.A05.rotation=[0 1 0 g_rad];
    A05_x=xt;
    A05_y=yt;
    A05_z=zt;
    A05_rad=g_rad;
elseif obj == 'A06'    
    h.A06.translation=[x y z];
    h.A06.rotation=[0 1 0 g_rad];
    A06_x=xt;
    A06_y=yt;
    A06_z=zt;
    A06_rad=g_rad;    
elseif obj == 'A07'
    h.A07.translation=[x y z];
    h.A07.rotation=[0 1 0 g_rad];
    A07_x=xt;
    A07_y=yt;
    A07_z=zt;
    A07_rad=g_rad;
elseif obj == 'b01'
    h.B1.translation=[x y z];
    h.B1.rotation=[0 1 0 g_rad];
    b01_x=xt;
    b01_y=yt;
    b01_z=zt;
    b01_rad=g_rad;
elseif obj == 'b02'
    h.B2.translation=[x y z];
    h.B2.rotation=[0 1 0 g_rad];
    b02_x=xt;
    b02_y=yt;
    b02_z=zt;
    b02_rad=g_rad;
elseif obj == 'b03'
    h.B3.translation=[x y z];
    h.B3.rotation=[0 1 0 g_rad];
    b03_x=xt;
    b03_y=yt;
    b03_z=zt;
    b03_rad=g_rad;    
elseif obj == 'b04'
    h.B4.translation=[x y z];
    h.B4.rotation=[0 1 0 g_rad];
    b04_x=xt;
    b04_y=yt;
    b04_z=zt;
    b04_rad=g_rad;
elseif obj == 'b05'
    h.B5.translation=[x y z];
    h.B5.rotation=[0 1 0 g_rad];
    b05_x=xt;
    b05_y=yt;
    b05_z=zt;
    b05_rad=g_rad;
elseif obj == 'b06'
    h.B6.translation=[x y z];
    h.B6.rotation=[0 1 0 g_rad];
    b06_x=xt;
    b06_y=yt;
    b06_z=zt;
    b06_rad=g_rad;
elseif obj == 'b07'
    h.B7.translation=[x y z];
    h.B7.rotation=[0 1 0 g_rad];
    b07_x=xt;
    b07_y=yt;
    b07_z=zt;
    b07_rad=g_rad;
elseif obj == 'b08'
    h.B8.translation=[x y z];
    h.B8.rotation=[0 1 0 g_rad];
    b08_x=xt;
    b08_y=yt;
    b08_z=zt;
    b08_rad=g_rad;
elseif obj == 'b09'
    h.B9.translation=[x y z];
    h.B9.rotation=[0 1 0 g_rad];
    b09_x=xt;
    b09_y=yt;
    b09_z=zt;
    b09_rad=g_rad;    
elseif obj == 'b10'
    h.B10.translation=[x y z];
    h.B10.rotation=[0 1 0 g_rad];
    b10_x=xt;
    b10_y=yt;
    b10_z=zt;
    b10_rad=g_rad;
elseif obj == 'b11'
    h.B11.translation=[x y z];
    h.B11.rotation=[0 1 0 g_rad];
    b11_x=xt;
    b11_y=yt;
    b11_z=zt;
    b11_rad=g_rad;
elseif obj == 'b12'
    h.B12.translation=[x y z];
    h.B12.rotation=[0 1 0 g_rad];
    b12_x=xt;
    b12_y=yt;
    b12_z=zt;
    b12_rad=g_rad;
elseif obj == 's01'
    h.S1.translation=[x y z];
    h.S1.rotation=[0 1 0 g_rad];
    s01_x=xt;
    s01_y=yt;
    s01_z=zt;
    s01_rad=g_rad;
elseif obj == 's02'
    h.S2.translation=[x y z];
    h.S2.rotation=[0 1 0 g_rad];
    s02_x=xt;
    s02_y=yt;
    s02_z=zt;
    s02_rad=g_rad;    
elseif obj == 's03'
    h.S3.translation=[x y z];
    h.S3.rotation=[0 1 0 g_rad];
    s03_x=xt;
    s03_y=yt;
    s03_z=zt;
    s03_rad=g_rad;
elseif obj == 's04'
    h.S4.translation=[x y z];
    h.S4.rotation=[0 1 0 g_rad];
    s04_x=xt;
    s04_y=yt;
    s04_z=zt;
    s04_rad=g_rad;    
elseif obj == 's05'
    h.S5.translation=[x y z];
    h.S5.rotation=[0 1 0 g_rad];
    s05_x=xt;
    s05_y=yt;
    s05_z=zt;
    s05_rad=g_rad;
elseif obj == 's06'
    h.S6.translation=[x y z];
    h.S6.rotation=[0 1 0 g_rad];
    s06_x=xt;
    s06_y=yt;
    s06_z=zt;
    s06_rad=g_rad;    
elseif obj == 's07'
    h.S7.translation=[x y z];
    h.S7.rotation=[0 1 0 g_rad];
    s07_x=xt;
    s07_y=yt;
    s07_z=zt;
    s07_rad=g_rad;
elseif obj == 's08'
    h.S8.translation=[x y z];
    h.S8.rotation=[0 1 0 g_rad];
    s08_x=xt;
    s08_y=yt;
    s08_z=zt;
    s08_rad=g_rad;    
elseif obj == 's09'
    h.S9.translation=[x y z];
    h.S9.rotation=[0 1 0 g_rad];
    s09_x=xt;
    s09_y=yt;
    s09_z=zt;
    s09_rad=g_rad;
elseif obj == 's10'
    h.S10.translation=[x y z];
    h.S10.rotation=[0 1 0 g_rad];
    s10_x=xt;
    s10_y=yt;
    s10_z=zt;
    s10_rad=g_rad;    
elseif obj == 's11'
    h.S11.translation=[x y z];
    h.S11.rotation=[0 1 0 g_rad];
    s11_x=xt;
    s11_y=yt;
    s11_z=zt;
    s11_rad=g_rad;
elseif obj == 's12'
    h.S12.translation=[x y z];
    h.S12.rotation=[0 1 0 g_rad];
    s12_x=xt;
    s12_y=yt;
    s12_z=zt;
    s12_rad=g_rad;    
elseif obj == 's13'
    h.S13.translation=[x y z];
    h.S13.rotation=[0 1 0 g_rad];
    s13_x=xt;
    s13_y=yt;
    s13_z=zt;
    s13_rad=g_rad;
elseif obj == 's14'
    h.S14.translation=[x y z];
    h.S14.rotation=[0 1 0 g_rad];
    s14_x=xt;
    s14_y=yt;
    s14_z=zt;
    s14_rad=g_rad;    
elseif obj == 's15'
    h.S15.translation=[x y z];
    h.S15.rotation=[0 1 0 g_rad];
    s15_x=xt;
    s15_y=yt;
    s15_z=zt;
    s15_rad=g_rad;
elseif obj == 's16'
    h.S16.translation=[x y z];
    h.S16.rotation=[0 1 0 g_rad];
    s16_x=xt;
    s16_y=yt;
    s16_z=zt;
    s16_rad=g_rad;    
elseif obj == 's17'
    h.S17.translation=[x y z];
    h.S17.rotation=[0 1 0 g_rad];
    s17_x=xt;
    s17_y=yt;
    s17_z=zt;
    s17_rad=g_rad;    
elseif obj == 's18'
    h.S18.translation=[x y z];
    h.S18.rotation=[0 1 0 g_rad];
    s18_x=xt;
    s18_y=yt;
    s18_z=zt;
    s18_rad=g_rad;
elseif obj == 's19'
    h.S19.translation=[x y z];
    h.S19.rotation=[0 1 0 g_rad];
    s19_x=xt;
    s19_y=yt;
    s19_z=zt;
    s19_rad=g_rad;
elseif obj == 'ob1'
    h.T18.translation=[x y z];
    h.T18.rotation=[0 1 0 g_rad];
    ob1_x=xt;
    ob1_y=yt;
    ob1_z=zt;
    ob1_rad=g_rad;
elseif obj == 'ob2'
    h.T19.translation=[x y z];
    h.T19.rotation=[0 1 0 g_rad];
    ob2_x=xt;
    ob2_y=yt;
    ob2_z=zt;
    ob2_rad=g_rad;
elseif obj == 'fr1'
    h.F1.translation=[x y z];
    h.F1.rotation=[0 1 0 g_rad];
    fr1_x=xt;
    fr1_y=yt;
    fr1_z=zt;
    fr1_rad=g_rad;
elseif obj == 'fr2'
    h.F2.translation=[x y z];
    h.F2.rotation=[0 1 0 g_rad];
    fr2_x=xt;
    fr2_y=yt;
    fr2_z=zt;
    fr2_rad=g_rad;
elseif obj == 'fr3'
    h.F3.translation=[x y z];
    h.F3.rotation=[0 1 0 g_rad];
    fr3_x=xt;
    fr3_y=yt;
    fr3_z=zt;
    fr3_rad=g_rad;
elseif obj == 'fr4'
    h.F4.translation=[x y z];
    h.F4.rotation=[0 1 0 g_rad];
    fr4_x=xt;
    fr4_y=yt;
    fr4_z=zt;
    fr4_rad=g_rad;
elseif obj == 'fr5'
    h.F5.translation=[x y z];
    h.F5.rotation=[0 1 0 g_rad];
    fr5_x=xt;
    fr5_y=yt;
    fr5_z=zt;
    fr5_rad=g_rad;
elseif obj == 'fr6'
    h.F6.translation=[x y z];
    h.F6.rotation=[0 1 0 g_rad];
    fr6_x=xt;
    fr6_y=yt;
    fr6_z=zt;
    fr6_rad=g_rad;
elseif obj == 'fr7'
    h.F7.translation=[x y z];
    h.F7.rotation=[0 1 0 g_rad];
    fr7_x=xt;
    fr7_y=yt;
    fr7_z=zt;
    fr7_rad=g_rad;
elseif obj == 'fr8'
    h.F8.translation=[x y z];
    h.F8.rotation=[0 1 0 g_rad];
    fr8_x=xt;
    fr8_y=yt;
    fr8_z=zt;
    fr8_rad=g_rad;
elseif obj == 'co1'
    h.C1.translation=[x y-0.1 z];
    co1_x=xt;
    co1_y=yt;
    co1_z=zt;
elseif obj == 'co2'
    h.C2.translation=[x y-0.1 z];
    co2_x=xt;
    co2_y=yt;
    co2_z=zt;
elseif obj == 'co3'
    h.C3.translation=[x y-0.1 z];
    co3_x=xt;
    co3_y=yt;
    co3_z=zt;
elseif obj == 'co4'
    h.C4.translation=[x y-0.1 z];
    co4_x=xt;
    co4_y=yt;
    co4_z=zt;
elseif obj == 'co5'
    h.C5.translation=[x y-0.1 z];
    co5_x=xt;
    co5_y=yt;
    co5_z=zt;
elseif obj == 'sp1'
    h.SP1.translation=[x y-0.1 z];
    sp1_x=xt;
    sp1_y=yt;
    sp1_z=zt;
elseif obj == 'sp2'
    h.SP2.translation=[x y-0.1 z];
    sp2_x=xt;
    sp2_y=yt;
    sp2_z=zt;
elseif obj == 'sp3'
    h.SP3.translation=[x y-0.1 z];
    sp3_x=xt;
    sp3_y=yt;
    sp3_z=zt;
elseif obj == 'sp4'
    h.SP4.translation=[x y-0.1 z];
    sp4_x=xt;
    sp4_y=yt;
    sp4_z=zt;
elseif obj == 'sp5'
    h.SP5.translation=[x y-0.1 z];
    sp5_x=xt;
    sp5_y=yt;
    sp5_z=zt;
elseif obj == 'cy2'
    h.T21.translation=[x y-0.1 z];
    h.T21.rotation=[0 1 0 g_rad];
    cy2_x=xt;
    cy2_y=yt;
    cy2_z=zt;
    cy2_rad=g_rad;
elseif obj == 'cb2'
    h.T22.translation=[x y-0.1 z];
    h.T22.rotation=[0 1 0 g_rad];
    cb2_x=xt;
    cb2_y=yt;
    cb2_z=zt;
    cb2_rad=g_rad;
elseif obj == 'cg2'
    h.T23.translation=[x y-0.1 z];
    h.T23.rotation=[0 1 0 g_rad];
    cg2_x=xt;
    cg2_y=yt;
    cg2_z=zt;
    cg2_rad=g_rad;
elseif obj == 'cr2'
    h.T24.translation=[x y-0.1 z];
    h.T24.rotation=[0 1 0 g_rad];
    cr2_x=xt;
    cr2_y=yt;
    cr2_z=zt;
    cr2_rad=g_rad;
else
    disp('Wrong usage of obj_coords function!')
end