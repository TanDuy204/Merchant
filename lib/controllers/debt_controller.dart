import 'package:get/get.dart';

import '../models/debt_model.dart';
import '../service/uidata.dart';

class DebtController extends GetxController {
  var selectedStatus = 'Tất cả'.obs;
  var fromDate = Rxn<DateTime>();
  var toDate = Rxn<DateTime>();

  void setStatus(String value) => selectedStatus.value = value;

  void setDateRange(DateTime from, DateTime to) {
    fromDate.value = from;
    toDate.value = to;
  }

  void resetDateRange() {
    fromDate.value = null;
    toDate.value = null;
  }

  DateTime onlyDate(DateTime dt) => DateTime(dt.year, dt.month, dt.day);

  List<DebtModel> get filteredDebts {
    final String status = selectedStatus.value;
    final DateTime? from = fromDate.value;
    final DateTime? to = toDate.value;

    return mockDebts.where((d) {
      final statusMatch = status == 'Tất cả' || d.status == status;
      final debtDate = onlyDate(d.date);

      final dateMatch = (from == null || !debtDate.isBefore(onlyDate(from))) &&
          (to == null || !debtDate.isAfter(onlyDate(to)));

      return statusMatch && dateMatch;
    }).toList();
  }

  int get totalAmount =>
      filteredDebts.fold(0, (sum, item) => sum + item.amount);
}
