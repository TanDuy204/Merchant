import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merchant/common/bordered_container.dart';
import 'package:merchant/common/custom_status_badge.dart';

import '../../../common/app_dimensions.dart';
import '../../../common/app_style.dart';
import '../../../common/custom_info_row.dart';

class ReturnList extends StatelessWidget {
  const ReturnList({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.toNamed('/returnList');
                },
                child: BorderedContainer(
                  margin: EdgeInsets.all(AppDimensions.paddingSmall(context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Mã bảng kê: MBK-293",
                              style: AppTextStyles.titleXSmall(context)),
                          const Spacer(),
                          const CustomStatusBadge(
                              status: "Đã trả lại", color: AppColors.redColor)
                        ],
                      ),
                      const Divider(),
                      const CustomInfoRow(
                          title: "Ngày gửi:", value: "25-06-2025"),
                      SizedBox(height: AppDimensions.paddingTiny(context)),
                      const CustomInfoRow(
                          title: "Nội dung:", value: "Vận chuyển"),
                      SizedBox(height: AppDimensions.paddingTiny(context)),
                      const CustomInfoRow(
                          title: "Loại hàng:", value: "Chất thải sinh hoạt"),
                      SizedBox(height: AppDimensions.paddingTiny(context)),
                      const CustomInfoRow(
                          title: "Ghi chú:", value: "Bổ sung chi phí"),
                      SizedBox(height: AppDimensions.paddingTiny(context)),
                      const CustomInfoRow(
                          title: "Tổng số chuyến:", value: "7", isBold: true),
                      SizedBox(height: AppDimensions.paddingTiny(context)),
                      const CustomInfoRow(
                          title: "Tổng số tiền:",
                          value: "6.000.000đ",
                          isBold: true),
                    ],
                  ),
                ),
              );
            },
            childCount: 2,
          ),
        ),
      ],
    );
  }
}
