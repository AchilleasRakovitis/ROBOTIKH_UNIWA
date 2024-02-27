global sel

if sel ~= 3
    error('This function is to be used only in SCARA arm!')
end

leave
clear_obj
obj_coords('qr1',0,0,0.1,0)
obj_coords('lab',0,0,0,0)