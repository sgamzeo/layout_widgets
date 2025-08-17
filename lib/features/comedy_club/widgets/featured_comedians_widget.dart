import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layout_widgets/core/components/custom_card.dart';
import 'package:layout_widgets/core/components/custom_cached_image.dart';
import 'package:layout_widgets/core/components/custom_horizontal.gallery.dart';
import 'package:layout_widgets/core/components/custom_progress_indicator.dart';
import 'package:layout_widgets/core/components/custom_section.dart';
import 'package:layout_widgets/core/components/unable_to_load.dart';
import 'package:layout_widgets/core/constants/dimens.dart';
import 'package:layout_widgets/features/comedy_club/cubits/comedian_cubit.dart';
import 'package:layout_widgets/features/comedy_club/models/comedian_model.dart';

class FeaturedComediansWidget extends StatelessWidget {
  const FeaturedComediansWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ComedianCubit, ComedianState>(
      builder: (context, state) {
        Widget content;

        switch (state.status) {
          case ComedianStatus.loading:
            content = CustomProgressIndicator();
            break;

          case ComedianStatus.error:
            content = UnableToLoad();
            break;

          case ComedianStatus.success:
            if (state.featuredComedians.isEmpty) {
              content = SizedBox(
                height: 180.r,
                child: const Center(child: Text('No featured comedians')),
              );
            } else {
              content = SizedBox(
                height: 220.r,
                child: CustomHorizontalGallery<Comedian>(
                  items: state.featuredComedians,
                  spacing: Dimens.spaceMedium,
                  itemBuilder: (context, comedian, index) => SizedBox(
                    width: 160.r,
                    child: _buildComedianCard(comedian),
                  ),
                  onTap: (comedian, index) {
                    // Tıklama işlemi burada
                  },
                ),
              );
            }
            break;

          case ComedianStatus.initial:
          default:
            content = const SizedBox();
        }

        return CustomSection(title: 'Featured Comedians', child: content);
      },
    );
  }

  Widget _buildComedianCard(Comedian comedian) {
    return CustomCard(
      margin: EdgeInsets.zero,
      borderRadius: BorderRadius.circular(12.r),
      padding: EdgeInsets.all(8.r),
      image: CustomCachedImage(
        imageUrl: comedian.image,
        height: 120.r,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
      title: comedian.name,
      titleMaxLines: 1,
      titleOverflow: TextOverflow.ellipsis,
      subtitle: comedian.specialty,
      subtitleMaxLines: 1,
      subtitleOverflow: TextOverflow.ellipsis,
    );
  }
}
