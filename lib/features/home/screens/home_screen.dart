import 'package:flutter/material.dart';
import 'package:layout_widgets/core/components/custom_button.dart';
import 'package:layout_widgets/core/constants/dimens.dart';
import 'package:layout_widgets/core/routes.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // Butonların sadece title ve route bilgisi var
  final List<Map<String, dynamic>> _menuItems = [
    {'title': 'Finance', 'route': AppRoutes.finance},
    {'title': 'Smart Home', 'route': AppRoutes.smartHome},
    {'title': 'Travel', 'route': AppRoutes.travel},
    {'title': 'Comedy', 'route': AppRoutes.comedy},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ana Sayfa")),
      body: Padding(
        padding: Dimens.pagePaddingMedium,
        child: ListView.separated(
          itemCount: _menuItems.length,
          separatorBuilder: (_, __) => SizedBox(height: Dimens.spaceMedium),
          itemBuilder: (context, index) {
            final item = _menuItems[index];
            return CustomButton(
              text: item['title'],
              variant: ButtonVariant.primary,
              onPressed: () {
                Navigator.pushNamed(context, item['route']);
              },
            );
          },
        ),
      ),
    );
  }
}
