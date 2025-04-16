import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../models/schedule_model.dart';

class CollectedController extends GetxController {
  var selectedStatus = ''.obs;
  var selectedDate = DateTime.now().obs;
  var schedules = <Schedule>[].obs;
  var filteredSchedules = <Schedule>[].obs;
  var filteredSchedulesByDay = <Schedule>[].obs;

  @override
  void onInit() {
    super.onInit();
    filterByDate(DateTime.now());
  }

  void setSchedulesByDate(List<Schedule> newSchedules) {
    schedules.assignAll(newSchedules);
    filterByDate(selectedDate.value);
  }

  void setSchedules(List<Schedule> newSchedules) {
    schedules.assignAll(newSchedules);
    filteredSchedules.assignAll(newSchedules);
  }

  void filterByDate(DateTime date) {
    final formatted = DateFormat("yyyy/MM/dd").format(date);

    filteredSchedulesByDay.value = schedules.where((s) {
      final matchDate =
          DateFormat("yyyy/MM/dd").format(s.datetime) == formatted;
      return matchDate;
    }).toList();
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
