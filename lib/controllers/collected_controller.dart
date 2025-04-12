import 'package:get/get.dart';

import '../models/schedule_model.dart';

class CollectedController extends GetxController {
  var selectedStatus = ''.obs;
  var schedules = <Schedule>[].obs;
  var filteredSchedules = <Schedule>[].obs;

  void setSchedules(List<Schedule> newSchedules) {
    schedules.assignAll(newSchedules);
    filteredSchedules.assignAll(newSchedules);
  }

  void filterByStatus(String status) {
    if (selectedStatus.value == status) {
      selectedStatus.value = '';
      filteredSchedules.assignAll(schedules);
    } else {
      selectedStatus.value = status;
      filteredSchedules.assignAll(
        schedules.where((s) => s.status == status).toList(),
      );
    }
  }
}
