import 'package:get/get.dart';

import '../models/point.dart';
import '../reponsitories/point_repository.dart';

class PointController extends GetxController {
  final PointRepository _pointRepository = Get.find<PointRepository>();

  final RxList<Point> points = <Point>[].obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  final point = Rxn<Point>();

  ///Lịch gom đã sắp
  Future<void> getArrangedSchedule() async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      List<Point> result = await _pointRepository.getAllArrangedSchedule();
      points.value = result;
    } catch (e) {
      errorMessage.value = 'Lỗi: ${e.toString()}';
    } finally {
      isLoading.value = false;
    }
  }

  ///Lịch gom chưa sắp
  Future<void> getNotyetSchedule() async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      List<Point> result = await _pointRepository.getAllNotyetSchedule();
      points.value = result;
    } catch (e) {
      errorMessage.value = 'Lỗi: ${e.toString()}';
    } finally {
      isLoading.value = false;
    }
  }

  ///Lịch gom hôm nay
  Future<void> getTodaySchedule() async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      List<Point> result = await _pointRepository.getAllTodaySchedule();
      points.value = result;
    } catch (e) {
      errorMessage.value = 'Lỗi: ${e.toString()}';
    } finally {
      isLoading.value = false;
    }
  }

  ///chi tiết lịch gom
  Future<void> loadScheduleDetail(int id) async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      Point? result = await _pointRepository.getScheduleDetail(id);
      point.value = result;
    } catch (e) {
      errorMessage.value = 'Lỗi: ${e.toString()}';
    } finally {
      isLoading.value = false;
    }
  }
}
