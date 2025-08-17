import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:layout_widgets/features/comedy_club/data/comedian_repository.dart';
import '../models/comedian_model.dart';

enum ComedianStatus { initial, loading, success, error }

class ComedianState extends Equatable {
  final ComedianStatus status;
  final List<Comedian> allComedians;
  final List<Comedian> featuredComedians;
  final String? errorMessage;

  const ComedianState({
    this.status = ComedianStatus.initial,
    this.allComedians = const [],
    this.featuredComedians = const [],
    this.errorMessage,
  });

  ComedianState copyWith({
    ComedianStatus? status,
    List<Comedian>? allComedians,
    List<Comedian>? featuredComedians,
    String? errorMessage,
  }) {
    return ComedianState(
      status: status ?? this.status,
      allComedians: allComedians ?? this.allComedians,
      featuredComedians: featuredComedians ?? this.featuredComedians,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    status,
    allComedians,
    featuredComedians,
    errorMessage,
  ];
}

class ComedianCubit extends Cubit<ComedianState> {
  final ComedianRepository repository;

  ComedianCubit(this.repository) : super(const ComedianState()) {
    fetchComedians();
  }

  Future<void> fetchComedians() async {
    emit(state.copyWith(status: ComedianStatus.loading));
    try {
      final comedians = await repository.fetchComedians();
      final featured = comedians.where((c) => c.rating >= 4.8).toList();

      emit(
        state.copyWith(
          status: ComedianStatus.success,
          allComedians: comedians,
          featuredComedians: featured,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: ComedianStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
