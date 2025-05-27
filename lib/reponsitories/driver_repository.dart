import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/user.dart';
import '../providers/api_provider.dart';

class DriverRepository {
  final ApiProvider _apiProvider = Get.find<ApiProvider>();

  ///Lấy danh sách tài xế
  Future<List<User>> getAllDrivers() async {
    try {
      final response = await _apiProvider.get('driver');
      print('Response received: $response');

      if (response['success'] == true && response['data'] != null) {
        final List<dynamic> driverData = response['data'];

        return driverData
            .map((driverJson) => User.fromJson(driverJson))
            .toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<User?> addDriver(
      Map<String, String> fields, String imgFilePath) async {
    try {
      var file =
          await http.MultipartFile.fromPath('img_GPLX_path', imgFilePath);

      final response =
          await _apiProvider.multipartPost('driver', fields, [file]);

      if (response['success'] == true && response['data'] != null) {
        return User.fromJson(response['data']['driver']);
      }
      throw Exception(response['message'] ?? 'Tạo tài xế thất bại');
    } catch (e) {
      print('Add driver error: $e');
      rethrow;
    }
  }

  ///Xóa tài khoản tài xế
  Future<bool> deleteDriver(int driverId) async {
    try {
      print('Deleting driver with ID: $driverId');
      final response = await _apiProvider.delete('driver/$driverId');

      return response != null;
    } catch (e) {
      print('Delete driver error: $e');
      return false;
    }
  }

  /// Cập nht tài khoản tài xé
  Future<User?> updateDriver(int driverId, Map<String, dynamic> data) async {
    try {
      final response = await _apiProvider.put('driver/$driverId', data);
      print('Update driver response: $response');

      if (response['success'] == true && response['data'] != null) {
        final driverData = response['data']['driver'] ?? response['data'];
        return User.fromJson(driverData);
      }
      throw Exception(response['message'] ?? 'Cập nhật tài xế thất bại');
    } catch (e) {
      print('Update driver error: $e');
      rethrow;
    }
  }
}
