global sel

if sel ~= 3
    error('This function is to be used only in SCARA arm!')
end

leave
clear_obj
obj_coords('pla',0.5,0.5,0,0)
obj_coords('cy1',0.5,3.5,0.05,0)
obj_coords('cb1',0.5,4.5,0.05,0)
obj_coords('cg1',1.5,3.5,0.05,0)
obj_coords('cr1',1.5,4.5,0.05,0)