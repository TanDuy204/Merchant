import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:merchant/common/app_dimensions.dart';
import 'package:merchant/common/app_style.dart';

import '../../service/uidata.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        toolbarHeight: AppDimensions.heightSmall(),
        backgroundColor: AppColors.whiteColor,
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Chào, Trần Đức Thành",
              style: AppTextStyles.titleMedium(),
            ),
            Text(
              "MTAC Merchant",
              style: AppTextStyles.bodyLarge()
                  .copyWith(color: AppColors.greyColor),
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(10),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.lightWhiteColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.monetization_on_outlined,
                          color: AppColors.blueColor,
                          size: 22.sp,
                        ),
                        SizedBox(width: 15.w),
                        Text(
                          "100,000,000,000 đ",
                          style: AppTextStyles.titleXSmall()
                              .copyWith(color: AppColors.blueColor),
                        ),
                        SizedBox(width: 15.w),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: AppColors.blueColor,
                          size: 18.sp,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF7FAFFD), Color(0xFF1867C1)],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 32.w,
                          height: 32.h,
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.account_balance_wallet_outlined,
                            color: Colors.white,
                            size: 32.sp,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Doanh thu hôm nay",
                              style: AppTextStyles.bodySmall()
                                  .copyWith(color: AppColors.whiteColor),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "100,000,000,000 đ",
                              style: AppTextStyles.titleXSmall()
                                  .copyWith(color: AppColors.whiteColor),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hôm qua",
                              style: AppTextStyles.bodySmall()
                                  .copyWith(color: AppColors.whiteColor),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "100,000,000,000 đ",
                              style: AppTextStyles.titleSmall()
                                  .copyWith(color: AppColors.whiteColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "250 ",
                              style: AppTextStyles.titleXSmall(),
                            ),
                            TextSpan(
                                text: "Lịch chưa sắp",
                                style: AppTextStyles.bodyMedium()),
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
                              style: AppTextStyles.titleXSmall(),
                            ),
                            TextSpan(
                                text: "Lịch đã sắp",
                                style: AppTextStyles.bodyMedium()),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          SliverGrid(
            delegate: SliverChildListDelegate(
              [
                // buildGridItem(
                //   context: context,
                //   onTap: () => Get.toNamed('/schedule'),
                //   label: "Sắp lịch",
                //   badge: 3,
                //   icon: Icons.event_note_outlined,
                // ),
                buildGridItem(
                  context: context,
                  onTap: () => Get.toNamed('/collected'),
                  label: "Lịch gom",
                  icon: Icons.event_note_outlined,
                ),
                buildGridItem(
                  context: context,
                  onTap: () => Get.toNamed('/list'),
                  label: "Bảng kê",
                  badge: 6,
                  icon: Icons.assignment_outlined,
                ),
                buildGridItem(
                  context: context,
                  onTap: () => Get.toNamed('/driverAccount'),
                  label: "Tài xế",
                  badge: 1,
                  icon: Icons.person_outline,
                ),
                buildGridItem(
                  context: context,
                  onTap: () => Get.toNamed('/truck'),
                  label: "Quản lý xe",
                  icon: Icons.local_shipping_outlined,
                ),
                buildGridItem(
                  context: context,
                  onTap: () => Get.toNamed('/debt'),
                  label: "Công nợ",
                  icon: Icons.monetization_on_outlined,
                ),
                buildGridItem(
                  onTap: () => Get.toNamed('/contract'),
                  label: "Hợp đồng",
                  context: context,
                  badge: 21,
                  icon: Icons.description_outlined,
                ),
              ],
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(10, 25, 10, 0),
            sliver: SliverToBoxAdapter(
              child: Text(
                "Mời thầu vận chuyển",
                style: AppTextStyles.titleMedium(),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(12.h),
            sliver: SliverGrid.builder(
              itemCount: images.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: AppDimensions.heightLarge(),
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemBuilder: (context, index) {
                final image = images[index];
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: Colors.white,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          image['image']!,
                          width: double.infinity,
                          height: AppDimensions.heightMedium(),
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            image['title']!,
                            style: AppTextStyles.titleSmall(),
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
          ),
        ],
      ),
    );
  }

  Widget buildGridItem({
    required BuildContext context,
    required IconData icon,
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
                LayoutBuilder(
                  builder: (context, constraints) {
                    double iconSize = constraints.maxWidth * 0.32;
                    return Icon(
                      icon,
                      size: iconSize,
                      color: Colors.black,
                    );
                  },
                ),
                const SizedBox(height: 8),
                Text(
                  label,
                  style: AppTextStyles.bodySmall(),
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
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Text(
                  badge.toString(),
                  style: AppTextStyles.titleTini()
                      .copyWith(color: AppColors.whiteColor),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
