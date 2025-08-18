import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layout_widgets/core/components/custom_bottomsheet.dart';
import 'package:layout_widgets/core/components/custom_button.dart';
import 'package:layout_widgets/core/components/custom_cached_image.dart';
import 'package:layout_widgets/core/components/custom_progress_indicator.dart';
import 'package:layout_widgets/core/components/custom_filter_options_list.dart';
import 'package:layout_widgets/core/constants/dimens.dart';
import 'package:layout_widgets/features/travel_ease/cubits/trip_cubit.dart';
import 'package:layout_widgets/features/travel_ease/enums/enums.dart';
import 'package:layout_widgets/features/travel_ease/models/trip_model.dart';

part './widgets/trip_card_widget.dart';
part './widgets/trip_details_dialog_widget.dart';
part './widgets/trip_list_widget.dart';
part './widgets/trip_filter_chips_widget.dart';
part './widgets/filter_bottom_sheet_widget.dart';
part './widgets/card_badge_widget.dart';

class TravelPage extends StatelessWidget {
  const TravelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "TravelEase",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt),
            onPressed: () => _showFilterBottomSheet(context),
          ),
        ],
      ),
      body: BlocBuilder<TripCubit, TripState>(
        builder: (context, state) {
          return Padding(
            padding: Dimens.pagePaddingSmall,
            child: Column(
              children: [
                TripFilterChips(),
                SizedBox(height: Dimens.spaceMedium),
                Expanded(child: TripList(state: state)),
                SizedBox(height: Dimens.spaceLarge),
                CustomButton(
                  onPressed: () => _handleReservation(context),
                  text: "Make Reservation",
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return const FilterBottomSheet();
      },
    );
  }

  void _handleReservation(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Reservation process started')),
    );
  }
}
