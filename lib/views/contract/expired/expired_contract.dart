import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/app_style.dart';
import '../../../routes/app_route.dart';

class ExpiredContract extends StatelessWidget {
  const ExpiredContract({super.key});

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
                  Get.toNamed(AppRoutes.expiredContract);
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Số hợp đồng: HDNCC.2024_7",
                              style: AppTextStyles.titleSmall(context)),
                          const Spacer(),
                          statusBadge("Đã hết hạn", context)
                        ],
                      ),
                      const Divider(),
                      _list(context, "Tên nhà cung cấp:",
                          "Doanh nghiệp tư nhân Minh Hoàng"),
                      const SizedBox(height: 6),
                      _list(context, "Ngày hiệu lực:", "20-2-2025"),
                      const SizedBox(height: 6),
                      _list(context, "Ngày hết hạn:", "20-8-2025"),
                      const SizedBox(height: 6),
                      _list(context, "Nhóm dịch vụ:", "Nhóm môi trường"),
                      const SizedBox(height: 6),
                      _list(context, "Loại dịch vụ:",
                          "Vận chuyển, xử lý chất thải"),
                      const SizedBox(height: 6),
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
        flex: 2,
        child: Text(
          title,
          style: AppTextStyles.bodyMedium(context),
        ),
      ),
      Expanded(
        flex: 3,
        child: Text(
          value,
          style: AppTextStyles.bodyMedium(context),
        ),
      ),
    ],
  );
}

Widget statusBadge(String status, BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(
      color: AppColors.redColor,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(status, style: AppTextStyles.buttonLabel(context)),
  );
}
