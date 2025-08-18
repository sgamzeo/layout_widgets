part of '../finance_page.dart';

class TransactionActionButton extends StatelessWidget {
  final VoidCallback onPressed;

  const TransactionActionButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Dimens.paddingSmall,
      child: CustomButton(text: "New Transaction", onPressed: onPressed),
    );
  }
}
