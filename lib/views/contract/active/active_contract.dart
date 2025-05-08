import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merchant/common/app_dimensions.dart';
import 'package:merchant/common/bordered_container.dart';
import 'package:merchant/common/custom_status_badge.dart';

import '../../../common/app_style.dart';

class ActiveContract extends StatelessWidget {
  const ActiveContract({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 4,
            (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.toNamed('/activeContract');
                },
                child: BorderedContainer(
                  margin: EdgeInsets.all(AppDimensions.paddingSmall(context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Số hợp đồng: HDNCC.2024_7",
                              style: AppTextStyles.titleXSmall(context)),
                          const Spacer(),
                          const CustomStatusBadge(
                              status: "Đang thực hiện", color: Colors.green)
                        ],
                      ),
                      const Divider(),
                      _list(context, "Nhà cung cấp:",
                          "Doanh nghiệp tư nhân Minh Hoàng"),
                      SizedBox(height: AppDimensions.paddingTiny(context)),
                      _list(context, "Ngày hiệu lực:", "20-2-2025"),
                      SizedBox(height: AppDimensions.paddingTiny(context)),
                      _list(context, "Ngày hết hạn:", "20-8-2025"),
                      SizedBox(height: AppDimensions.paddingTiny(context)),
                      _list(context, "Nhóm dịch vụ:", "Nhóm môi trường"),
                      SizedBox(height: AppDimensions.paddingTiny(context)),
                      _list(context, "Loại dịch vụ:",
                          "Vận chuyển, xử lý chất thải"),
                      SizedBox(height: AppDimensions.paddingTiny(context)),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

Widget _list(BuildContext context, String title, String value) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        flex: 1,
        child: Text(
          title,
          style: AppTextStyles.bodyMedium(context),
        ),
      ),
      Expanded(
        flex: 2,
        child: Text(
          value,
          style: AppTextStyles.bodyMedium(context),
        ),
      ),
    ],
  );
}
