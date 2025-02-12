if obj_persistent.downscroll=false {
    instance_deactivate_region(-room_width,-600,room_width*2,1800+(y*-1),false,true)
    instance_activate_region(-room_width,-600,room_width*2,1800+(y*-1),true)
    //instance_activate_region(-room_width,-600,room_width*2,1800,true)
} else {
    instance_deactivate_region(-room_width,-600+(y*-1),room_width*2,1800+y,false,true)
    instance_activate_region(-room_width,-600+(y*-1),room_width*2,1800+y,true)
    //instance_activate_region(-room_width,-600+(y*-1),room_width*2,1800+y,true)
}
alarm[0]=5