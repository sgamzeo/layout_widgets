import 'package:layout_widgets/features/fin_smart/models/transaction_model.dart';
import 'package:layout_widgets/features/fin_smart/enums/enums.dart';

class TransactionRepository {
  Future<List<Transaction>> fetchTransactions() async {
    await Future.delayed(const Duration(milliseconds: 500));

    return [
      Transaction(
        type: TransactionType.income,
        category: Category.salary,
        amount: 5000.0,
        date: DateTime.now().subtract(const Duration(days: 1)),
        description: 'Monthly salary',
      ),
      Transaction(
        type: TransactionType.expense,
        category: Category.food,
        amount: 50.0,
        date: DateTime.now().subtract(const Duration(days: 2)),
        description: 'Lunch at cafe',
      ),
      Transaction(
        type: TransactionType.expense,
        category: Category.transport,
        amount: 15.5,
        date: DateTime.now().subtract(const Duration(days: 3)),
        description: 'Taxi ride',
      ),
      Transaction(
        type: TransactionType.income,
        category: Category.investmentIncome,
        amount: 200.0,
        date: DateTime.now().subtract(const Duration(days: 4)),
        description: 'Stock dividends',
      ),
      Transaction(
        type: TransactionType.expense,
        category: Category.entertainment,
        amount: 120.0,
        date: DateTime.now().subtract(const Duration(days: 5)),
        description: 'Movie tickets',
      ),
    ];
  }
}
