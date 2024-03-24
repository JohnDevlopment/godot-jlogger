@tool
extends EditorPlugin

func _enter_tree() -> void:
	add_autoload_singleton("LoggingConfig", "res://addons/logging/LoggingConfig.gd")
	add_autoload_singleton("Logging", "res://addons/logging/logging_autoload.gd")

func _exit_tree() -> void:
	remove_autoload_singleton("Logging")
	remove_autoload_singleton("LoggingConfig")
