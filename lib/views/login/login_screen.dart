import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merchant/common/app_style.dart';
import 'package:merchant/controllers/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  final AuthController _authController = Get.find<AuthController>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                controller:_usernameController,
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
                controller: _passwordController,
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
                  onPressed: _authController.isLoading.value
                      ? null
                      : () => _handleLogin(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF007AFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: _authController.isLoading.value
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

  void _handleLogin() async {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      Get.snackbar(
        'Lỗi',
        'Vui lòng nhập đầy đủ thông tin đăng nhập',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    bool success = await _authController.login(username, password);
    if (success) {
      Get.snackbar(
        "Đăng nhập thành công",
        "Chào ${username}",
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      Get.offAllNamed('/main');
    }else {
      Get.snackbar(
        "Đăng nhập thất bại",
        "Sai email hoặc mật khẩu",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:merchant/controllers/auth_controller.dart';
// import 'package:merchant/controllers/login_controller.dart';
//
//
// class LoginScreen extends StatelessWidget {
//   final AuthController _authController = Get.find<AuthController>();
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//
//   LoginScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Obx(() {
//           return Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 const Text(
//                   'Đăng nhập',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 TextField(
//                   controller: _usernameController,
//                   decoration: const InputDecoration(
//                     labelText: 'Tên đăng nhập',
//                     border: OutlineInputBorder(),
//                     prefixIcon: Icon(Icons.person),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 TextField(
//                   controller: _passwordController,
//                   obscureText: true,
//                   decoration: const InputDecoration(
//                     labelText: 'Mật khẩu',
//                     border: OutlineInputBorder(),
//                     prefixIcon: Icon(Icons.lock),
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 if (_authController.errorMessage.isNotEmpty)
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 20),
//                     child: Text(
//                       _authController.errorMessage.value,
//                       style: const TextStyle(color: Colors.red),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ElevatedButton(
//                   onPressed: _authController.isLoading.value
//                       ? null
//                       : () => _handleLogin(),
//                   style: ElevatedButton.styleFrom(
//                     padding: const EdgeInsets.symmetric(vertical: 15),
//                   ),
//                   child: _authController.isLoading.value
//                       ? const CircularProgressIndicator()
//                       : const Text('Đăng nhập'),
//                 ),
//               ],
//             ),
//           );
//         }),
//       ),
//     );
//   }
//
//   void _handleLogin() async {
//     String username = _usernameController.text.trim();
//     String password = _passwordController.text.trim();
//
//     if (username.isEmpty || password.isEmpty) {
//       Get.snackbar(
//         'Lỗi',
//         'Vui lòng nhập đầy đủ thông tin đăng nhập',
//         snackPosition: SnackPosition.BOTTOM,
//       );
//       return;
//     }
//
//     bool success = await _authController.login(username, password);
//     if (success) {
//       Get.snackbar(
//         "Đăng nhập thành công",
//         "Chào ${username}",
//         backgroundColor: Colors.green,
//         colorText: Colors.white,
//       );
//       Get.offAllNamed('/main');
//     }else {
//       Get.snackbar(
//         "Đăng nhập thất bại",
//         "Sai email hoặc mật khẩu",
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//       );
//     }
//   }
// }