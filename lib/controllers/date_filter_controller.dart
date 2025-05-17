import 'package:get/get.dart';

class DateFilterController extends GetxController {
  Rx<DateTime?> fromDate = Rx<DateTime?>(null);
  Rx<DateTime?> toDate = Rx<DateTime?>(null);

  void setFromDate(DateTime? from) {
    fromDate.value = from;
  }

  void setToDate(DateTime? to) {
    toDate.value = to;
  }

  void resetFilter() {
    fromDate.value = null;
    toDate.value = null;
  }
}
