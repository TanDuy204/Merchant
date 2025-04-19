import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merchant/models/schedule_model.dart';
import 'package:merchant/routes/app_route.dart';

import '../../../common/app_style.dart';

class PendingList extends StatelessWidget {
  final List<Schedule> schedules;
  const PendingList({super.key, required this.schedules});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: schedules.length,
            (context, index) {
              final schedule = schedules[index];
              return GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.pendingList);
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
                          Image.asset(
                            "assets/icons/car_icon.png",
                            width: 30,
                            height: 30,
                          ),
                          const SizedBox(width: 8),
                          Text("Thu gom",
                              style: AppTextStyles.titleSmall(context)),
                          const Spacer(),
                          Text("CTG_22223",
                              style: AppTextStyles.titleSmall(context)),
                        ],
                      ),
                      const Divider(),
                      const SizedBox(height: 6),
                      _list(context, "Tên công ty:", schedule.companyName),
                      _list(context, "Khu vực:", schedule.to),
                      _list(context, "Loại hàng:", schedule.cargoType),
                      _list(context, "Biển số xe:", "51-C 033755"),
                      Row(
                        children: [
                          Text("Trạng thái:",
                              style: AppTextStyles.bodyMedium(context)),
                          const Spacer(),
                          statusBadge("Đã thu gom", context),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

Widget _list(BuildContext context, String title, String value) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 4.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: Text(
            title,
            style: AppTextStyles.bodyMedium(context),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: AppTextStyles.bodyMedium(context),
            softWrap: true,
            maxLines: null,
          ),
        ),
      ],
    ),
  );
}

Widget statusBadge(String status, BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(
      color: AppColors.lightBlueColor,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(status, style: AppTextStyles.buttonLabel(context)),
  );
}
