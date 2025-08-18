part of '../travel_page.dart';

class TripDetailsDialog extends StatelessWidget {
  final Trip trip;

  const TripDetailsDialog({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(trip.destination.name),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCachedImage(imageUrl: trip.destination.imageUrl),
          const SizedBox(height: 16),
          Text('Country: ${trip.destination.country}'),
          Text(
            'Dates: ${trip.startDate.day}/${trip.startDate.month} - ${trip.endDate.day}/${trip.endDate.month}',
          ),
          Text('Transport: ${trip.transport.name}'),
          Text('Category: ${trip.level.name}'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Close'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Reservation process started')),
            );
          },
          child: const Text('Make Reservation'),
        ),
      ],
    );
  }
}
