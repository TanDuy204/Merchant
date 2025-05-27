class DebtModel {
  final String code;
  final String title;
  final DateTime date;
  final int amount;
  final String status;
  final String progress;

  DebtModel({
    required this.code,
    required this.title,
    required this.date,
    required this.amount,
    required this.status,
    required this.progress,
  });
}
