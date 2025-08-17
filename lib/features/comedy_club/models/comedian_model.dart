import 'package:equatable/equatable.dart';

class Comedian extends Equatable {
  final String name;
  final String specialty;
  final String image;
  final double rating;

  const Comedian({
    required this.name,
    required this.specialty,
    required this.image,
    required this.rating,
  });

  factory Comedian.fromJson(Map<String, dynamic> json) {
    return Comedian(
      name: json['name'] ?? '',
      specialty: json['specialty'] ?? '',
      image: json['image'] ?? '',
      rating: (json['rating'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'specialty': specialty,
      'image': image,
      'rating': rating,
    };
  }

  @override
  List<Object> get props => [name, specialty, image, rating];
}
