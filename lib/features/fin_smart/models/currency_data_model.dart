import 'package:equatable/equatable.dart';
import 'package:layout_widgets/features/fin_smart/enums/enums.dart';

class CurrencyData extends Equatable {
  final CurrencyCode currencyCode;
  final String symbol;
  final String emoji;

  const CurrencyData({
    required this.currencyCode,
    required this.symbol,
    required this.emoji,
  });

  String get name => currencyCode.code;

  @override
  List<Object?> get props => [currencyCode, symbol, emoji];
}
