part of '../travel_page.dart';

class FilterBottomSheet extends StatelessWidget {
  final List<Map<String, dynamic>> filters;
  final VoidCallback? onApply;
  final ValueChanged<Map<String, dynamic>>? onOptionChanged;

  const FilterBottomSheet({
    super.key,
    this.filters = const [
      {'title': 'Destination', 'value': true},
      {'title': 'Date Range', 'value': false},
      {'title': 'Travel Type', 'value': false},
      {'title': 'Pet Friendly', 'value': false},
    ],
    this.onApply,
    this.onOptionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      title: 'Filter Options',

      showCloseButton: true,
      child: FilterOptionsList(
        options: filters,
        onToggle: (option) {
          if (onOptionChanged != null) onOptionChanged!(option);
        },
      ),
    );
  }
}
