import 'package:equatable/equatable.dart';
import 'package:layout_widgets/features/fin_smart/enums/enums.dart';

class Account extends Equatable {
  final String name;
  final AccountType type;
  final double balance;

  const Account({
    required this.name,
    required this.type,
    required this.balance,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      name: json['name'] as String,
      type: AccountType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => AccountType.cash,
      ),
      balance: (json['balance'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'type': type.name,
    'balance': balance,
  };

  @override
  List<Object> get props => [name, type, balance];
}
