import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:merchant/common/app_dimensions.dart';
import 'package:merchant/common/app_style.dart';
import 'package:merchant/common/bordered_container.dart';
import 'package:merchant/routes/app_route.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.whiteColor,
        title: Text(
          "Thông tin tài khoản",
          style: AppTextStyles.titleMedium(context),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(AppDimensions.paddingSmall(context)),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.profileAccount);
                  },
                  child: BorderedContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        CircleAvatar(
                          radius: AppDimensions.heightSmall(context),
                          backgroundImage:
                              const AssetImage('assets/images/images.png'),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Trần Đức Thành",
                          style: AppTextStyles.titleMedium(context),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "merchant@gmail.com",
                          style: AppTextStyles.bodyMedium(context)
                              .copyWith(color: AppColors.greyColor),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(AppDimensions.paddingSmall(context)),
                child: BorderedContainer(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        _item(
                          context,
                          Icons.local_shipping_outlined,
                          'Tài khoản tài xế',
                          () {
                            Get.toNamed(AppRoutes.driverAccount);
                          },
                          backgroundColor: Colors.grey.shade200,
                        ),
                        const SizedBox(height: 10),
                        _item(
                          context,
                          Icons.person_add_alt,
                          'Tạo tài khoản tài xế',
                          () {
                            Get.toNamed(AppRoutes.createAccount);
                          },
                          backgroundColor: Colors.grey.shade200,
                        ),
                        const SizedBox(height: 10),
                        _item(
                          context,
                          Icons.send_outlined,
                          'Gửi lời mời tài khoản tài xế',
                          () {
                            Get.toNamed(AppRoutes.inviteAccount);
                          },
                          backgroundColor: Colors.grey.shade200,
                        ),
                        const Divider(),
                        _item(
                          context,
                          Icons.logout,
                          'Đăng xuất',
                          () {},
                          backgroundColor: Colors.red.shade100,
                          iconColor: AppColors.redColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _item(
  BuildContext context,
  IconData icon,
  String title,
  Callback onTap, {
  Color backgroundColor = const Color(0xFFE0E0E0),
  Color iconColor = Colors.black,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Row(
      children: [
        Container(
          padding: EdgeInsets.all(AppDimensions.paddingSmall(context)),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: backgroundColor,
          ),
          child: Icon(
            icon,
            color: iconColor,
            size: AppDimensions.iconMedium(context),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            style: AppTextStyles.titleMedium(context),
          ),
        ),
        Icon(
          Icons.arrow_forward_ios,
          size: AppDimensions.iconMedium(context),
          color: Colors.grey,
        ),
      ],
    ),
  );
}
