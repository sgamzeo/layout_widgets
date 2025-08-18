import 'package:equatable/equatable.dart';
import 'package:layout_widgets/features/travel_ease/enums/enums.dart';

class Destination extends Equatable {
  final String name;
  final DestinationType type;
  final String imageUrl;
  final String country;

  const Destination({
    required this.name,
    required this.type,
    required this.imageUrl,
    required this.country,
  });

  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      name: json['name'] as String,
      type: DestinationType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => DestinationType.city,
      ),
      imageUrl: json['imageUrl'] as String,
      country: json['country'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'type': type.name,
    'imageUrl': imageUrl,
    'country': country,
  };

  @override
  List<Object> get props => [name, type, imageUrl, country];
}
