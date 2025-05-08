class DebtModel {
  final String code;
  final String title;
  final String date;
  final int amount;
  final String status; // "Chưa thanh toán", "Đã thanh toán", "Hết hạn"
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
