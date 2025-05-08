import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TruckController extends GetxController {
  RxString selectedFilter = 'Tất cả'.obs;

  Color getStatusColor(String status) {
    switch (status) {
      case 'Đã sắp':
        return Colors.green;
      case 'Chưa sắp':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  void setFilter(String filter) {
    selectedFilter.value = filter;
  }

  Color getCardColor(String filter, Color baseColor) {
    return selectedFilter.value == filter
        ? baseColor.withOpacity(0.05)
        : Colors.white;
  }

  bool isSelected(String filter) => selectedFilter.value == filter;
}
