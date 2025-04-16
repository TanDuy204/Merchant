import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merchant/common/app_style.dart';
import 'package:merchant/controllers/login_controller.dart';

class LoginScreen extends StatelessWidget {
  final controller = Get.put(LoginController());

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/mtac.png', height: 100),
              const SizedBox(height: 16),
              TextField(
                controller: controller.emailController,
                style: AppTextStyles.bodyMedium(context),
                decoration: InputDecoration(
                  hintText: 'Nhập Mã số thuế',
                  hintStyle: AppTextStyles.bodyMedium(context)
                      .copyWith(color: AppColors.greyColor),
                  filled: true,
                  fillColor: const Color(0xFFF1F7FF),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: controller.passwordController,
                obscureText: true,
                style: AppTextStyles.bodyMedium(context),
                decoration: InputDecoration(
                  hintText: 'Mật khẩu',
                  hintStyle: AppTextStyles.bodyMedium(context)
                      .copyWith(color: AppColors.greyColor),
                  filled: true,
                  fillColor: const Color(0xFFF1F7FF),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (_) {}),
                      Text("Ghi nhớ đăng nhập",
                          style: AppTextStyles.bodySmall(context)),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text("Bạn quên mật khẩu?",
                        style: AppTextStyles.bodySmall(context)
                            .copyWith(color: AppColors.lightBlueColor)),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Obx(() => SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed:
                          controller.isLoading.value ? null : controller.login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF007AFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: controller.isLoading.value
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text("Đăng nhập",
                              style: AppTextStyles.buttonLabel(context)),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
