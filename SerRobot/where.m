function c=where(frame)
%Συνάρτηση η οποία εμφανίζει τις συντεταγμένες της τρέχουσας θέσης του
%άκρου του ενεργοποιημένου βραχίονα, ως προς το αδρανειακό πλαίσιο world 
%ή και table για το βραχίοαν SCARA
%where('w') -> πλαίσιο αξόνων world {0}
%where('t') -> πλαίσιο αξόνων table (SCARA)

global CURRENT_Q
global sel

if sel == 1
    
    if frame == 'w'        
        c = f_kine2l(CURRENT_Q(1),CURRENT_Q(2));
    else
        error('Input on FLAT 2 LINKS robotic arm, can be only "w", for world coordinates.')
    end
    
elseif sel == 2
    
    if frame == 'w'    
        c = f_kine3l(CURRENT_Q(1),CURRENT_Q(2),CURRENT_Q(3));
    else        
        error('Input on FLAT 3 LINKS robotic arm, can be only "w", for world coordinates.')
    end

elseif sel == 3
    
    if frame == 'w'        
        c = f_kinescara(CURRENT_Q(1),CURRENT_Q(2),CURRENT_Q(3),CURRENT_Q(4));
    elseif frame == 't'        
        info_frames;
        coordinates_world = f_kinescara(CURRENT_Q(1),CURRENT_Q(2),CURRENT_Q(3),CURRENT_Q(4));
        coordinates_t = inv(g0T)*[coordinates_world 1]';
        c = [coordinates_t(1) coordinates_t(2) coordinates_t(3)];
    else
        error('Wrong input! Please insert "w" for world coordinates, or "t" for table coordinates.')
    end
    
end