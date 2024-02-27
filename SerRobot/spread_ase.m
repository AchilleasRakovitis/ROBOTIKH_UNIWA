global sel

if sel ~= 3
    error('This function is to be used only in SCARA arm!')
end
leave
clear_obj
obj_coords('A01',2,1.5,0.25/2,0)
obj_coords('A02',1,5.5,0.25/2,0)
obj_coords('A03',0.5,1,0.25/2,0)
obj_coords('A04',0.5,5.5,0.25/2,0)
obj_coords('A05',2.5,3.5,0.25/2,0)
obj_coords('A06',1,3,0.25/2,0)
obj_coords('A07',2,5,0.25/2,0)

