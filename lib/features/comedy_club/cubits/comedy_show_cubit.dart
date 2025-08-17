import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:layout_widgets/core/extensions/date_status_extensions.dart';
import 'package:layout_widgets/features/comedy_club/models/comedy_show_model.dart';
import '../data/comedy_show_repository.dart';

enum ComedyShowStatus { initial, loading, success, error }

class ComedyShowsState {
  final ComedyShowStatus status;
  final List<ComedyShowModel> allShows;
  final List<ComedyShowModel> upcomingShows;
  final List<ComedyShowModel> specialShows;
  final String? errorMessage;

  const ComedyShowsState({
    this.status = ComedyShowStatus.initial,
    this.allShows = const [],
    this.upcomingShows = const [],
    this.specialShows = const [],
    this.errorMessage,
  });

  ComedyShowsState copyWith({
    ComedyShowStatus? status,
    List<ComedyShowModel>? allShows,
    List<ComedyShowModel>? upcomingShows,
    List<ComedyShowModel>? specialShows,
    String? errorMessage,
  }) {
    return ComedyShowsState(
      status: status ?? this.status,
      allShows: allShows ?? this.allShows,
      upcomingShows: upcomingShows ?? this.upcomingShows,
      specialShows: specialShows ?? this.specialShows,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class ComedyShowCubit extends Cubit<ComedyShowsState> {
  final ComedyShowRepository repository;

  ComedyShowCubit(this.repository) : super(const ComedyShowsState()) {
    fetchShows();
  }

  Future<void> fetchShows() async {
    emit(state.copyWith(status: ComedyShowStatus.loading));
    try {
      final shows = await repository.fetchShows();
      final upcoming = shows.where((s) => s.date.isFuture).toList();
      final special = shows.where((s) => s.isSpecial).toList();

      emit(
        state.copyWith(
          status: ComedyShowStatus.success,
          allShows: shows,
          upcomingShows: upcoming,
          specialShows: special,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: ComedyShowStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
