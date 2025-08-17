import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layout_widgets/core/constants/dimens.dart';

class QuickActionsWidget extends StatelessWidget {
  const QuickActionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final actions = [
      _ActionItem(Icons.calendar_today_outlined, 'Events', colors.primary),
      _ActionItem(
        Icons.confirmation_number_outlined,
        'Tickets',
        colors.secondary,
      ),
      _ActionItem(
        Icons.favorite_outline,
        'Favorites',
        colors.tertiary ?? colors.primaryContainer,
      ),
      _ActionItem(Icons.local_offer_outlined, 'Deals', colors.error),
      _ActionItem(Icons.place_outlined, 'Venues', colors.surfaceVariant),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: Dimens.paddingHorizontalMedium,
          child: Text(
            'Quick Access',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: colors.onSurface.withOpacity(0.8),
            ),
          ),
        ),
        SizedBox(height: Dimens.spaceMedium),
        SizedBox(
          height: 110.r,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: Dimens.paddingHorizontalMedium,
            physics: const BouncingScrollPhysics(),
            itemCount: actions.length,
            separatorBuilder: (_, __) => SizedBox(width: Dimens.spaceMedium),
            itemBuilder: (context, index) {
              return _ModernActionCard(action: actions[index], theme: theme);
            },
          ),
        ),
      ],
    );
  }
}

class _ActionItem {
  final IconData icon;
  final String label;
  final Color color;

  _ActionItem(this.icon, this.label, this.color);
}

class _ModernActionCard extends StatelessWidget {
  final _ActionItem action;
  final ThemeData theme;

  const _ModernActionCard({required this.action, required this.theme});

  @override
  Widget build(BuildContext context) {
    final colors = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16.r),
        onTap: () {}, // Add your action here
        splashColor: action.color.withOpacity(0.1),
        highlightColor: action.color.withOpacity(0.05),
        child: Container(
          width: 88.r,
          padding: EdgeInsets.all(12.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 52.r,
                height: 52.r,
                decoration: BoxDecoration(
                  color: isDark
                      ? action.color.withOpacity(0.2)
                      : action.color.withOpacity(0.1),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: action.color.withOpacity(0.3),
                    width: 1.r,
                  ),
                ),
                child: Icon(action.icon, color: action.color, size: 24.r),
              ),
              SizedBox(height: 10.r),
              Text(
                action.label,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: colors.onSurface.withOpacity(0.9),
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
