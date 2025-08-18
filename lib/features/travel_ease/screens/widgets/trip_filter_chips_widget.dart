part of '../travel_page.dart';

class TripFilterChips extends StatelessWidget {
  const TripFilterChips({super.key});

  @override
  Widget build(BuildContext context) {
    final filters = <_FilterOption>[
      _FilterOption(
        label: 'All',
        onTap: () => context.read<TripCubit>().fetchTrips(),
      ),
      _FilterOption(
        label: 'Luxury',
        onTap: () => context.read<TripCubit>().filterByLevel(TripLevel.luxury),
      ),
      _FilterOption(
        label: 'Plane',
        onTap: () =>
            context.read<TripCubit>().filterByTransport(Transport.plane),
      ),
      _FilterOption(
        label: 'Upcoming',
        onTap: () => context.read<TripCubit>().fetchTrips(),
      ),
    ];

    return SizedBox(
      height: 50.r,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final filter = filters[index];
          return FilterChip(
            label: Text(filter.label),
            onSelected: (_) => filter.onTap(),
          );
        },
      ),
    );
  }
}

class _FilterOption {
  final String label;
  final VoidCallback onTap;

  _FilterOption({required this.label, required this.onTap});
}
