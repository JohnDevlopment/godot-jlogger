extends CenterContainer

var some_var := 1

func _ready() -> void:
	_logging_function_1()

func _logging_function_1() -> void:
	var logger :=  Logging.get_logger()
	logger.debug("This is a log.")
	logger.info("This is a log.")
	logger.warning("This is a log.")
	logger.error("This is a log.")
	if ProjectSettings.get_setting_with_override("application/run/project/enable_critical"):
		logger.critical("This is a log.")

func _logging_function_2() -> void:
	Logging.debug("This is a log.")
	Logging.info("This is a log.")
	Logging.warning("This is a log.")
	Logging.error("This is a log.")
	if ProjectSettings.get_setting_with_override("application/run/project/enable_critical"):
		Logging.critical("This is a log.")
