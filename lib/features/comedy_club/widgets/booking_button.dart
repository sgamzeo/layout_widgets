import 'package:flutter/material.dart';
import 'package:layout_widgets/core/components/custom_button.dart';
import 'package:layout_widgets/core/constants/dimens.dart';

class BookingButton extends StatelessWidget {
  const BookingButton({super.key, required this.theme});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Dimens.paddingLarge,
      child: CustomButton(
        onPressed: () => _bookTickets(context),
        text: 'Book Tickets Now',
        variant: ButtonVariant.primary,
        size: ButtonSize.large,
        leadingIcon: Icon(Icons.emoji_emotions),
      ),
    );
  }

  void _bookTickets(BuildContext context) {
    // TODO: Implement booking functionality
  }
}
