class DebtModel {
  final DateTime day;
  final int quantity;
  final String title;
  final String description;
  final int amount;
  final String status;
  final String detail;

  DebtModel({
    required this.day,
    required this.quantity,
    required this.title,
    required this.description,
    required this.amount,
    required this.status,
    required this.detail,
  });
}
