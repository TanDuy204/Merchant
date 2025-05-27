import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:merchant/common/bordered_container.dart';

import '../../../common/app_style.dart';
import '../../../common/custom_info_row.dart';
import '../../../common/custom_status_badge.dart';

class PendingList extends StatelessWidget {
  const PendingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate:
                SliverChildBuilderDelegate(childCount: 2, (context, index) {
              return GestureDetector(
                  onTap: () {
                    Get.toNamed('/pendingList');
                  },
                  child: BorderedContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text("Mã thu gom: CTG_22223",
                                  style: AppTextStyles.titleXSmall()),
                            ),
                            const CustomStatusBadge(
                                status: "Đã thu gom", color: Colors.green)
                          ],
                        ),
                        SizedBox(height: 3.h),
                        const Divider(),
                        const CustomInfoRow(
                            title: "Tên công ty:",
                            value: "Công ty TNHH Sản xuất Việt Nam"),
                        SizedBox(height: 7.h),
                        const CustomInfoRow(
                            title: "Địa chỉ gom:",
                            value: "Khu công nghiệp Quang Minh, Hà Nội"),
                        SizedBox(height: 7.h),
                        const CustomInfoRow(
                            title: "Loại hàng:", value: "Chất thải sinh hoạt"),
                        SizedBox(height: 7.h),
                        const CustomInfoRow(
                            title: "Tài xế:", value: "Nguyễn Văn A"),
                        SizedBox(height: 7.h),
                        const CustomInfoRow(
                            title: "Biển số xe:", value: "29H1-45621"),
                      ],
                    ),
                  ));
            }),
          ),
        ],
      ),
    );
  }
}

Widget statusBadge(String status, BuildContext context) {
  final isCollected = status == "Đã thu gom";
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(
      color: isCollected ? Colors.green : Colors.red,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      status,
      style: AppTextStyles.bodyMedium().copyWith(color: AppColors.whiteColor),
    ),
  );
}
