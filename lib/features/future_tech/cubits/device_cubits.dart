import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:layout_widgets/features/future_tech/enums/enums.dart';
import 'package:layout_widgets/features/future_tech/models/device_model.dart';

class DeviceState {
  final List<Device> devices;
  final Room? selectedRoom;

  DeviceState({required this.devices, this.selectedRoom});

  DeviceState copyWith({List<Device>? devices, Room? selectedRoom}) {
    return DeviceState(
      devices: devices ?? this.devices,
      selectedRoom: selectedRoom ?? this.selectedRoom,
    );
  }

  List<Device> get filteredDevices {
    if (selectedRoom == null) return devices;
    return devices.where((d) => d.room == selectedRoom).toList();
  }
}

class DeviceCubit extends Cubit<DeviceState> {
  DeviceCubit()
    : super(
        DeviceState(
          devices: [
            Device(
              name: 'Living Room Light',
              type: DeviceT.light,
              room: Room.livingRoom,
            ),
            Device(
              name: 'Living Room Plug',
              type: DeviceT.plug,
              room: Room.livingRoom,
            ),
            Device(
              name: 'Living Room Curtain',
              type: DeviceT.curtain,
              room: Room.livingRoom,
            ),
            Device(
              name: 'Bedroom Light',
              type: DeviceT.light,
              room: Room.bedroom,
            ),
            Device(
              name: 'Bedroom Plug',
              type: DeviceT.plug,
              room: Room.bedroom,
            ),
            Device(
              name: 'Bedroom Curtain',
              type: DeviceT.curtain,
              room: Room.bedroom,
            ),
            Device(
              name: 'Kitchen Light',
              type: DeviceT.light,
              room: Room.kitchen,
            ),
            Device(
              name: 'Kitchen Plug',
              type: DeviceT.plug,
              room: Room.kitchen,
            ),
          ],
        ),
      );

  void toggleDevice(Device device) {
    final updatedDevices = state.devices.map((d) {
      if (d == device) {
        return Device(
          name: d.name,
          type: d.type,
          room: d.room,
          status: d.status == PowerStatus.on ? PowerStatus.off : PowerStatus.on,
        );
      }
      return d;
    }).toList();

    emit(state.copyWith(devices: updatedDevices));
  }

  void filterByRoom(Room room) {
    emit(state.copyWith(selectedRoom: room));
  }
}
