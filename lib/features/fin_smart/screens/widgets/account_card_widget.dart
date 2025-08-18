part of '../finance_page.dart';

class AccountCard extends StatelessWidget {
  final String name;
  final double balance;
  final String currency;

  const AccountCard({
    super.key,
    required this.name,
    required this.balance,
    required this.currency,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          const Spacer(),
          Text('$currency $balance', style: const TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
