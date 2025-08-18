import 'package:layout_widgets/features/fin_smart/models/account_model.dart';
import 'package:layout_widgets/features/fin_smart/enums/enums.dart';

class AccountRepository {
  Future<List<Account>> fetchAccounts() async {
    await Future.delayed(const Duration(milliseconds: 500));

    return [
      Account(name: 'Cash Wallet', type: AccountType.cash, balance: 250.0),
      Account(name: 'Bank Account', type: AccountType.bank, balance: 1200.5),
      Account(
        name: 'Credit Card',
        type: AccountType.creditCard,
        balance: -150.75,
      ),
      Account(name: 'Savings', type: AccountType.savings, balance: 5000.0),
      Account(
        name: 'Investment',
        type: AccountType.investment,
        balance: 3200.0,
      ),
      Account(
        name: 'Digital Wallet',
        type: AccountType.digitalWallet,
        balance: 75.0,
      ),
    ];
  }
}
