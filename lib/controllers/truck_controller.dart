import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/truck_model.dart';

class TruckController extends GetxController {
  final RxList<TruckModel> filteredTrucks = <TruckModel>[].obs;
  final RxList<TruckModel> truckList = <TruckModel>[].obs;
  final RxString selectedStatus = ''.obs;

  final RxMap<String, Color> statusColors = <String, Color>{
    'bảo trì': const Color(0xFFFEE690),
    'có chuyến': const Color(0xFF70CF97),
    'chờ chuyến': const Color(0xFF62D2FF),
    'default': Colors.grey,
  }.obs;

  Color getStatusColor(String status) {
    return statusColors[status] ?? statusColors['default']!;
  }

  /// Nhận danh sách xe từ TruckScreen
  void setTrucks(List<TruckModel> trucks) {
    filteredTrucks.assignAll(trucks);
    truckList.assignAll(trucks);
  }

  /// Lọc xe theo trạng thái
  void filterByStatus(String status) {
    if (selectedStatus.value == status) {
      filteredTrucks.assignAll(truckList);
    } else {
      filteredTrucks.assignAll(
        truckList.where((t) => t.status == status).toList(),
      );
    }
  }

  int countAll() => truckList.length;

  int countByStatus(String status) =>
      truckList.where((t) => t.status == status).length;
}
