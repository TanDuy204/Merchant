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

  Future<Truck?> getTruckDetail(int id) async {
    try {
      final response = await _apiProvider.get('trucks/$id');
      print("response ${response}");
      if (response['success'] == true && response['data'] != null) {
        final truckDetailData = response['data']['truck'];
        truckDetailData['schedule'] ??= [];

        Truck truck = Truck.fromJson(truckDetailData);
        return truck;
      }
      return null;
    } catch (e) {
      print('Error fetching schedule detail: $e');
      return null;
    }
  }
}
