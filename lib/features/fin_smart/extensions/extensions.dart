import 'package:layout_widgets/features/fin_smart/enums/enums.dart';

extension CurrencyCodeExtensions on CurrencyCode {
  String get emoji {
    const emojis = {
      CurrencyCode.usd: '💵',
      CurrencyCode.eur: '💶',
      CurrencyCode.gbp: '💷',
      CurrencyCode.tryCurrency: '🇹🇷',
      CurrencyCode.jpy: '💴',
    };
    return emojis[this] ?? '?';
  }

  String get symbol {
    const symbols = {
      CurrencyCode.usd: r'$',
      CurrencyCode.eur: '€',
      CurrencyCode.gbp: '£',
      CurrencyCode.tryCurrency: '₺',
      CurrencyCode.jpy: '¥',
    };
    return symbols[this] ?? '';
  }
}
