part of '../travel_page.dart';

class CardBadge extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;

  const CardBadge({
    super.key,
    required this.text,
    this.backgroundColor = const Color.fromRGBO(0, 0, 0, 0.5),
    this.textColor = Colors.white,
    this.fontSize = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimens.spaceSmall,
        vertical: Dimens.spaceMicro,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(Dimens.borderRadiusMedium),
      ),
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
