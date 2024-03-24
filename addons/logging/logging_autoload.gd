## A singleton that can be used for logging purposes.
@tool
extends Node

var _logger: Logger

func _ready() -> void:
	_logger = Logger.new("root", LoggingConfig.logger_level)

## Prints a log with the severity debug.
func debug(fmt: String, args: Array = []) -> void:
	assert(is_instance_valid(_logger))
	_logger.debug(fmt, args)

## Prints a log with the severity info.
func info(fmt: String, args: Array = []) -> void:
	assert(is_instance_valid(_logger))
	_logger.info(fmt, args)

## Prints a log with the severity warning.
func warning(fmt: String, args: Array = []) -> void:
	assert(is_instance_valid(_logger))
	_logger.warning(fmt, args)

## Prints a log with the severity error.
func error(fmt: String, args: Array = []) -> void:
	assert(is_instance_valid(_logger))
	_logger.error(fmt, args)

## Prints a log with the severity critical.
func critical(fmt: String, args: Array = []) -> void:
	assert(is_instance_valid(_logger))
	_logger.critical(fmt, args)
