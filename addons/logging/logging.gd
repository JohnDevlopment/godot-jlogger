@tool
extends EditorPlugin

func _set_project_settings() -> void:
	const SETTINGS := [
		{
			name = "logging/jlogger/editor/crash_on_critical",
			initial_value = true,
			type = TYPE_BOOL,
			advanced = false,
			restart = false
		}
	]
	
	for setting in SETTINGS:
		if not ProjectSettings.has_setting(setting.name):
			ProjectSettings.set_setting(setting.name, setting.initial_value)
			ProjectSettings.set_initial_value(setting.name, setting.initial_value)
		ProjectSettings.add_property_info(setting)
		ProjectSettings.set_as_basic(setting.name, !setting.advanced)
		ProjectSettings.set_restart_if_changed(setting.name, setting.restart)

func _enter_tree() -> void:
	add_autoload_singleton("Logging", "res://addons/logging/logging_autoload.gd")
	_set_project_settings()

func _exit_tree() -> void:
	remove_autoload_singleton("Logging")
