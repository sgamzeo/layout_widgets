enum AccountType { cash, bank, creditCard, savings, investment, digitalWallet }

enum TransactionType { income, expense, transfer, refund, investmentIncome }

enum Category {
  food,
  bills,
  transport,
  entertainment,
  healthcare,
  education,
  shopping,
  travel,
  utilities,
  others,
  salary,
  investmentIncome,
}

enum CurrencyCode {
  usd('USD', 'US Dollar'),
  eur('EUR', 'Euro'),
  gbp('GBP', 'British Pound'),
  tryCurrency('TRY', 'Turkish Lira'),
  jpy('JPY', 'Japanese Yen');

  final String code;
  final String fullName;

  const CurrencyCode(this.code, this.fullName);

  static CurrencyCode? fromCode(String code) {
    try {
      return values.firstWhere((v) => v.code == code.toUpperCase());
    } catch (e) {
      return null;
    }
  }
}
