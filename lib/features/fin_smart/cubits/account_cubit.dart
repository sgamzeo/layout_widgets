import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:layout_widgets/features/fin_smart/data/account_repository.dart';
import 'package:layout_widgets/features/fin_smart/models/account_model.dart';

class AccountState extends Equatable {
  final List<Account> accounts;
  final bool isLoading;

  const AccountState({this.accounts = const [], this.isLoading = false});

  AccountState copyWith({List<Account>? accounts, bool? isLoading}) {
    return AccountState(
      accounts: accounts ?? this.accounts,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [accounts, isLoading];
}

class AccountCubit extends Cubit<AccountState> {
  final AccountRepository repository;

  AccountCubit({required this.repository}) : super(const AccountState()) {
    loadAccounts();
  }

  void loadAccounts() async {
    emit(state.copyWith(isLoading: true));
    final accounts = await repository.fetchAccounts();
    emit(state.copyWith(accounts: accounts, isLoading: false));
  }
}
