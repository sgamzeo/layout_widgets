import 'package:flutter/material.dart';
import 'package:layout_widgets/core/components/custom_card.dart';
import 'package:layout_widgets/core/constants/dimens.dart';
import 'package:layout_widgets/features/future_tech/enums/enums.dart';
import 'package:layout_widgets/features/future_tech/models/device_model.dart';

class DeviceCard extends StatelessWidget {
  final Device device;
  final VoidCallback onToggle;

  const DeviceCard({super.key, required this.device, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isOn = device.status == PowerStatus.on;

    return CustomCard(
      padding: Dimens.paddingSmall,

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _getDeviceIcon(device.type),
            size: Dimens.iconSizeLarge,
            color: isOn ? colorScheme.primary : Colors.grey,
          ),
          SizedBox(height: Dimens.spaceSmall),
          Text(device.name, style: TextStyle(fontSize: Dimens.fontSizeBody)),
          SizedBox(height: Dimens.spaceMicro),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: isOn ? colorScheme.primary : Colors.grey,
              padding: Dimens.buttonPaddingSmall,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimens.borderRadiusSmall),
              ),
            ),
            onPressed: onToggle,
            child: Text(
              isOn ? 'Turn Off' : 'Turn On',
              style: TextStyle(fontSize: Dimens.fontSizeCaption),
            ),
          ),
        ],
      ),
    );
  }

  IconData _getDeviceIcon(DeviceT type) {
    switch (type) {
      case DeviceT.light:
        return Icons.lightbulb;
      case DeviceT.plug:
        return Icons.power;
      case DeviceT.curtain:
        return Icons.window;
    }
  }
}
