import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';

abstract class BasLogger {
  @protected
  late Logger _logger;
  @protected
  final DateFormat _dateFormat = DateFormat('H:m:s.S');
  static const appName = "Singleton_Pattern_example";
  void log(message, [Object? error, StackTrace? stackTrace]) {
    _logger.info(message, error, stackTrace);
  }
}

class DebugLogger extends BasLogger {
  //private constructor
  DebugLogger._internal() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen(_recordHandler);
    _logger = Logger(BasLogger.appName);
    debugPrint("<DebugLogger>creation");
    _instance = this;
  }
  //static instance
  static  DebugLogger _instance = DebugLogger._internal();
  //lazy instantation
  factory DebugLogger() => _instance;
  void _recordHandler(LogRecord record) {
    debugPrint(
        "${_dateFormat.format(record.time)}:${record.message},${record.error}");
  }
}
