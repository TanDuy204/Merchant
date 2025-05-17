import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/truck.dart';

class TruckController extends GetxController {
  var filter = 'Tổng xe'.obs;

  void setFilter(String value) {
    filter.value = value;
  }

  List<truck> allTrucks = [];

  /// Lọc danh sách theo bộ lọc hiện tại
  List<truck> get filteredTrucks {
    if (filter.value == 'Đã sắp') {
      return allTrucks.where((t) => t.status == 'Đã sắp lịch').toList();
    } else if (filter.value == 'Chưa sắp') {
      return allTrucks.where((t) => t.status == 'Chưa sắp lịch').toList();
    }
    return allTrucks;
  }

  int get filteredCount => filteredTrucks.length;

  double get progressValue {
    if (totalCount == 0) return 0;
    switch (filter.value) {
      case 'Đã sắp':
        return assignedCount / totalCount;
      case 'Chưa sắp':
        return unassignedCount / totalCount;
      default:
        return 1.0;
    }
  }

  int get displayCount {
    switch (filter.value) {
      case 'Đã sắp':
        return assignedCount;
      case 'Chưa sắp':
        return unassignedCount;
      default:
        return totalCount;
    }
  }

  String get countLabel {
    switch (filter.value) {
      case 'Đã sắp':
        return 'Đã sắp';
      case 'Chưa sắp':
        return 'Chưa sắp';
      default:
        return 'Tổng';
    }
  }

  /// Đếm số lượng tổng, đã sắp và chưa sắp
  int get totalCount => allTrucks.length;

  int get assignedCount =>
      allTrucks.where((t) => t.status == 'Đã sắp lịch').length;

  int get unassignedCount =>
      allTrucks.where((t) => t.status == 'Chưa sắp lịch').length;

  Color getStatusColor(String status) {
    switch (status) {
      case 'Đã sắp lịch':
        return Colors.green;
      case 'Chưa sắp lịch':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  Color getBackgroundTintColor(String status) {
    switch (status) {
      case 'Đã sắp lịch':
        return Colors.green.shade50;
      case 'Chưa sắp lịch':
        return Colors.orange.shade50;
      default:
        return Colors.grey;
    }
  }
}
