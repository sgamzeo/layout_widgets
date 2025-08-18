part of '../finance_page.dart';

class AccountsSection extends StatelessWidget {
  const AccountsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          AccountCard(name: 'Cash', balance: 500, currency: '₺'),
          AccountCard(name: 'Bank', balance: 1500, currency: '₺'),
          AccountCard(name: 'Credit Card', balance: -200, currency: '₺'),
        ],
      ),
    );
  }
}
