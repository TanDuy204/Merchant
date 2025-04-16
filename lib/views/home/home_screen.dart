import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merchant/common/app_dimensions.dart';
import 'package:merchant/common/app_style.dart';
import 'package:merchant/routes/app_route.dart';
import 'package:merchant/views/debt/debt_screen.dart';
import 'package:merchant/views/list/list_screen.dart';

import '../../service/uidata.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: AppDimensions.heightSmall(context),
        backgroundColor: AppColors.whiteColor,
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Chào, Trần Đức Thành",
              style: AppTextStyles.titleMedium(context),
            ),
            Text(
              "MTAC Merchant",
              style: AppTextStyles.bodyLarge(context)
                  .copyWith(color: AppColors.greyColor),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.lightWhiteColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("assets/icons/dollar_coin.png"),
                  const SizedBox(width: 15),
                  Text(
                    "100,000,000,000 đ",
                    style: AppTextStyles.titleSmall(context)
                        .copyWith(color: AppColors.blueColor),
                  ),
                  const SizedBox(width: 15),
                  const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: AppColors.blueColor,
                    size: 15,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 35),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [Color(0xFF7FAFFD), Color(0xFF1867C1)],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.account_balance_wallet_outlined,
                          color: Colors.white, size: 40),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Doanh thu hôm nay",
                            style: AppTextStyles.bodySmall(context)
                                .copyWith(color: AppColors.whiteColor),
                          ),
                          Text(
                            "100,000,000,000 đ",
                            style: AppTextStyles.titleMedium(context)
                                .copyWith(color: AppColors.whiteColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hôm qua",
                        style: AppTextStyles.bodySmall(context)
                            .copyWith(color: AppColors.whiteColor),
                      ),
                      Text(
                        "100,000,000,000 đ",
                        style: AppTextStyles.titleSmall(context)
                            .copyWith(color: AppColors.whiteColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "250",
                        style: AppTextStyles.titleSmall(context),
                      ),
                      TextSpan(
                          text: "Lịch chưa sắp",
                          style: AppTextStyles.bodySmall(context)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    height: 20,
                    width: 1,
                    color: Colors.grey,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "12.6k ",
                        style: AppTextStyles.titleSmall(context),
                      ),
                      TextSpan(
                          text: "Lịch đã sắp",
                          style: AppTextStyles.bodySmall(context))
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 35),
            GridView.count(
                crossAxisCount: 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  buildGridItem(
                      onTap: () {
                        Get.toNamed(AppRoutes.schedule);
                      },
                      label: "Sắp lịch",
                      context: context,
                      badge: 3,
                      iconPath: 'assets/icons/schedule.png'),
                  buildGridItem(
                      onTap: () {
                        Get.toNamed(AppRoutes.collected);
                      },
                      label: "Đã thu gom",
                      context: context,
                      iconPath: 'assets/icons/collected.png'),
                  buildGridItem(
                      onTap: () {
                        Get.to(() => const ListScreen());
                      },
                      label: "Bảng kê",
                      context: context,
                      badge: 6,
                      iconPath: 'assets/icons/capacity.png'),
                  buildGridItem(
                      onTap: () {},
                      label: "Tài xế",
                      context: context,
                      badge: 1,
                      iconPath: 'assets/icons/driver.png'),
                  buildGridItem(
                      onTap: () {
                        Get.toNamed(AppRoutes.truck);
                      },
                      label: "Quản lý xe",
                      context: context,
                      iconPath: 'assets/icons/truck.png'),
                  buildGridItem(
                      onTap: () {
                        Get.to(() => DebtScreen(debt: mockDebts));
                      },
                      label: "Công nợ",
                      context: context,
                      iconPath: 'assets/icons/money.png'),
                  buildGridItem(
                      onTap: () {},
                      label: "Hợp đồng",
                      context: context,
                      badge: 21,
                      iconPath: 'assets/icons/contract.png'),
                ]),
            const SizedBox(height: 25),
            Text(
              "Mời thầu vận chuyển",
              style: AppTextStyles.titleMedium(context),
            ),
            const SizedBox(height: 15),
            GridView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: images.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: AppDimensions.heightLarge(context),
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemBuilder: (context, index) {
                final image = images[index];
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          image['image']!,
                          width: double.infinity,
                          height: AppDimensions.heightMedium(context),
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            image['title']!,
                            style: AppTextStyles.titleSmall(context),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildGridItem({
  required BuildContext context,
  required String iconPath,
  required String label,
  int? badge,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Stack(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(iconPath, width: 26, height: 26),
              const SizedBox(height: 8),
              Text(
                label,
                style: AppTextStyles.bodySmall(context),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        if (badge != null)
          Positioned(
            top: 0,
            right: 7,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                badge.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    ),
  );
}
