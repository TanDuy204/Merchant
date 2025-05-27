import 'package:get/get.dart';
import 'package:merchant/controllers/auth_controller.dart';
import 'package:merchant/controllers/contract_controller.dart';
import 'package:merchant/controllers/point_controller.dart';
import 'package:merchant/controllers/truck_controller.dart';
import 'package:merchant/providers/api_provider.dart';
import 'package:merchant/reponsitories/auth_repository.dart';
import 'package:merchant/reponsitories/contract_repository.dart';
import 'package:merchant/reponsitories/point_repository.dart';
import 'package:merchant/reponsitories/truck_repository.dart';

import '../controllers/driver_controller.dart';
import '../reponsitories/driver_repository.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    // Khởi tạo API Provider
    Get.put(ApiProvider(), permanent: true);

    // Khởi tạo repositories
    Get.put(AuthRepository(), permanent: true);

    // Khởi tạo controllers
    Get.put(AuthController(), permanent: true);

    Get.put(DriverRepository());

    Get.put(DriverController());

    Get.put(PointRepository());

    Get.put(PointController());

    Get.put(ContractRepository());

    Get.put(ContractController());

    Get.put(TruckRepository());

    Get.put(TruckController());
  }
}
