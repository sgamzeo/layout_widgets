import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:layout_widgets/core/constants/dimens.dart';
import 'package:layout_widgets/features/future_tech/cubits/device_cubits.dart';
import 'package:layout_widgets/features/future_tech/enums/enums.dart';
import 'package:layout_widgets/features/future_tech/screens/device_card_widget.dart';
import 'package:layout_widgets/features/future_tech/screens/device_filter_chips.dart';

class SmartHomePage extends StatelessWidget {
  const SmartHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FutureTech')),
      body: Padding(
        padding: Dimens.pagePaddingMedium,
        child: Column(
          children: [
            BlocBuilder<DeviceCubit, DeviceState>(
              builder: (context, state) {
                return DeviceFilterChips(
                  rooms: Room.values,
                  selectedRoom: state.selectedRoom,
                  onSelected: (room) =>
                      context.read<DeviceCubit>().filterByRoom(room),
                );
              },
            ),

            SizedBox(height: Dimens.spaceMedium),

            Expanded(
              child: BlocBuilder<DeviceCubit, DeviceState>(
                builder: (context, state) {
                  final devices = state.filteredDevices;
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: Dimens.spaceSmall,
                      mainAxisSpacing: Dimens.spaceSmall,
                      childAspectRatio: 3 / 4,
                    ),
                    itemCount: devices.length,
                    itemBuilder: (context, index) {
                      final device = devices[index];
                      return DeviceCard(
                        device: device,
                        onToggle: () =>
                            context.read<DeviceCubit>().toggleDevice(device),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
