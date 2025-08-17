import 'package:flutter/material.dart';
import 'package:layout_widgets/core/components/custom_progress_indicator.dart';
import 'package:layout_widgets/core/constants/dimens.dart';
import 'package:layout_widgets/features/comedy_club/data/comedian_repository.dart';
import 'package:layout_widgets/features/comedy_club/widgets/comedy_club_gallery_widget.dart';
import 'package:layout_widgets/features/comedy_club/widgets/featured_comedians_widget.dart';
import 'package:layout_widgets/features/comedy_club/widgets/hero_banner.dart';
import 'package:layout_widgets/features/comedy_club/widgets/quick_actions_widget.dart';
import 'package:layout_widgets/features/comedy_club/widgets/special_events_widget.dart';
import 'package:layout_widgets/features/comedy_club/widgets/upcoming_shows_widget.dart';

class ComedyClubPage extends StatelessWidget {
  const ComedyClubPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      backgroundColor: colors.surfaceVariant,
      appBar: AppBar(
        title: Text('Comedy Club', style: theme.textTheme.headlineSmall),
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,

        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => _searchShows(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeroBanner(),
            const QuickActionsWidget(),
            SizedBox(height: Dimens.spaceXLarge),
            ComedyClubGallery(),
            SizedBox(height: Dimens.spaceXLarge),
            const UpcomingShowsWidget(),
            SizedBox(height: Dimens.spaceXLarge),
            FeaturedComediansWidget(),
            const SpecialEventsWidget(),
          ],
        ),
      ),
    );
  }

  void _searchShows(BuildContext context) {}
}
