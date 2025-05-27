import 'package:get/get.dart';
import 'package:merchant/models/contracts.dart';
import 'package:merchant/providers/api_provider.dart';

class ContractRepository {
  final ApiProvider _apiProvider = Get.find<ApiProvider>();

  Future<List<Contract>> getAllStvContract() async {
    try {
      final response = await _apiProvider.get("stv-contracts");
      print("data: $response");

      if (response["success"] == true && response["data"] != null) {
        final List<dynamic> contractData = response["data"];

        return contractData
            .map((contractJson) => Contract.fromJson(contractJson))
            .toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<List<Contract>> getAllExpiredContracts() async {
    try {
      final response = await _apiProvider.get("expired-contracts");
      print("data: $response");

      if (response["success"] == true && response["data"] != null) {
        final List<dynamic> contractData = response["data"];

        return contractData
            .map((contractJson) => Contract.fromJson(contractJson))
            .toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<List<Contract>> getAllConfirmContracts() async {
    try {
      final response = await _apiProvider.get("confirm-contracts");
      print("data: $response");

      if (response["success"] == true && response["data"] != null) {
        final List<dynamic> contractData = response["data"];

        return contractData
            .map((contractJson) => Contract.fromJson(contractJson))
            .toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<Contract?> getContractDetail(int id) async {
    try {
      final response = await _apiProvider.get("contract-detail/$id");

      if (response["success"] == true && response["data"] != null) {
        final contractDetailData = response["data"];

        Contract contract = Contract.fromJson(contractDetailData);
        return contract;
      }
      return null;
    } catch (e) {
      print('Error fetching schedule detail: $e');
      return null;
    }
  }
}
