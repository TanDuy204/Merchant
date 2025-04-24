import 'package:get/get.dart';
import 'package:merchant/controllers/auth_controller.dart';
import 'package:merchant/providers/api_provider.dart';
import 'package:merchant/reponsitories/auth_repository.dart';


class InitialBinding implements Bindings {
  @override
  void dependencies() {
    // Khởi tạo API Provider
    Get.put(ApiProvider(), permanent: true);

    // Khởi tạo repositories
    Get.put(AuthRepository(), permanent: true);

    // Khởi tạo controllers
    Get.put(AuthController(), permanent: true);

  }
}