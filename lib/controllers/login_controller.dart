import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../service/uidata.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isLoading = false.obs;

  void login() {
    isLoading.value = true;

    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    final user = mockUsers.firstWhereOrNull(
      (u) => u.email == email && u.password == password,
    );

    Future.delayed(const Duration(seconds: 1), () {
      isLoading.value = false;

      if (user != null) {
        Get.snackbar(
          "Đăng nhập thành công",
          "Chào ${user.username}",
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.offAllNamed('/main');
      } else {
        Get.snackbar(
          "Đăng nhập thất bại",
          "Sai email hoặc mật khẩu",
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    });
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
