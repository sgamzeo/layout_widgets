import 'package:equatable/equatable.dart';
import 'package:layout_widgets/features/future_tech/enums/enums.dart';

class Device extends Equatable {
  final String name;
  final DeviceT type;
  final Room room;
  final PowerStatus status;

  const Device({
    required this.name,
    required this.type,
    required this.room,
    this.status = PowerStatus.off,
  });

  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      name: json['name'] as String,
      type: DeviceT.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => DeviceT.light,
      ),
      room: Room.values.firstWhere(
        (e) => e.name == json['room'],
        orElse: () => Room.livingRoom,
      ),
      status: PowerStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => PowerStatus.off,
      ),
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'type': type.name,
    'room': room.name,
    'status': status.name,
  };

  @override
  List<Object> get props => [name, type, room, status];
}
