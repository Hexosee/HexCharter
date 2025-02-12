// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function playtest_load_song(songname) {
	with (obj_playtest) {
		filename=$"charts/{songname}/chart.swows"
		song = audio_create_stream($"{working_directory}charts/{songname}/song.ogg")
	
		file=file_text_open_read(filename)
		file_text_readln(file) 
		bpm=file_text_read_real(file)
		file_text_readln(file)
		notespeed=file_text_read_real(file)
		file_text_readln(file)
		file_text_readln(file) 
	
		//note loading variables
		var b; //down
		var bb; //across
		var songlong=chart_get_songlong(song,bpm)
		var dosc=((obj_persistent.downscroll)*-2)+1 //vertical multiplier
		var nosp=notespeed //notespeed with no identifier
		//note starting position
		if dosc!=-1 {
		    starty=48
		} else {
		    starty=352
		}
		y=starty
		//load notes
		for (bb=0;bb<8;bb++) {
		    //x position
		    if bb<4 {
		        var myx=32+(44*bb)
		    } else {
		        var myx=234+(44*(bb-4))
		    }
		    //ui notes
		    var sucker=instance_create_depth(myx,starty,0,obj_uinotes);
		    sucker.note=bb;
		    //note... notes
		    for (b=0; b<songlong; b++) {
		        if b=0 {
		            var event=0
		        }
		        note[bb,b]=file_text_read_real(file)
		        file_text_readln(file)
		        if note[bb,b]!=0 {
		            //create note
		            var dingus=instance_create_depth(myx,starty+(b*48*nosp*dosc),0,obj_note); 
		            dingus.note=bb
		            dingus.type=note[bb,b]
		            //position holding
		            dingus.xx=dingus.x
		            dingus.yy=dingus.y
		            //solid checking
		            if note[bb,b]=4 or note[bb,b]=5 or note[bb,b]=6 or note[bb,b]=7 or note[bb,b]=10 or note[bb,b]=11 {
		                dingus.solid=false
		            } else {
		                dingus.solid=true
		            }
		            //event note
		            if note[bb,b]=10 {
		                dingus.event=event
		                event++
		            }
		        }
		    }
		}
		file_text_close(file)
		
		songplaying = audio_play_sound(song,0,false)
	}
}