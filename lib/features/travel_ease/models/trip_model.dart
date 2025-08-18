import 'package:equatable/equatable.dart';
import 'package:layout_widgets/features/travel_ease/enums/enums.dart';
import 'package:layout_widgets/features/travel_ease/models/destination_model.dart';

class Trip extends Equatable {
  final Destination destination;
  final Transport transport;
  final TripLevel level;
  final DateTime startDate;
  final DateTime endDate;

  const Trip({
    required this.destination,
    required this.transport,
    required this.level,
    required this.startDate,
    required this.endDate,
  });

  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      destination: Destination.fromJson(
        json['destination'] as Map<String, dynamic>,
      ),
      transport: Transport.values.firstWhere(
        (e) => e.name == json['transport'],
        orElse: () => Transport.plane,
      ),
      level: TripLevel.values.firstWhere(
        (e) => e.name == json['level'],
        orElse: () => TripLevel.budget,
      ),
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
    'destination': destination.toJson(),
    'transport': transport.name,
    'level': level.name,
    'startDate': startDate.toIso8601String(),
    'endDate': endDate.toIso8601String(),
  };

  @override
  List<Object> get props => [destination, transport, level, startDate, endDate];
}
