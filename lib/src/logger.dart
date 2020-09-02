import 'package:flutter/material.dart';
import 'package:stack_trace/stack_trace.dart';

/// The source of this class belongs to JUNTO app
/// Top level methods to log into app with method name.
abstract class Logger {
  const Logger();

  void logDebug(String msg);
  void logError(String msg);
  void logException(dynamic ex, [StackTrace stackTrace, String msg]);
  void logWarning(String msg);
  void logInfo(String msg);
}

class PrintLogger extends Logger {
  String getMethodName() {
    final frames = Trace.current().frames;
    final frame = frames[0].member;

    return '[$frame]';
  }

  @override
  void logDebug(String msg) {
    final meta = getMethodName();
    debugPrint('[DEBUG] $meta: $msg');
  }

  @override
  void logError(String msg) {
    final meta = getMethodName();
    debugPrint('[ERROR] $meta: $msg');
  }

  @override
  void logException(ex, [StackTrace stackTrace, String msg]) {
    if (msg != null) {
      debugPrint(msg);
    }

    if (ex is Error) {
      debugPrint(ex.toString());
    }

    if (stackTrace != null) {
      debugPrint(stackTrace.toString());
    }
  }

  @override
  void logInfo(String msg) {
    final meta = getMethodName();
    debugPrint('[INFO] $meta: $msg');
  }

  @override
  void logWarning(String msg) {
    final meta = getMethodName();
    debugPrint('[WARNING] $meta: $msg');
  }
}

Logger logger = PrintLogger();
