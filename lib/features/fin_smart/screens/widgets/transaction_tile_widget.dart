part of '../finance_page.dart';

class TransactionTile extends StatelessWidget {
  final String title;
  final double amount;
  final TransactionType type;
  final Category category;

  const TransactionTile({
    super.key,
    required this.title,
    required this.amount,
    required this.type,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final isIncome = type == TransactionType.income;
    return ListTile(
      leading: Icon(
        isIncome ? Icons.arrow_downward : Icons.arrow_upward,
        color: isIncome ? Colors.green : Colors.red,
      ),
      title: Text(title),
      trailing: Text('${isIncome ? '+' : '-'}\$${amount.toStringAsFixed(2)}'),
    );
  }
}
