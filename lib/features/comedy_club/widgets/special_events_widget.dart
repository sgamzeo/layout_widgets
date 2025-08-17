import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layout_widgets/core/components/custom_cached_image.dart';
import 'package:layout_widgets/core/components/custom_card.dart';
import 'package:layout_widgets/core/components/custom_horizontal.gallery.dart';
import 'package:layout_widgets/core/components/custom_progress_indicator.dart';
import 'package:layout_widgets/core/components/custom_section.dart';
import 'package:layout_widgets/core/components/unable_to_load.dart';
import 'package:layout_widgets/core/constants/dimens.dart';
import 'package:layout_widgets/features/comedy_club/cubits/comedy_show_cubit.dart';
import 'package:layout_widgets/features/comedy_club/models/comedy_show_model.dart';

class SpecialEventsWidget extends StatelessWidget {
  const SpecialEventsWidget({super.key});

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
            final specialEvents = state.specialShows;

            if (specialEvents.isEmpty) {
              content = SizedBox(
                height: 180.r,
                child: const Center(child: Text('No special events')),
              );
            } else {
              content = CustomHorizontalGallery<ComedyShowModel>(
                items: specialEvents,
                spacing: Dimens.spaceMedium,
                itemBuilder: (context, show, index) => SizedBox(
                  width: 160.r,
                  child: _buildEventCard(context, show),
                ),
                onTap: (show, index) {},
              );
            }
            break;

          case ComedyShowStatus.initial:
          default:
            content = const SizedBox();
        }

        return CustomSection(title: 'Special Events', child: content);
      },
    );
  }

  Widget _buildEventCard(BuildContext context, ComedyShowModel show) {
    return CustomCard(
      margin: EdgeInsets.zero,
      borderRadius: BorderRadius.circular(12.r),
      padding: EdgeInsets.all(8.r),
      image: CustomCachedImage(
        imageUrl: show.imageUrl,
        height: 120.r,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
      title: show.title,
      titleMaxLines: 1,
      titleOverflow: TextOverflow.ellipsis,
      titleStyle: Theme.of(
        context,
      ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
      subtitle: "${show.date.day}/${show.date.month} - \$${show.price.toInt()}",
      subtitleMaxLines: 1,
      subtitleOverflow: TextOverflow.ellipsis,
      subtitleStyle: Theme.of(context).textTheme.bodySmall,
    );
  }
}
