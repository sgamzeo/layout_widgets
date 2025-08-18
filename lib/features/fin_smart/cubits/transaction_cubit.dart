import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:layout_widgets/features/fin_smart/data/transactions_repository.dart';
import 'package:layout_widgets/features/fin_smart/models/transaction_model.dart';

class TransactionState extends Equatable {
  final List<Transaction> transactions;
  final bool isLoading;

  const TransactionState({
    this.transactions = const [],
    this.isLoading = false,
  });

  TransactionState copyWith({
    List<Transaction>? transactions,
    bool? isLoading,
  }) {
    return TransactionState(
      transactions: transactions ?? this.transactions,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [transactions, isLoading];
}

class TransactionCubit extends Cubit<TransactionState> {
  final TransactionRepository repository;

  TransactionCubit({required this.repository})
    : super(const TransactionState()) {
    loadTransactions();
  }

  void loadTransactions() async {
    emit(state.copyWith(isLoading: true));
    final transactions = await repository.fetchTransactions();
    emit(state.copyWith(transactions: transactions, isLoading: false));
  }
}
