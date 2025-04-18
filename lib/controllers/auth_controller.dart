import 'package:get/get.dart';

import '../models/user.dart';
import '../reponsitories/auth_repository.dart';

class AuthController extends GetxController {
  final AuthRepository _authRepository = Get.find<AuthRepository>();

  final Rx<user?> users = Rx<user?>(null);
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    isLoading.value = true;

    try {
      user? currentUser = await _authRepository.getCurrentUser();
      if (currentUser != null) {
        users.value = currentUser;
      }
    } catch (e) {
      errorMessage.value = 'Không thể kiểm tra trạng thái đăng nhập';
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> login(String username, String password) async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      user? loggedInUser = await _authRepository.login(username, password);

      if (loggedInUser != null) {
        users.value = loggedInUser;
        return true;
      } else {
        errorMessage.value = 'Đăng nhập thất bại. Vui lòng kiểm tra thông tin đăng nhập';
        return false;
      }
    } catch (e) {
      errorMessage.value = 'Đăng nhập thất bại: ${e.toString()}';
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> logout() async {
    isLoading.value = true;

    try {
      bool result = await _authRepository.logout();
      if (result) {
        users.value = null;
      }
      return result;
    } catch (e) {
      errorMessage.value = 'Đăng xuất thất bại: ${e.toString()}';
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  bool get isLoggedIn => users.value != null;
  bool get isDriver => users.value?.isDriver() ?? false;
  bool get isContractor => users.value?.isContractor() ?? false;
}