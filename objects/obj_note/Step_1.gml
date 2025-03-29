if obj_persistent.downscroll=false {
    var flip=-48*obj_playtest.notespeed
} else {
    var flip=48*obj_playtest.notespeed
}

if place_meeting(x,y+flip,obj_note) && obj_playtest.songpos>0 {
    if obj_persistent.downscroll=false {
        var noteabove = -1
        var noteabove = instance_position(x,y+flip,obj_note) //gets the id of the note above it
        if instance_exists(noteabove) {
            if (noteabove.y>=obj_uinotes.y-(32*obj_playtest.notespeed)) && (noteabove.type=1 || noteabove.type=2 || noteabove.type=3 || noteabove.type=8 || noteabove.type=9) {
                hitable=false;
                //image_blend=c_red
            } else {
                hitable=true;
                //image_blend=c_white
            }
        } else {
            hitable=true;
            //image_blend=c_white
        }
    } else {
        var noteabove = -1
        var noteabove = instance_position(x,y+flip,obj_note) //gets the id of the note above it
        if instance_exists(noteabove) {
            if (noteabove.y<=obj_uinotes.y+(32*obj_playtest.notespeed)) && (noteabove.type=1 || noteabove.type=2 || noteabove.type=3 || noteabove.type=8 || noteabove.type=9) {
                hitable=false;
                //image_blend=c_red
            } else {
                hitable=true;
                //image_blend=c_white
            }
        } else {
            hitable=true;
            //image_blend=c_white
        }
    }
} else {
    hitable=true;
    //image_blend=c_white
}