extends Container

var some_var := 1

func _ready() -> void:
	_logging_function_1()
	_logging_function_2()

func _logging_function_1() -> void:
	var logger :=  Logging.get_logger("main")
	logger.debug("This is a log.")
	logger.info("This is a log.")
	logger.warning("This is a log.")
	logger.error("This is a log.")
	logger.crash_behavior = func(msg: String):
		print("Critical message: ", msg)
	logger.critical("This is a log.")

func _logging_function_2() -> void:
	Logging.debug("This is a log.")
	Logging.info("This is a log.")
	Logging.warning("This is a log.")
	Logging.error("This is a log.")
	Logging.critical("This is a log.")

#func _logging_function_3() -> void:
	#var logger :=  Logging.get_logger()
	#logger.debug("This is a log.")
	#logger.info("This is a log.")
	#logger.warning("This is a log.")
	#logger.error("This is a log.")
	#logger.critical("This is a log.")
#
#func _logging_function_4() -> void:
	#Logging.debug("This is a log.")
	#Logging.info("This is a log.")
	#Logging.warning("This is a log.")
	#Logging.error("This is a log.")
	#Logging.critical("This is a log.")
