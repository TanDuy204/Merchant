import 'package:get/get.dart';
import 'package:merchant/models/truck.dart';
import 'package:merchant/providers/api_provider.dart';

class TruckRepository {
  final ApiProvider _apiProvider = Get.find<ApiProvider>();

  Future<List<Truck>> getAllTruck() async {
    try {
      final response = await _apiProvider.get('trucks');
      print("response ${response}");
      if (response['success'] == true && response['data'] != null) {
        final List<dynamic> truckData = response['data'];

        return truckData.map((truckJson) => Truck.fromJson(truckJson)).toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }
}
