import 'package:equatable/equatable.dart';
import 'package:layout_widgets/features/fin_smart/enums/enums.dart';

class Transaction extends Equatable {
  final TransactionType type;
  final Category category;
  final double amount;
  final DateTime date;
  final String? description;

  const Transaction({
    required this.type,
    required this.category,
    required this.amount,
    required this.date,
    this.description,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      type: TransactionType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => TransactionType.expense,
      ),
      category: Category.values.firstWhere(
        (e) => e.name == json['category'],
        orElse: () => Category.others,
      ),
      amount: (json['amount'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'type': type.name,
    'category': category.name,
    'amount': amount,
    'date': date.toIso8601String(),
    'description': description,
  };

  @override
  List<Object?> get props => [type, category, amount, date, description];
}
