%Script δήλωσης της θέσης του κάθε αντικειμένου
global sel

if sel ~= 3
    error('This function is to be used only in SCARA arm!')
end

leave
clear_obj
obj_coords('b01',0.5,0.4,0.025,0)
obj_coords('b02',0.5,0.6,0.025,0)
obj_coords('b03',0.5,0.8,0.025,0)
obj_coords('b04',0.5,1,0.025,0)
obj_coords('b05',1.5,0.3,0.025,0)
obj_coords('b06',1.5,0.5,0.025,0)
obj_coords('b07',1.5,0.7,0.025,0)
obj_coords('b08',1.5,0.9,0.025,0)
obj_coords('b09',1.5,5,0.025,0)
obj_coords('b10',1.5,5.2,0.025,0)
obj_coords('b11',1.5,5.4,0.025,0)
obj_coords('b12',1.5,5.6,0.025,0)
obj_coords('s01',0.5,5.8,0.025,0)
obj_coords('s02',0.5,5.6,0.025,0)
obj_coords('s03',0.5,5.4,0.025,0)
obj_coords('s04',0.5,5.2,0.025,0)
obj_coords('s05',0.5,5,0.025,0)
obj_coords('s06',0.5,4.8,0.025,0)
obj_coords('s07',0.5,4.6,0.025,0)
obj_coords('s08',0.5,4.4,0.025,0)
obj_coords('s09',0.5,4.2,0.025,0)
obj_coords('s10',0.5,4,0.025,0)
obj_coords('s11',1.5,4,0.025,0)
obj_coords('s16',1.5,4.8,0.025,0)
obj_coords('s17',1.5,4.6,0.025,0)
obj_coords('s18',1.5,4.4,0.025,0)
obj_coords('s19',1.5,4.2,0.025,0)