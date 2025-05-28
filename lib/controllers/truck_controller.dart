import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merchant/models/truck.dart';
import 'package:merchant/reponsitories/truck_repository.dart';

class TruckController extends GetxController {
  var filter = 'Tổng xe'.obs;

  final TruckRepository _truckRepository = Get.find<TruckRepository>();

  final RxList<Truck> allTrucks = <Truck>[].obs;
  RxList<Truck> filteredTrucks = <Truck>[].obs;
  final Rxn<Truck> truck = Rxn<Truck>();
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  @override
  void onInit() {
    super.onInit();
    getAllTrucks();
    ever(filter, (_) => applyFilter());
  }

  Future<void> getAllTrucks() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      final trucks = await _truckRepository.getAllTruck();
      allTrucks.assignAll(trucks);
      applyFilter();
    } catch (e) {
      errorMessage.value = 'Lỗi khi tải dữ liệu: ${e.toString()}';
      allTrucks.clear();
      filteredTrucks.clear();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getTruckDetail(int id) async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      Truck? result = await _truckRepository.getTruckDetail(id);
      truck.value = result;
    } catch (e) {
      errorMessage.value = 'Lỗi: ${e.toString()}';
    } finally {
      isLoading.value = false;
    }
  }

  void setFilter(String newFilter) {
    filter.value = newFilter;
  }

  void applyFilter() {
    if (filter.value == 'Đã sắp') {
      filteredTrucks.value =
          allTrucks.where((t) => t.status == 'đã sắp lịch').toList();
    } else if (filter.value == 'Chưa sắp') {
      filteredTrucks.value =
          allTrucks.where((t) => t.status == 'chưa sắp lịch').toList();
    } else {
      filteredTrucks.value = List.from(allTrucks);
    }
  }

  int get totalCount => allTrucks.length;

  int get assignedCount =>
      allTrucks.where((t) => t.status == 'đã sắp lịch').length;

  int get unassignedCount =>
      allTrucks.where((t) => t.status == 'chưa sắp lịch').length;

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
      case 'đã sắp lịch':
        return assignedCount;
      case 'chưa sắp lịch':
        return unassignedCount;
      default:
        return totalCount;
    }
  }

  String get countLabel {
    switch (filter.value) {
      case 'đã sắp lịch':
        return 'Đã sắp';
      case 'chưa sắp lịch':
        return 'Chưa sắp';
      default:
        return 'Tổng';
    }
  }

  Color getStatusColor(String status) {
    switch (status) {
      case 'đã sắp lịch':
        return Colors.green;
      case 'chưa sắp lịch':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  Color getBackgroundTintColor(String status) {
    switch (status) {
      case 'đã sắp lịch':
        return Colors.green.shade50;
      case 'chưa sắp lịch':
        return Colors.orange.shade50;
      default:
        return Colors.grey.shade200;
    }
  }
}
