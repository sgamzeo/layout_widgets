import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:layout_widgets/features/travel_ease/data/destination_repository.dart';
import 'package:layout_widgets/features/travel_ease/enums/enums.dart';
import 'package:layout_widgets/features/travel_ease/models/destination_model.dart';

enum DestinationStatus { initial, loading, success, error }

class DestinationState extends Equatable {
  final DestinationStatus status;
  final List<Destination> allDestinations;
  final List<Destination> popularDestinations;
  final String? errorMessage;

  const DestinationState({
    this.status = DestinationStatus.initial,
    this.allDestinations = const [],
    this.popularDestinations = const [],
    this.errorMessage,
  });

  DestinationState copyWith({
    DestinationStatus? status,
    List<Destination>? allDestinations,
    List<Destination>? popularDestinations,
    String? errorMessage,
  }) {
    return DestinationState(
      status: status ?? this.status,
      allDestinations: allDestinations ?? this.allDestinations,
      popularDestinations: popularDestinations ?? this.popularDestinations,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    status,
    allDestinations,
    popularDestinations,
    errorMessage,
  ];
}

class DestinationCubit extends Cubit<DestinationState> {
  final DestinationRepository repository;

  DestinationCubit(this.repository) : super(const DestinationState()) {
    fetchDestinations();
  }

  Future<void> fetchDestinations() async {
    emit(state.copyWith(status: DestinationStatus.loading));
    try {
      final destinations = await repository.fetchDestinations();
      final popular = destinations
          .where(
            (d) =>
                d.type == DestinationType.city ||
                d.type == DestinationType.beach,
          )
          .toList();

      emit(
        state.copyWith(
          status: DestinationStatus.success,
          allDestinations: destinations,
          popularDestinations: popular,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: DestinationStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> filterByType(DestinationType type) async {
    emit(state.copyWith(status: DestinationStatus.loading));
    try {
      final filtered = state.allDestinations
          .where((d) => d.type == type)
          .toList();
      emit(
        state.copyWith(
          status: DestinationStatus.success,
          popularDestinations: filtered,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: DestinationStatus.error,
          errorMessage: 'Filter error: ${e.toString()}',
        ),
      );
    }
  }
}
