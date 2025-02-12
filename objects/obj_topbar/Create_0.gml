// i think this is probably the dumbest way to make a topbar like this
// atleast i can add whatever and it'll just work! heckles yeah

barstruct = { // dude fuck gamemaker

	A_File : ["New","Save","Save As","Exit"],
	
	// had the other options for seeing how the menu would look
	// planning on adding undo and redo at some point (copying too)
	
	B_Help : ["Documentation"],
	//Edit : ["Undo","Redo"],
	//View : ["sorry nothing"]
	
	C_Tools : ["Toggle Metronome", "Toggle Hitsounds"]
}

keys = ["File","Help","Tools"]
realkeys = variable_struct_get_names(barstruct)
array_sort(realkeys,true)

length = array_length(keys)

barwidth = [0]
var wid = 0; var pad = 0
draw_set_font(fnt_big)
for (var i = 0; i<length; i++) {
		wid+= string_width(keys[i])
		pad+=16
		array_push(barwidth,wid+pad)
}

print(barwidth)

inrange = false
inrange2 = false
menuopen = noone
selected = -1
width = 0

curcat = 0
curopt = 0