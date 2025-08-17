import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:layout_widgets/core/mixins/mixin_enums.dart';

// mixin StateMixin<T> on ChangeNotifier {
//   StateStatus _status = StateStatus.initial;
//   ErrorType? _lastErrorType;

//   StateStatus get status => _status;
//   ErrorType? get lastErrorType => _lastErrorType;

//   void _setState(StateStatus newStatus, {ErrorType? errorType}) {
//     _status = newStatus;
//     _lastErrorType = errorType;
//     notifyListeners();
//   }

//   Future<void> execute(Future<T> Function() operation) async {
//     _setState(StateStatus.loading);
//     try {
//       await operation();
//       _setState(StateStatus.success);
//     } on FormatException {
//       _setState(StateStatus.error, errorType: ErrorType.validation);
//     } on TimeoutException {
//       _setState(StateStatus.error, errorType: ErrorType.network);
//     } catch (e) {
//       _setState(StateStatus.error, errorType: ErrorType.unknown);
//     }
//   }
// }
