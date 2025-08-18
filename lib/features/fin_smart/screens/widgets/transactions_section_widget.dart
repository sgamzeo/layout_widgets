part of '../finance_page.dart';

class TransactionsSection extends StatelessWidget {
  const TransactionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: const [
          TransactionTile(
            title: 'Salary',
            amount: 5000,
            type: TransactionType.income,
            category: Category.salary,
          ),
          TransactionTile(
            title: 'Lunch',
            amount: 50,
            type: TransactionType.expense,
            category: Category.food,
          ),
          TransactionTile(
            title: 'Taxi',
            amount: 15.5,
            type: TransactionType.expense,
            category: Category.transport,
          ),
        ],
      ),
    );
  }
}
