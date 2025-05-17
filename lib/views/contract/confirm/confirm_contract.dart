import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:merchant/common/bordered_container.dart';

import '../../../common/app_style.dart';
import '../../../common/custom_info_row.dart';
import '../../../common/custom_status_badge.dart';

class ConfirmContract extends StatelessWidget {
  const ConfirmContract({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 4,
              (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.toNamed('confirmContract');
                  },
                  child: BorderedContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text("Số hợp đồng: HDNCC.202454",
                                  style: AppTextStyles.titleXSmall()),
                            ),
                            const CustomStatusBadge(
                                status: "Ký kết hoàn tất", color: Colors.green)
                          ],
                        ),
                        SizedBox(height: 3.h),
                        const Divider(),
                        const CustomInfoRow(
                            title: 'Nhà cung cấp:',
                            value: 'Doanh nghiệp tư nhân Minh Hoàng'),
                        SizedBox(height: 7.h),
                        const CustomInfoRow(
                            title: "Ngày hiệu lực:", value: "20-2-2025"),
                        SizedBox(height: 7.h),
                        const CustomInfoRow(
                            title: "Ngày hết hạn:", value: "20-8-2025"),
                        SizedBox(height: 7.h),
                        const CustomInfoRow(
                            title: "Nhóm dịch vụ:", value: "Nhóm môi trường"),
                        SizedBox(height: 7.h),
                        const CustomInfoRow(
                            title: "Loại dịch vụ:",
                            value: "Vận chuyển, xử lý chất thải"),
                        SizedBox(height: 7.h),
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
}
