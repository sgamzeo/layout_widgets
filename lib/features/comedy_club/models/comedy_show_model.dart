import 'package:equatable/equatable.dart';
import 'package:layout_widgets/features/comedy_club/enums/enums.dart';

class ComedyShowModel extends Equatable {
  final String title;
  final ComedyFormat format;
  final ShowTime time;
  final TicketTier ticketTier;
  final AudienceType audienceType;
  final DateTime date;
  final double price;
  final String imageUrl;
  final bool isSpecial;

  const ComedyShowModel({
    required this.title,
    required this.format,
    required this.time,
    required this.ticketTier,
    required this.audienceType,
    required this.date,
    required this.price,
    required this.imageUrl,
    this.isSpecial = false,
  });

  factory ComedyShowModel.fromJson(Map<String, dynamic> json) {
    return ComedyShowModel(
      title: json['title'] as String,
      format: ComedyFormat.values.firstWhere(
        (e) => e.name == json['format'],
        orElse: () => ComedyFormat.standUp,
      ),
      time: ShowTime.values.firstWhere(
        (e) => e.name == json['time'],
        orElse: () => ShowTime.evening,
      ),
      ticketTier: TicketTier.values.firstWhere(
        (e) => e.name == json['ticketTier'],
        orElse: () => TicketTier.standard,
      ),
      audienceType: AudienceType.values.firstWhere(
        (e) => e.name == json['audienceType'],
        orElse: () => AudienceType.allAges,
      ),
      date: DateTime.tryParse(json['date'] as String? ?? '') ?? DateTime.now(),
      price: (json['price'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String,
      isSpecial: json['isSpecial'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'format': format.name,
    'time': time.name,
    'ticketTier': ticketTier.name,
    'audienceType': audienceType.name,
    'date': date.toIso8601String(),
    'price': price,
    'imageUrl': imageUrl,
    'isSpecial': isSpecial,
  };

  @override
  List<Object> get props => [
    title,
    format,
    time,
    ticketTier,
    audienceType,
    date,
    price,
    imageUrl,
    isSpecial,
  ];
}
