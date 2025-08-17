import 'package:layout_widgets/core/mixins/mixin_enums.dart';
import 'package:logger/logger.dart';

mixin LoggerMixin {
  static final Logger _logger = Logger();

  void _log(LogLevel level, String message, {dynamic error}) {
    final prefix = switch (level) {
      LogLevel.debug => '🐛 [DEBUG]',
      LogLevel.info => 'ℹ️ [INFO]',
      LogLevel.warning => '⚠️ [WARNING]',
      LogLevel.error => '🔥 [ERROR]',
    };

    _logger.log(
      switch (level) {
        LogLevel.debug => Level.debug,
        LogLevel.info => Level.info,
        LogLevel.warning => Level.warning,
        LogLevel.error => Level.error,
      },
      '$prefix $message',
      error: error,
    );
  }

  void logDebug(String message) => _log(LogLevel.debug, message);
  void logError(String message, {dynamic error}) =>
      _log(LogLevel.error, message, error: error);
}
