part of '../travel_page.dart';

class TripList extends StatelessWidget {
  final TripState state;

  const TripList({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    if (state.status == TripStatus.loading) {
      return const Center(child: CustomProgressIndicator());
    }

    if (state.status == TripStatus.error) {
      return Center(child: Text('Error: ${state.errorMessage}'));
    }

    if (state.upcomingTrips.isEmpty) {
      return const Center(child: Text('No results found'));
    }

    return GridView.builder(
      itemCount: state.upcomingTrips.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: Dimens.spaceMedium,
        mainAxisSpacing: Dimens.spaceMedium,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        final trip = state.upcomingTrips[index];
        return TripCard(trip: trip);
      },
    );
  }
}
