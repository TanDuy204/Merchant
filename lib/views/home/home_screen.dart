import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merchant/common/app_dimensions.dart';
import 'package:merchant/common/app_style.dart';

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
                        Image.asset("assets/icons/dollar_coin.png",
                            width: AppDimensions.iconSmall(context),
                            height: AppDimensions.iconSmall(context),
                            fit: BoxFit.contain),
                        const SizedBox(width: 15),
                        Text(
                          "100,000,000,000 đ",
                          style: AppTextStyles.titleSmall(context)
                              .copyWith(color: AppColors.blueColor),
                        ),
                        const SizedBox(width: 15),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: AppColors.blueColor,
                          size: AppDimensions.iconSmall(context),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: AppDimensions.iconLarge(context),
                              height: AppDimensions.iconLarge(context),
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.account_balance_wallet_outlined,
                                color: Colors.white,
                                size: AppDimensions.iconLarge(context),
                              ),
                            ),
                            SizedBox(
                                width: AppDimensions.paddingSmall(context)),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Doanh thu hôm nay",
                                  style: AppTextStyles.bodySmall(context)
                                      .copyWith(color: AppColors.whiteColor),
                                ),
                                const SizedBox(height: 4),
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
                            const SizedBox(height: 4),
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
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "250 ",
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
                                style: AppTextStyles.bodySmall(context)),
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
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            sliver: SliverGrid(
              delegate: SliverChildListDelegate(
                [
                  buildGridItem(
                    onTap: () => Get.toNamed('/schedule'),
                    label: "Sắp lịch",
                    context: context,
                    badge: 3,
                    iconPath: 'assets/icons/schedule.png',
                  ),
                  buildGridItem(
                    onTap: () => Get.toNamed('/collected'),
                    label: "Đã thu gom",
                    context: context,
                    iconPath: 'assets/icons/collected.png',
                  ),
                  buildGridItem(
                    onTap: () => Get.toNamed('/list'),
                    label: "Bảng kê",
                    context: context,
                    badge: 6,
                    iconPath: 'assets/icons/capacity.png',
                  ),
                  buildGridItem(
                    onTap: () => Get.toNamed('/driverAccount'),
                    label: "Tài xế",
                    context: context,
                    badge: 1,
                    iconPath: 'assets/icons/driver.png',
                  ),
                  buildGridItem(
                    onTap: () => Get.toNamed('/truck'),
                    label: "Quản lý xe",
                    context: context,
                    iconPath: 'assets/icons/truck.png',
                  ),
                  buildGridItem(
                    onTap: () => Get.toNamed('/debt'),
                    label: "Công nợ",
                    context: context,
                    iconPath: 'assets/icons/money.png',
                  ),
                  buildGridItem(
                    onTap: () => Get.toNamed('/contract'),
                    label: "Hợp đồng",
                    context: context,
                    badge: 21,
                    iconPath: 'assets/icons/contract.png',
                  ),
                ],
              ),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: AppDimensions.heightMedium(context),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(10, 25, 10, 0),
            sliver: SliverToBoxAdapter(
              child: Text(
                "Mời thầu vận chuyển",
                style: AppTextStyles.titleMedium(context),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(12),
            sliver: SliverGrid.builder(
              itemCount: images.length,
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
          ),
        ],
      ),
    );
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
                LayoutBuilder(
                  builder: (context, constraints) {
                    double imageSize = constraints.maxWidth * 0.3;
                    return Image.asset(
                      iconPath,
                      width: imageSize,
                      height: imageSize,
                      fit: BoxFit.contain,
                    );
                  },
                ),
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
                padding: EdgeInsets.symmetric(
                    horizontal: AppDimensions.paddingTiny(context),
                    vertical: AppDimensions.paddingXTiny(context)),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(
                      AppDimensions.paddingSmall(context)),
                ),
                child: Text(
                  badge.toString(),
                  style: AppTextStyles.titleTini(context)
                      .copyWith(color: AppColors.whiteColor),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
