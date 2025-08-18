part of '../travel_page.dart';

class TripCard extends StatelessWidget {
  final Trip trip;

  const TripCard({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showTripDetails(context, trip),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Dimens.borderRadiusMedium),
        child: Stack(
          fit: StackFit.expand,
          children: [
            CustomCachedImage(
              imageUrl: trip.destination.imageUrl,
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: Dimens.paddingSmall,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      trip.destination.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimens.fontSizeSubtitle,
                      ),
                    ),
                    Text(
                      trip.destination.country,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white,
                        fontSize: Dimens.fontSizeBody,
                      ),
                    ),
                    SizedBox(height: Dimens.spaceMicro),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: Dimens.iconSizeSmall,
                          color: Colors.white,
                        ),
                        SizedBox(width: Dimens.spaceMicro),
                        Text(
                          '${trip.startDate.day}/${trip.startDate.month} - ${trip.endDate.day}/${trip.endDate.month}',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: Colors.white,
                                fontSize: Dimens.fontSizeBody,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              top: Dimens.spaceSmall,
              right: Dimens.spaceSmall,
              child: CardBadge(
                text: trip.level.name,
                fontSize: Dimens.fontSizeCaption,
                backgroundColor: Colors.black.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showTripDetails(BuildContext context, Trip trip) {
    showDialog(
      context: context,
      builder: (context) => TripDetailsDialog(trip: trip),
    );
  }
}
