extends Control

@export var test_critical := false

@onready var logger_node = $LoggerNode

var logger: Logger

func _ready() -> void:
	logger = logger_node.logger
	logging_example1()
	logging_example2()
	$MarginContainer/VBoxContainer/DebugButton.pressed.connect(
		_on_logging_button_pressed.bind(logger.debug, "This is a debug message")
	)
	$MarginContainer/VBoxContainer/InfoButton.pressed.connect(
		_on_logging_button_pressed.bind(logger.info, "This is an info message")
	)
	$MarginContainer/VBoxContainer/WarningButton.pressed.connect(
		_on_logging_button_pressed.bind(logger.warning, "This is a warning message")
	)
	$MarginContainer/VBoxContainer/ErrorButton.pressed.connect(
		_on_logging_button_pressed.bind(logger.error, "This is an error message")
	)
	$MarginContainer/VBoxContainer/CriticalButton.pressed.connect(
		_on_logging_button_pressed.bind(logger.critical, "This is a critical message")
	)

func logging_example1() -> void:
	logger.debug("Inside logging_example")
	logger.info("Inside logging_example")
	logger.warning("Warning inside logging_example")
	logger.error("Error inside logging_example")
	if test_critical:
		logger.critical("Critical error inside logging_example")

func logging_example2() -> void:
	var _logger := Logger.new(Logger.Level.INFO, "main2", func(_m): pass,
		"{level} {name}: {msg}", "")
	_logger.info("I ate %d donuts.", [50])

func _on_logging_button_pressed(fn: Callable, msg: String) -> void:
	fn.call(msg)
