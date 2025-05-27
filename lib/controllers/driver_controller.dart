import 'package:get/get.dart';

import '../models/user.dart';
import '../reponsitories/driver_repository.dart';

class DriverController extends GetxController {
  final DriverRepository _driverRepository = Get.find<DriverRepository>();

  final RxBool isUpdating = false.obs;
  final RxList<User> drivers = <User>[].obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  final Rx<User?> selectedDriver = Rx<User?>(null);
  final RxBool isAdding = false.obs;
  @override
  void onInit() {
    super.onInit();
    loadDrivers();
  }

  Future<void> loadDrivers() async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      List<User>? result = await _driverRepository.getAllDrivers();
      drivers.value = result;
    } catch (e) {
      errorMessage.value = 'Lỗi: ${e.toString()}';
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> addDriver(Map<String, dynamic> data, String imgPath) async {
    isAdding.value = true;
    try {
      Map<String, String> fields =
          data.map((key, value) => MapEntry(key, value.toString()));

      final newDriver = await _driverRepository.addDriver(fields, imgPath);

      if (newDriver != null) {
        drivers.add(newDriver);
        Get.snackbar('Thành công', 'Tạo tài xế thành công');
        return true;
      }
      return false;
    } catch (e) {
      Get.snackbar('Lỗi', e.toString());
      return false;
    } finally {
      isAdding.value = false;
    }
  }

  Future<bool> updateDriver(int driverId, Map<String, dynamic> data) async {
    isUpdating.value = true;
    errorMessage.value = '';

    try {
      final updatedDriver =
          await _driverRepository.updateDriver(driverId, data);

      if (updatedDriver != null) {
        final index = drivers.indexWhere((d) => d.id == driverId);
        if (index != -1) {
          drivers[index] = updatedDriver;
        }

        Get.snackbar('Thành công', 'Cập nhật tài xế thành công');
        return true;
      } else {
        throw Exception('Không thể cập nhật tài xế');
      }
    } catch (e) {
      errorMessage.value = 'Lỗi: ${e.toString()}';
      Get.snackbar('Lỗi', e.toString());
      return false;
    } finally {
      isUpdating.value = false;
    }
  }

  void clearError() {
    errorMessage.value = '';
  }

  Future<bool> deleteDriver(int driverId) async {
    try {
      bool result = await _driverRepository.deleteDriver(driverId);

      if (result) {
        drivers.removeWhere((d) => d.id == driverId);
        return true;
      }
      return false;
    } catch (e) {
      errorMessage.value = 'Lỗi khi xóa: ${e.toString()}';
      return false;
    }
  }

  int get totalDrivers => drivers.length;

  void refresh() => loadDrivers();

  void clearSelection() {
    selectedDriver.value = null;
  }
}
