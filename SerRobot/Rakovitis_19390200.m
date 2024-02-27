clear obj;
obj_coords('b01',1.5,4.8,0.05,0); % red gia rob
obj_coords('b02',1.5,0.4,0.05,0); % red gia ice
obj_coords('b03',1.5,0.6,0.05,0); % red gia ice
obj_coords('b04',1.5,0.8,0.05,0); % red gia ice
obj_coords('b05',1.5,5,0.05,0); % red gia rob
obj_coords('b06',1.5,5.2,0.05,0); % red gia rob
obj_coords('b07',1.5,5.4,0.05,0); % red gia rob
obj_coords('b12',1.5,5.6,0.05,0); % green gia rob
obj_coords('b09',0.5,3,0.05,90); %  green gia to R
obj_coords('b10',0.7,3,0.05,90); %  green gia to R
obj_coords('b11',0.9,3,0.05,90); %  green gia payla
obj_coords('s01',2.4,2.025,0.05,0); %  blue den peirazw, gia 00
obj_coords('s02',2.4,2.475,0.05,0);%  blue den peirazw, gia 00
obj_coords('s03',2.4,2.825,0.05,0); %  blue den peirazw, gia 00
obj_coords('s04',2.4,3.275,0.05,0); % blue den peirazw, gia 00
obj_coords('s05',0.1,1.5,0.05,90); % blue gia ice
obj_coords('s06',0.3,1.5,0.05,90); %  blue gia ice
obj_coords('s07',0.5,1.5,0.05,90); %  blue gia ice
obj_coords('s08',0.7,1.5,0.05,90); %  blue gia ice
obj_coords('s09',0.9,1.5,0.05,90); %  blue gia ice
obj_coords('s10',1.6,2.5,0.05,90); %  blue gia 00
obj_coords('s11',2.7,3,0.05,90); %  blue gia 00
obj_coords('s12',1.9,2,0.05,90); %  blue gia 00
obj_coords('s13',1.9,3,0.05,90); %  blue gia 00
obj_coords('s14',0.5,4.5,0.05,90); %  blue gia rob
obj_coords('s15',2.1,4.5,0.05,90); %  blue gia rob
obj_coords('s16',0,5.5,0.05,90); %  blue gia rob
obj_coords('s17',0.5,5.5,0.05,90); %  blue gia rob
obj_coords('s18',0.9,5.5,0.05,90); %  blue gia rob
obj_coords('s19',2.3,4.5,0.05,90); % blue gia rob
%---------
movetable(1.9,3,1,0);
movetable(1.9,3,0.05,0);
grasp;
movetable(1.9,3,1,0);
movetable(2.12,3.05,1,0);
movetable(2.12,3.05,0.075,0);
leave;
movetable(2.12,3.05,1,0);
%----------
movetable(1.9,2,1,0);
movetable(1.9,2,0.05,0);
grasp;
movetable(1.9,2,1,0);
movetable(2.12,2.25,1,0);
movetable(2.12,2.25,0.075,0);
leave;
movetable(2.12,2.25,1,0);
%----------
movetable(2.7,3,1,0);
movetable(2.7,3,0.05,0);
grasp;
movetable(2.7,3,1,0);
movetable(2.68,3.05,1,0);
movetable(2.68,3.05,0.075,0);
leave;
movetable(2.68,3.05,1,0);
%-----------
movetable(1.6,2.5,1,0);
movetable(1.6,2.5,0.05,0);
grasp;
movetable(1.6,2.5,1,0);
movetable(2.68,2.25,1,0);
movetable(2.68,2.25,0.075,0);
leave
movetable(2.68,2.25,1,0);
%------------------ payla
movetable(0.9,3,1,0);
movetable(0.9,3,0.05,0);
grasp;
movetable(0.9,3,1,0);
movetable(1.5,3.1,1,0);
movetable(1.5,3.1,0.075,0);
leave;
movetable(1.5,3,1,0);
%------------------
movetable(1.5,0.6,1,0);
movetable(1.5,0.6,0.05,0);
grasp;
movetable(1.5,0.6,1,0);
movetable(1.5,1.2,1,0);
movetable(1.5,1.2,0.075,0);
leave;
movetable(1.5,1.2,1,0);
%------------------
movetable(0.9,1.5,1,0);
movetable(0.9,1.5,0.05,0);
grasp;
movetable(0.9,1.5,1,0);
movetable(1.97,1.48,1,0);
movetable(1.97,1.48,0.075,0);
leave;
movetable(1.97,1.48,1,0);
%------------------
movetable(0.7,1.5,1,0);
movetable(0.7,1.5,0.05,0);
grasp;
movetable(0.7,1.5,1,0);
movetable(1.03,1.48,1,0);
movetable(1.03,1.48,0.075,0);
leave;
movetable(1.03,1.48,1,0);
%------------------
movetable(1.5,0.4,1,0);
movetable(1.5,0.4,0.05,0);
grasp;
movetable(1.5,0.4,1,0);
movetable(1.5,1.98,1,0);
movetable(1.5,1.98,0.075,0);
leave;
movetable(1.5,1.98,1,0);
%-----------------
movetable(0.5,1.5,1,0);
movetable(0.5,1.5,0.05,0);
grasp;
movetable(0.5,1.5,1,0);
movetable(1.97,2.26,1,0);
movetable(1.97,2.26,0.075,0);
leave
movetable(1.97,2.26,1,0);
%-----------------
movetable(0.3,1.5,1,0);
movetable(0.3,1.5,0.05,0);
grasp;
movetable(0.3,1.5,1,0);
movetable(1.47,2.26,1,0);
movetable(1.47,2.26,0.075,0);
leave;
movetable(1.47,2.26,1,0);
%----------------
movetable(0.1,1.5,1,0);
movetable(0.1,1.5,0.05,0);
grasp;
movetable(0.1,1.5,1,0);
movetable(1.03,2.26,1,0);
movetable(1.03,2.26,0.075,0);
leave;
movetable(1.03,2.26,1,0);
%----------------
movetable(1.5,0.8,1,0);
movetable(1.5,0.8,0.05,0);
grasp;
movetable(1.5,0.8,1,0);
movetable(1.5,0.96,1,0);
movetable(1.5,0.96,0.075,0);
leave;
movetable(1.5,0.96,1,0);
%---------------
movetable(1.5,4.8,1,0);
movetable(1.5,4.8,0.05,0);
grasp;
movetable(1.5,4.8,1,0);
movetable(1.5,3.7,1,0);
movetable(1.5,3.7,0.075,0);
leave;
movetable(1.5,3.7,1,0);
%----------------
movetable(0.5,4.5,1,0);
movetable(0.5,4.5,0.05,0);
grasp;
movetable(0.5,4.5,1,0);
movetable(1.03,3.98,1,0);
movetable(1.03,3.98,0.075,0);
leave;
movetable(1.03,3.98,1,0);
%---------------
movetable(0.5,3,1,0);
movetable(0.5,3,0.05,0);
grasp;
movetable(0.5,3,1,0);
movetable(0.5,3,1,220);
movetable(1.32,4.02,1,222);
movetable(1.32,4.02,0.075,222);
leave;
movetable(1.32,4.02,1,222);
%----------------
movetable(0.7,3,1,0);
movetable(0.7,3,0.05,0);
grasp;
movetable(0.7,3,1,0);
movetable(1.81,4.05,1,330);
movetable(1.81,4.05,0.075,330);
leave;
movetable(1.81,4.05,1,0);
%----------------
movetable(1.5,5,1,0);
movetable(1.5,5,0.05,0);
grasp;
movetable(1.5,5,1,0);
movetable(1.5,4.5,1,0);
movetable(1.5,4.5,0.075,0);
leave;
movetable(1.5,4.5,1,0);
%----------------
movetable(2.3,4.5,1,0);
movetable(2.3,4.5,0.05,0);
grasp;
movetable(2.3,4.5,1,0);
movetable(1.03,4.78,1,0);
movetable(1.03,4.78,0.075,0);
leave
movetable(1.03,4.78,1,0);
%-----------------
movetable(2.1,4.5,1,0);
movetable(2.1,4.5,0.05,0);
grasp;
movetable(2.1,4.5,1,0);
movetable(1.98,4.78,1,0);
movetable(1.98,4.78,0.075,0);
leave;
movetable(1.98,4.78,1,0);
%-------------------
movetable(1.5,5.2,1,0);
movetable(1.5,5.2,0.05,0);
grasp;
movetable(1.5,5.2,1,0);
movetable(1.5,5.06,1,0);
movetable(1.5,5.06,0.075,0);
leave;
movetable(1.5,5.06,1,0);
%-------------------
movetable(1.5,5.6,1,0);
movetable(1.5,5.6,0.05,0);
grasp;
movetable(1.5,5.6,1,0);
movetable(1.35,5.72,1,0);
movetable(1.35,5.72,0.075,0);
leave;
movetable(1.35,5.72,1,0);
%-------------------
movetable(1.5,5.4,1,0);
movetable(1.5,5.4,0.05,0);
grasp;
movetable(1.5,5.4,1,0);
movetable(1.5,5.16,1,0);
movetable(1.5,5.16,0.075,0);
leave;
movetable(1.5,5.16,1,0);
%-------------------
movetable(0.9,5.5,1,0);
movetable(0.9,5.5,0.05,0);
grasp;
movetable(0.9,5.5,1,0);
movetable(1.03,5.44,1,0);
movetable(1.03,5.44,0.075,0);
leave;
movetable(1.03,5.44,1,0);
%---------------------
movetable(0.5,5.5,1,0);
movetable(0.5,5.5,0.05,0);
grasp;
movetable(0.5,5.5,1,0);
movetable(1.3,5.44,1,0);
movetable(1.3,5.44,0.075,0);
leave;
movetable(1.3,5.44,1,0);
%---------------------
movetable(0,5.5,1,0);
movetable(0,5.5,0.05,0);
grasp;
movetable(0,5.5,1,0);
movetable(1.66,5.44,1,0);
movetable(1.66,5.44,0.075,0);
leave;
movetable(1.66,5.44,1,0);
%----------------------