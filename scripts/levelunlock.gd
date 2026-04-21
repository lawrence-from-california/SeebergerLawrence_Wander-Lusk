extends Node
class_name lvlunlock


var save_path: String = "user://SAVE/"
var contents: Dictionary = {
	"levels_unlocked": 0.0
	}

var tutorial: bool =false
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
	file.store_var(contents.duplicate())
	file.close()
	#file.store_var(tutorial)
	#file.store_var(beach1)
	#file.store_var(beach2)
	#file.store_var(beach2b)
	#file.store_var(winter1)
	#file.store_var(winter2a)
	#file.store_var(winter2b)
	#file.store_var(classic1)
	#file.store_var(classic2)
	#file.store_var(classic3)
#func load_data()->void:
	#if FileAccess.file_exists(save_path):
		#var file: FileAccess = FileAccess.open(save_path, FileAccess.READ)
		#var data: Variant = file.get_var()
		#file.close()
		#var savedata: Variant = data.duplicate
		#contents.levels_unlocked = savedata.levels_unlocked
	#if FileAccess.file_exists(save_path):
		#var file: FileAccess = FileAccess.open(save_path, FileAccess.READ)
		#tutorial = file.get_var(tutorial)
	#if FileAccess.file_exists(save_path):
		#var file: FileAccess = FileAccess.open(save_path, FileAccess.READ)
		#tutorial = file.get_var(beach1)
	#if FileAccess.file_exists(save_path):
		#var file: FileAccess = FileAccess.open(save_path, FileAccess.READ)
		#tutorial = file.get_var(beach2)
	#if FileAccess.file_exists(save_path):
		#var file: FileAccess = FileAccess.open(save_path, FileAccess.READ)
		#tutorial = file.get_var(beach2b)
	#if FileAccess.file_exists(save_path):
		#var file: FileAccess = FileAccess.open(save_path, FileAccess.READ)
		#tutorial = file.get_var(winter1)
	#if FileAccess.file_exists(save_path):
		#var file: FileAccess = FileAccess.open(save_path, FileAccess.READ)
		#tutorial = file.get_var(winter2a)
	#if FileAccess.file_exists(save_path):
		#var file: FileAccess = FileAccess.open(save_path, FileAccess.READ)
		#tutorial = file.get_var(winter2b)
	#if FileAccess.file_exists(save_path):
		#var file: FileAccess = FileAccess.open(save_path, FileAccess.READ)
		#tutorial = file.get_var(classic1)
	#if FileAccess.file_exists(save_path):
		#var file: FileAccess = FileAccess.open(save_path, FileAccess.READ)
		#tutorial = file.get_var(classic2)
	#if FileAccess.file_exists(save_path):
		#var file: FileAccess = FileAccess.open(save_path, FileAccess.READ)
		#tutorial = file.get_var(classic3)
	#else:
		#tutorial = false		
 #
