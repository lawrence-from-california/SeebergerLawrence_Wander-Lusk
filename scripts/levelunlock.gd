extends Node
class_name lvlunlock


const save_path: String = "user://SAVEDATA.save"
var levelsunlocked: Array

func  _ready() -> void:
	_load_data()


func _save()-> void:
	var file: FileAccess = FileAccess.open_encrypted_with_pass(save_path, FileAccess.WRITE,"f84ryf9ehuierfhriPANCAKE12")
	file.store_var(levelsunlocked)
	file.close()

func _load_data()->void:
	if FileAccess.file_exists(save_path):
		var file: FileAccess=FileAccess.open_encrypted_with_pass(save_path,FileAccess.READ,"f84ryf9ehuierfhriPANCAKE12")
		levelsunlocked=file.get_var()
		file.close()
	else:
		print ("no data")
		levelsunlocked.clear()
		
		
func _delete_everything_forever()->void:
	levelsunlocked.clear()
	_save()
