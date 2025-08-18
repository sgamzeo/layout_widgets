import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:layout_widgets/features/travel_ease/data/trip_repository.dart';
import 'package:layout_widgets/features/travel_ease/enums/enums.dart';
import 'package:layout_widgets/features/travel_ease/models/trip_model.dart';

enum TripStatus { initial, loading, success, error }

class TripState extends Equatable {
  final TripStatus status;
  final List<Trip> allTrips;
  final List<Trip> upcomingTrips;
  final List<Trip> luxuryTrips;
  final String? errorMessage;

  const TripState({
    this.status = TripStatus.initial,
    this.allTrips = const [],
    this.upcomingTrips = const [],
    this.luxuryTrips = const [],
    this.errorMessage,
  });

  TripState copyWith({
    TripStatus? status,
    List<Trip>? allTrips,
    List<Trip>? upcomingTrips,
    List<Trip>? luxuryTrips,
    String? errorMessage,
  }) {
    return TripState(
      status: status ?? this.status,
      allTrips: allTrips ?? this.allTrips,
      upcomingTrips: upcomingTrips ?? this.upcomingTrips,
      luxuryTrips: luxuryTrips ?? this.luxuryTrips,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    status,
    allTrips,
    upcomingTrips,
    luxuryTrips,
    errorMessage,
  ];
}

class TripCubit extends Cubit<TripState> {
  final TripRepository repository;

  TripCubit(this.repository) : super(const TripState()) {
    fetchTrips();
  }

  Future<void> fetchTrips() async {
    emit(state.copyWith(status: TripStatus.loading));
    try {
      final trips = await repository.fetchTrips();
      final now = DateTime.now();

      final upcoming = trips
          .where((trip) => trip.startDate.isAfter(now))
          .toList();

      final luxury = trips
          .where((trip) => trip.level == TripLevel.luxury)
          .toList();

      emit(
        state.copyWith(
          status: TripStatus.success,
          allTrips: trips,
          upcomingTrips: upcoming,
          luxuryTrips: luxury,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(status: TripStatus.error, errorMessage: e.toString()),
      );
    }
  }

  Future<void> filterByLevel(TripLevel level) async {
    emit(state.copyWith(status: TripStatus.loading));
    try {
      final filtered = state.allTrips.where((t) => t.level == level).toList();
      emit(state.copyWith(status: TripStatus.success, upcomingTrips: filtered));
    } catch (e) {
      emit(
        state.copyWith(
          status: TripStatus.error,
          errorMessage: 'Filter error: ${e.toString()}',
        ),
      );
    }
  }

  Future<void> filterByTransport(Transport transport) async {
    emit(state.copyWith(status: TripStatus.loading));
    try {
      final filtered = state.allTrips
          .where((t) => t.transport == transport)
          .toList();
      emit(state.copyWith(status: TripStatus.success, upcomingTrips: filtered));
    } catch (e) {
      emit(
        state.copyWith(
          status: TripStatus.error,
          errorMessage: 'Filter error: ${e.toString()}',
        ),
      );
    }
  }
}
