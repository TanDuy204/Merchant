import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:merchant/common/app_style.dart';
import 'package:merchant/controllers/auth_controller.dart';
import 'package:merchant/views/profile/profile_account.dart';

class ProfileScreen extends StatelessWidget {
  final AuthController _authController = Get.find<AuthController>();

  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text(
          "Thông tin tài khoản",
          style: AppTextStyles.titleMedium(),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Obx(() {
                final user = _authController.users.value;

                if (user == null) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 50.h),
                      child: Text(
                        'Bạn chưa đăng nhập',
                        style: AppTextStyles.titleMedium(),
                      ),
                    ),
                  );
                }

                return Column(
                  children: [
                    GestureDetector(
                      onTap: () => Get.to(() => const ProfileAccount()),
                      child: CircleAvatar(
                        radius: 50.r,
                        backgroundImage: (user.profilePhotoPath != null &&
                                user.profilePhotoPath!.isNotEmpty)
                            ? NetworkImage(user.profilePhotoPath!)
                            : const AssetImage('assets/images/images.png')
                                as ImageProvider,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      user.name ?? "Không có tên",
                      style: AppTextStyles.titleMedium(),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      user.email ?? "Không có email",
                      style: AppTextStyles.bodyMedium().copyWith(
                        color: AppColors.greyColor,
                      ),
                    ),
                  ],
                );
              }),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 40.h),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(10.h),
                child: Column(
                  children: [
                    customCard(
                      leadingIcon: Icons.local_shipping_outlined,
                      title: "Tài khoản tài xế",
                      trailingIcon: Icons.chevron_right_outlined,
                      onTap: () => Get.toNamed('/driverAccount'),
                    ),
                    SizedBox(height: 5.h),
                    customCard(
                      leadingIcon: Icons.person_add_alt,
                      title: "Tạo tài khoản tài xế",
                      trailingIcon: Icons.chevron_right_outlined,
                      onTap: () => Get.toNamed('/createAccount'),
                    ),
                    SizedBox(height: 5.h),
                    customCard(
                      leadingIcon: Icons.send_outlined,
                      title: "Gửi lời mời tài khoản tài xế",
                      trailingIcon: Icons.chevron_right_outlined,
                      onTap: () => Get.toNamed('/inviteAccount'),
                    ),
                    SizedBox(height: 5.h),
                    customCard(
                      leadingIcon: Icons.logout,
                      title: "Đăng xuất",
                      trailingIcon: Icons.chevron_right_outlined,
                      onTap: () async {
                        bool success = await _authController.logout();
                        if (success) {
                          Get.offAllNamed('/login');
                          Get.snackbar('Thông báo', 'Đăng xuất thành công');
                        } else {
                          Get.snackbar(
                            'Lỗi',
                            'Đăng xuất thất bại, vui lòng thử lại',
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 30.h)),
          ],
        ),
      ),
    );
  }

  Widget customCard({
    required IconData leadingIcon,
    required String title,
    required IconData trailingIcon,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 5,
      color: Colors.grey.shade300,
      shadowColor: Colors.black12,
      child: ListTile(
        leading: Icon(leadingIcon, size: 24.sp),
        title: Text(
          title,
          style: AppTextStyles.bodyMedium(),
        ),
        trailing: Icon(
          trailingIcon,
          size: 24.sp,
        ),
        onTap: onTap,
      ),
    );
  }
}
