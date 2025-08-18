import 'package:layout_widgets/features/travel_ease/enums/enums.dart';
import 'package:layout_widgets/features/travel_ease/models/destination_model.dart';

class DestinationRepository {
  Future<List<Destination>> fetchDestinations() async {
    await Future.delayed(const Duration(milliseconds: 500)); // Mock API delay

    return [
      const Destination(
        name: 'Paris',
        type: DestinationType.city,
        imageUrl: 'assets/images/paris.jpg',
        country: 'France',
      ),
      const Destination(
        name: 'Tokyo',
        type: DestinationType.city,
        imageUrl: 'assets/images/tokyo.jpg',
        country: 'Japan',
      ),
      const Destination(
        name: 'New York',
        type: DestinationType.city,
        imageUrl: 'assets/images/newyork.jpg',
        country: 'USA',
      ),
      const Destination(
        name: 'Rome',
        type: DestinationType.historical,
        imageUrl: 'assets/images/rome.jpg',
        country: 'Italy',
      ),
      const Destination(
        name: 'Sydney',
        type: DestinationType.beach,
        imageUrl: 'assets/images/sydney.jpg',
        country: 'Australia',
      ),
      const Destination(
        name: 'Cairo',
        type: DestinationType.historical,
        imageUrl: 'assets/images/cairo.jpg',
        country: 'Egypt',
      ),
      const Destination(
        name: 'Rio de Janeiro',
        type: DestinationType.beach,
        imageUrl: 'assets/images/rio.jpg',
        country: 'Brazil',
      ),
      const Destination(
        name: 'Istanbul',
        type: DestinationType.city,
        imageUrl: 'assets/images/istanbul.jpg',
        country: 'Turkey',
      ),
      const Destination(
        name: 'Machu Picchu',
        type: DestinationType.historical,
        imageUrl: 'assets/images/machu_picchu.jpg',
        country: 'Peru',
      ),
      const Destination(
        name: 'Bali',
        type: DestinationType.beach,
        imageUrl: 'assets/images/bali.jpg',
        country: 'Indonesia',
      ),
    ];
  }
}
