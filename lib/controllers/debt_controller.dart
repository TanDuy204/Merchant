import 'package:get/get.dart';
import 'package:merchant/models/debt_model.dart';

class DebtController extends GetxController {
  final allDebts = <DebtModel>[].obs;

  final groupedDebts = <DateTime, List<DebtModel>>{}.obs;
  final groupDates = <DateTime>[].obs;

  @override
  void onInit() {
    super.onInit();
    ever(allDebts, (_) => _groupDebts());
  }

  void setDebts(List<DebtModel> list) {
    allDebts.assignAll(list);
  }

  void _groupDebts() {
    final Map<DateTime, List<DebtModel>> map = {};

    for (var d in allDebts) {
      final day = DateTime(d.day.year, d.day.month, d.day.day);
      map.putIfAbsent(day, () => []).add(d);
    }

    map.forEach((_, v) => v.sort((a, b) => a.day.compareTo(b.day)));

    final keys = map.keys.toList()..sort((a, b) => b.compareTo(a));

    groupedDebts.assignAll(map);
    groupDates.assignAll(keys);
  }
}
