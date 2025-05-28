import '../models/debt_model.dart';

final List<Map<String, String>> images = [
  {
    'image': 'assets/images/temp.png',
    'title': 'Mời thầu vận chuyển vải vụn tại khu vực miền tây...',
  },
  {
    'image': 'assets/images/temp.png',
    'title': 'Mời thầu vận chuyển vải vụn tại khu vực miền tây...',
  },
];
final List<DebtModel> mockDebts = [
  DebtModel(
    code: "CN001",
    title: "Công nợ tháng 4",
    date: DateTime(2025, 05, 14),
    amount: 73000000,
    status: "Chưa thanh toán",
    progress: "0/3",
  ),
  DebtModel(
    code: "CN002",
    title: "Công nợ tháng 3",
    date: DateTime(2025, 05, 15),
    amount: 55000500,
    status: "Đã thanh toán",
    progress: "4/4",
  ),
  DebtModel(
    code: "CN006",
    title: "Công nợ tháng 3",
    date: DateTime(2025, 05, 15),
    amount: 120000000,
    status: "Đã thanh toán",
    progress: "4/4",
  ),
  DebtModel(
    code: "CN007",
    title: "Công nợ tháng 3",
    date: DateTime(2025, 05, 16),
    amount: 50500000,
    status: "Đã thanh toán",
    progress: "4/4",
  ),
  DebtModel(
    code: "CN004",
    title: "Công nợ tháng 3",
    date: DateTime(2025, 05, 13),
    amount: 30500000,
    status: "Hết hạn",
    progress: "2/4",
  ),
  DebtModel(
    code: "CN003",
    title: "Công nợ tháng 3",
    date: DateTime(2025, 05, 12),
    amount: 42000100,
    status: "Thanh toán một phần",
    progress: "2/4",
  ),
];
