global sel

if sel ~= 3
    error('This function is to be used only in SCARA arm!')
end

leave
clear_obj
obj_coords('co1',1,1,0.25,0)