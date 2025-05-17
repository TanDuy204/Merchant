import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:merchant/common/bordered_container.dart';
import 'package:merchant/common/custom_info_row.dart';
import 'package:merchant/common/custom_status_badge.dart';

import '../../../common/app_style.dart';

class SentList extends StatelessWidget {
  const SentList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.toNamed('/sentList');
                  },
                  child: BorderedContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text("Mã bảng kê: MBK-293",
                                  style: AppTextStyles.titleXSmall()),
                            ),
                            const CustomStatusBadge(
                                status: "Đã gửi",
                                color: AppColors.lightBlueColor),
                          ],
                        ),
                        SizedBox(height: 3.h),
                        const Divider(),
                        const CustomInfoRow(
                            title: "Ngày gửi:", value: "25-06-2025"),
                        SizedBox(height: 7.h),
                        const CustomInfoRow(
                            title: "Nội dung:", value: "Vận chuyển"),
                        SizedBox(height: 7.h),
                        const CustomInfoRow(
                            title: "Ghi chú:", value: "Bổ sung chi phí"),
                        SizedBox(height: 7.h),
                        const CustomInfoRow(
                          title: "Tổng số chuyến:",
                          value: "1",
                          isBold: true,
                        ),
                        SizedBox(height: 7.h),
                        const CustomInfoRow(
                          title: "Tổng tiền:",
                          value: "6.000.000đ",
                          isBold: true,
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: 2,
            ),
          ),
        ],
      ),
    );
  }
}
