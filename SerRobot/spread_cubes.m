global sel

if sel ~= 3
    error('This function is to be used only in SCARA arm!')
end

leave
clear_obj
obj_coords('qr1',1,4,0.1,0)
obj_coords('qg1',2,5,0.1,0)
obj_coords('qb1',2,3,0.1,0)
obj_coords('qw1',2.5,4.2,0.1,0)
obj_coords('pla',0.5,5.5,0,0)
obj_coords('ob1',0.5,2,0.4,0)
obj_coords('ob2',2.75,2,0.4,0)