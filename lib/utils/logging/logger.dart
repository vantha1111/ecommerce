
 import 'package:logger/logger.dart';

class ULoggerhelper {
  static final Logger logger = Logger (
    printer: PrettyPrinter(),
    //custom the log level based on your need
    level: Level.debug,
  );

  static void  debug(String message) {
    logger.d(message);
  }

  static void info(String message) {
    logger.i(message
    );
  }

  static void warning(String message) {
    logger.w(message
    );
  }

  static void error(String message, [dynamic error]) {
    logger.e(message, error: error, stackTrace: StackTrace.current);
  }
 }