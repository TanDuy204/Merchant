import 'package:get/get.dart';
import 'package:merchant/models/contracts.dart';
import 'package:merchant/reponsitories/contract_repository.dart';

class ContractController extends GetxController {
  final ContractRepository _contractRepository = Get.find<ContractRepository>();

  final RxList<Contract> contracts = <Contract>[].obs;
  final Rxn<Contract> contract = Rxn<Contract>();
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  Future<void> getStvContract() async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      List<Contract>? result = await _contractRepository.getAllStvContract();
      contracts.value = result;
    } catch (e) {
      errorMessage.value = 'Lỗi: ${e.toString()}';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getExpiredContracts() async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      List<Contract>? result =
          await _contractRepository.getAllExpiredContracts();
      contracts.value = result;
    } catch (e) {
      errorMessage.value = 'Lỗi: ${e.toString()}';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getAllConfirmContracts() async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      List<Contract>? result =
          await _contractRepository.getAllConfirmContracts();
      contracts.value = result;
    } catch (e) {
      errorMessage.value = 'Lỗi: ${e.toString()}';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getContractDetail(int id) async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      Contract? result = await _contractRepository.getContractDetail(id);
      contract.value = result;
    } catch (e) {
      errorMessage.value = 'Lỗi: ${e.toString()}';
    } finally {
      isLoading.value = false;
    }
  }
}
