import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layout_widgets/core/components/custom_card.dart';
import 'package:layout_widgets/core/constants/dimens.dart';

class AccountBalanceCard extends StatelessWidget {
  final VoidCallback? onTap;

  const AccountBalanceCard({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final double balance = 1250.75;
    final String lastUpdated = "14 Ağustos 2025";

    return CustomCard(
      onTap: onTap,
      color: colors.secondaryContainer,
      borderRadius: BorderRadius.circular(Dimens.borderRadiusLarge),
      padding: Dimens.paddingLarge,
      child: SizedBox(
        height: 160.r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hesap Bakiyesi",
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colors.onSecondaryContainer.withOpacity(0.8),
              ),
            ),
            Text(
              "${balance.toStringAsFixed(2)} ₺",
              style: theme.textTheme.headlineMedium?.copyWith(
                color: colors.onSecondaryContainer,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Last Update: $lastUpdated",
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colors.onSecondaryContainer.withOpacity(0.6),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: Dimens.iconSizeSmall,
                  color: colors.onSecondaryContainer.withOpacity(0.6),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
