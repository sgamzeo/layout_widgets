import 'package:flutter/material.dart';
import 'package:layout_widgets/core/components/custom_button.dart';
import 'package:layout_widgets/core/constants/dimens.dart';
import 'package:layout_widgets/features/fin_smart/enums/enums.dart';
part './widgets/account_card_widget.dart';
part './widgets/accounts_section.dart';
part './widgets/transaction_tile_widget.dart';

part './widgets/transactions_section_widget.dart';
part './widgets/transaction_action_button.dart';

class FinancePage extends StatelessWidget {
  const FinancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FinSmart'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // const WelcomeSection(),
            const SizedBox(height: 16),
            const AccountsSection(),
            const SizedBox(height: 16),
            const TransactionsSection(),
            TransactionActionButton(
              onPressed: () {
                print("Yeni işlem eklendi!");
              },
            ),
          ],
        ),
      ),
    );
  }
}
