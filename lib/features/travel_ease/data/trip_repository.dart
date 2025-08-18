import 'package:layout_widgets/features/travel_ease/models/trip_model.dart';
import 'package:layout_widgets/features/travel_ease/models/destination_model.dart';
import 'package:layout_widgets/features/travel_ease/enums/enums.dart';

class TripRepository {
  Future<List<Trip>> fetchTrips() async {
    await Future.delayed(const Duration(milliseconds: 500));

    return [
      Trip(
        destination: Destination(
          name: 'Paris',
          type: DestinationType.city,
          imageUrl:
              'https://images.unsplash.com/photo-1499856871958-5b9627545d1a',
          country: 'France',
        ),
        transport: Transport.plane,
        level: TripLevel.luxury,
        startDate: DateTime.now().add(const Duration(days: 5)),
        endDate: DateTime.now().add(const Duration(days: 10)),
      ),
      Trip(
        destination: Destination(
          name: 'Bali',
          type: DestinationType.beach,
          imageUrl:
              'https://images.unsplash.com/photo-1518544866330-95dcd4c8b0cb',
          country: 'Indonesia',
        ),
        transport: Transport.plane,
        level: TripLevel.comfort,
        startDate: DateTime.now().add(const Duration(days: 15)),
        endDate: DateTime.now().add(const Duration(days: 22)),
      ),
      Trip(
        destination: Destination(
          name: 'Rome',
          type: DestinationType.historical,
          imageUrl: 'https://images.unsplash.com/photo-1552832230-c0197dd311b5',
          country: 'Italy',
        ),
        transport: Transport.train,
        level: TripLevel.budget,
        startDate: DateTime.now().add(const Duration(days: 2)),
        endDate: DateTime.now().add(const Duration(days: 7)),
      ),
      Trip(
        destination: Destination(
          name: 'Tokyo',
          type: DestinationType.city,
          imageUrl:
              'https://images.unsplash.com/photo-1503899036084-c55cdd92da26',
          country: 'Japan',
        ),
        transport: Transport.plane,
        level: TripLevel.luxury,
        startDate: DateTime.now().add(const Duration(days: 8)),
        endDate: DateTime.now().add(const Duration(days: 14)),
      ),
      Trip(
        destination: Destination(
          name: 'New York',
          type: DestinationType.city,
          imageUrl:
              'https://images.unsplash.com/photo-1485871981521-5b1fd3805eee',
          country: 'USA',
        ),
        transport: Transport.plane,
        level: TripLevel.comfort,
        startDate: DateTime.now().add(const Duration(days: 3)),
        endDate: DateTime.now().add(const Duration(days: 8)),
      ),
      Trip(
        destination: Destination(
          name: 'Santorini',
          type: DestinationType.beach,
          imageUrl:
              'https://images.unsplash.com/photo-1579492450119-80542d516179',
          country: 'Greece',
        ),
        transport: Transport.boat,
        level: TripLevel.luxury,
        startDate: DateTime.now().add(const Duration(days: 6)),
        endDate: DateTime.now().add(const Duration(days: 11)),
      ),
    ];
  }
}
