import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merchant/common/app_dimensions.dart';
import 'package:merchant/common/bordered_container.dart';
import 'package:merchant/common/custom_info_row.dart';
import 'package:merchant/common/custom_status_badge.dart';

import '../../../common/app_style.dart';

class SentList extends StatelessWidget {
  const SentList({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.toNamed('/sentList');
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
                              status: "Đã gửi",
                              color: AppColors.lightBlueColor),
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
                          title: "Ghi chú:", value: "Bổ sung chi phí"),
                      SizedBox(height: AppDimensions.paddingTiny(context)),
                      const CustomInfoRow(
                        title: "Tổng số chuyến:",
                        value: "1",
                        isBold: true,
                      ),
                      SizedBox(height: AppDimensions.paddingTiny(context)),
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
    );
  }
}
