import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merchant/common/app_dimensions.dart';

import '../../../common/app_style.dart';
import '../../../models/schedule_model.dart';

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
                  Get.toNamed('/pendingList');
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/icons/car_icon.png",
                            width: 30,
                            height: 30,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Chuyến thu gom",
                                    style: AppTextStyles.titleSmall(context)),
                                const SizedBox(height: 4),
                                Text("CTG_22223",
                                    style: AppTextStyles.bodySmall(context)),
                              ],
                            ),
                          ),
                          statusBadge("Đã thu gom", context),
                        ],
                      ),
                      const Divider(),
                      const SizedBox(height: 12),
                      _list(context, "Tên công ty:", schedule.companyName),
                      _list(context, "Khu vực:", schedule.to),
                      _list(context, "Loại hàng:", schedule.cargoType),
                      _list(context, "Biển số xe:", "51-C 033755"),
                      const SizedBox(height: 6),
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
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: AppDimensions.heightMedium(context),
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
  final isCollected = status == "Đã thu gom";
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(
      color: isCollected ? Colors.green : Colors.red,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      status,
      style: AppTextStyles.bodyMedium(context)
          .copyWith(color: AppColors.whiteColor),
    ),
  );
}
