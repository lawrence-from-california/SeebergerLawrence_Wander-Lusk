extends Node
class_name lvlunlock

var save_path: String = "res://SAVE/"


var tutorial: bool =false
var tutorial_win: bool =false
var tutorial_best: int

var beach1: bool = false
var beach2:bool=false
var beach2b: bool = false
var winter1: bool = false
var winter2a: bool=false
var winter2b: bool=false
var classic1: bool = false
var classic2:bool = false
var classic3:bool= false

func save()-> void:
	var file: FileAccess = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(tutorial)
	file.store_var(tutorial)
	file.store_var(tutorial)
	file.store_var(tutorial)
	file.store_var(tutorial)
	file.store_var(tutorial)
	
func load_data()->void:
	if FileAccess.file_exists(save_path):
		var file: FileAccess = FileAccess.open(save_path, FileAccess.READ)
		tutorial = file.get_var(tutorial)
		
	else:
		tutorial = false		
 
