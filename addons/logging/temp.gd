@tool
extends EditorScript

# Called when the script is executed (using File -> Run in Script Editor).
func _run() -> void:
	ProjectSettings.save_custom("res://override.cfg")
