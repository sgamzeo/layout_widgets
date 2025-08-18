import 'package:flutter/material.dart';
import 'package:layout_widgets/core/constants/dimens.dart';
import 'package:layout_widgets/features/future_tech/enums/enums.dart';

class DeviceFilterChips extends StatelessWidget {
  final List<Room> rooms;
  final Room? selectedRoom;
  final ValueChanged<Room> onSelected;

  const DeviceFilterChips({
    super.key,
    required this.rooms,
    required this.selectedRoom,
    required this.onSelected,
  });

  //TODO: customchip ---
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: Dimens.spaceSmall,
      children: rooms.map((room) {
        final isSelected = selectedRoom == room;
        return FilterChip(
          label: Text(_roomName(room)),
          selected: isSelected,
          onSelected: (_) => onSelected(room),
          backgroundColor: Colors.grey[200],
          selectedColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
          labelStyle: TextStyle(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Colors.black,
            fontSize: Dimens.fontSizeCaption,
          ),
        );
      }).toList(),
    );
  }

  String _roomName(Room room) {
    switch (room) {
      case Room.livingRoom:
        return 'Living Room';
      case Room.bedroom:
        return 'Bedroom';
      case Room.kitchen:
        return 'Kitchen';
    }
  }
}
