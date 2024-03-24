## Base class for all loggers.
@tool
extends RefCounted
class_name Logger

## Logging level enumeration.
enum Level {
	DEBUG,
	INFO,
	WARNING,
	ERROR,
	CRITICAL
}

## Logging level.
## See ["addons/logging/logging.gd"]
var level: Level

## Name of the logger.
var name: String

## Format of the logger's messages.
var format: String

## Format of the date string.
var datetime_format: String

var _colors: Array[StringName] = []

## Construct a logger with the given [param name] and [param level].
func _init(name: String, level: Level) -> void:
	var config := LoggingConfig.as_dict()

	# Set colors
	for ln in Level.keys():
		var level_name := (ln as String).to_lower()
		var key := "colors/%s" % level_name
		var color: StringName = config[key]
		_colors.append(color)

	self.format = config['logger/format']
	self.name = name
	self.level = level
	self.datetime_format = config['logger/datetime_format']

func _log_internal(msg: String, log_level: Level) -> void:
	if _check_level(log_level):
		var color := _colors[log_level]
		var fields := {
			msg = msg,
			level = "[color=%s]%s[/color]" % [color, Level.find_key(log_level)],
			date = _format_datetime_string(),
			name = name
		}
		print_rich(format.format(fields))
		if log_level == Level.CRITICAL:
			if OS.has_feature("editor"):
				assert(log_level != Level.CRITICAL)
			else:
				_crash_or_not(format.format(fields))

func _crash_or_not(msg: String) -> void:
	if ProjectSettings.get_setting("logging/jlogger/editor/crash_on_critical"):
		OS.crash(msg)

func _formate_datetime_string():
	var fields := Time.get_datetime_dict_from_system()
	for key in ["hour", "minute", "second"]:
		fields[key] = "%02d" % fields[key]
	fields['timezone'] = Time.get_time_zone_from_system().name
	return datetime_format.format(fields)

func _format_message_string(fmt: String, args: Array = []) -> String:
	if args:
		return fmt % args
	return fmt

func _check_level(level: Level) -> bool:
	return level >= self.level

## Print a logging message with the severity 'debug'.
func debug(fmt: String, args: Array = []) -> void:
	var msg := _format_message_string(fmt, args)
	_log_internal(msg, Level.DEBUG)

## Print a logging message with the severity 'info'.
func info(fmt: String, args: Array = []) -> void:
	var msg := _format_message_string(fmt, args)
	_log_internal(msg, Level.INFO)

## Print a logging message with the severity 'error'.
func error(fmt: String, args: Array = []) -> void:
	var msg := _format_message_string(fmt, args)
	_log_internal(msg, Level.ERROR)

## Print a logging message with the severity 'warning'.
func warning(fmt: String, args: Array = []) -> void:
	var msg := _format_message_string(fmt, args)
	_log_internal(msg, Level.WARNING)

## Print a logging message with the severity 'critical'.
## This comes with the side effect of killing the process.
func critical(fmt: String, args: Array = []) -> void:
	var msg := _format_message_string(fmt, args)
	_log_internal(msg, Level.CRITICAL)
