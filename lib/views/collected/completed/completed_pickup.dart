import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merchant/common/app_dimensions.dart';
import 'package:merchant/common/custom_info_row.dart';
import 'package:merchant/common/custom_status_badge.dart';
import 'package:merchant/models/schedule_model.dart';

import '../../../common/app_style.dart';
import '../../../common/bordered_container.dart';

class CompletedPickupScreen extends StatelessWidget {
  final List<Schedule> schedules;
  const CompletedPickupScreen({super.key, required this.schedules});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(childCount: 2, (context, index) {
            return GestureDetector(
                onTap: () {
                  Get.toNamed('/completedCollected');
                },
                child: BorderedContainer(
                  margin: EdgeInsets.all(AppDimensions.paddingSmall(context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Mã thu gom: CTG_22223",
                              style: AppTextStyles.titleXSmall(context)),
                          const Spacer(),
                          const CustomStatusBadge(
                              status: "Đã sắp", color: Colors.green)
                        ],
                      ),
                      const Divider(),
                      const CustomInfoRow(
                          useExpanded: true,
                          title: "Tên công ty:",
                          value: "Công ty TNHH Sản xuất Việt Nam"),
                      SizedBox(height: AppDimensions.paddingTiny(context)),
                      const CustomInfoRow(
                          useExpanded: true,
                          title: "Địa chỉ gom:",
                          value: "Khu công nghiệp Quang Minh, Hà Nội"),
                      SizedBox(height: AppDimensions.paddingTiny(context)),
                      const CustomInfoRow(
                          useExpanded: true,
                          title: "Loại hàng:",
                          value: "Chất thải sinh hoạt"),
                      SizedBox(height: AppDimensions.paddingTiny(context)),
                      const CustomInfoRow(
                          useExpanded: true,
                          title: "Tài xế:",
                          value: "Nguyễn Văn A"),
                      SizedBox(height: AppDimensions.paddingTiny(context)),
                      const CustomInfoRow(
                          useExpanded: true,
                          title: "Biển số xe:",
                          value: "29H1-45621"),
                    ],
                  ),
                ));
          }),
        ),
      ],
    ));
  }
}
