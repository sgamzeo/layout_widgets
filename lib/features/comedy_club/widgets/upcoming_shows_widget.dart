import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layout_widgets/core/components/custom_card.dart';
import 'package:layout_widgets/core/components/custom_cached_image.dart';
import 'package:layout_widgets/core/components/custom_progress_indicator.dart';
import 'package:layout_widgets/core/components/custom_section.dart';
import 'package:layout_widgets/core/components/unable_to_load.dart';
import 'package:layout_widgets/core/constants/dimens.dart';
import 'package:layout_widgets/features/comedy_club/cubits/comedy_show_cubit.dart';

class UpcomingShowsWidget extends StatelessWidget {
  const UpcomingShowsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ComedyShowCubit, ComedyShowsState>(
      builder: (context, state) {
        Widget content;

        switch (state.status) {
          case ComedyShowStatus.loading:
            content = CustomProgressIndicator();
            break;

          case ComedyShowStatus.error:
            content = UnableToLoad();
            break;

          case ComedyShowStatus.success:
            final shows = state.upcomingShows;

            if (shows.isEmpty) {
              content = SizedBox(
                height: 180.r,
                child: const Center(child: Text('No upcoming shows')),
              );
            } else {
              content = GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: Dimens.paddingHorizontalMedium,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: Dimens.spaceMedium,
                  crossAxisSpacing: Dimens.spaceMedium,
                  childAspectRatio: 140 / 180,
                ),
                itemCount: shows.length,
                itemBuilder: (context, index) {
                  final show = shows[index];
                  return CustomCard(
                    borderRadius: BorderRadius.circular(
                      Dimens.borderRadiusLarge,
                    ),
                    padding: EdgeInsets.zero,
                    image: CustomCachedImage(
                      imageUrl: show.imageUrl.isNotEmpty
                          ? show.imageUrl
                          : 'https://via.placeholder.com/150',
                      height: 120.r,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    title: show.title,
                    titleMaxLines: 1,
                    titleOverflow: TextOverflow.ellipsis,
                    subtitle:
                        "${show.date.day}/${show.date.month} - \$${show.price.toInt()}",
                    subtitleMaxLines: 1,
                    subtitleOverflow: TextOverflow.ellipsis,
                  );
                },
              );
            }
            break;

          case ComedyShowStatus.initial:
          default:
            content = const SizedBox();
        }

        return CustomSection(title: 'Upcoming Shows', child: content);
      },
    );
  }
}
