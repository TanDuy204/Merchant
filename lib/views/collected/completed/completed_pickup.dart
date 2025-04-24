import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merchant/common/app_dimensions.dart';
import 'package:merchant/controllers/collected_controller.dart';
import 'package:merchant/models/schedule_model.dart';

import '../../../common/app_style.dart';
import '../../../common/bordered_container.dart';

class CompletedPickupScreen extends StatelessWidget {
  final List<Schedule> schedules;
  const CompletedPickupScreen({super.key, required this.schedules});

  @override
  Widget build(BuildContext context) {
    final collectedController = Get.put(CollectedController());
    collectedController.setSchedules(schedules);
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
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/icons/car_icon.png",
                            width: AppDimensions.iconMedium(context),
                            height: AppDimensions.iconMedium(context),
                            fit: BoxFit.cover,
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
                          statusBadge("Đã sắp", context),
                        ],
                      ),
                      const Divider(),
                      _list(context, "Tên công ty:",
                          "Công ty TNHH Sản xuất Việt Nam"),
                      const SizedBox(height: 6),
                      _list(context, "Địa chỉ gom:",
                          "Khu công nghiệp Quang Minh, Hà Nội"),
                      const SizedBox(height: 6),
                      _list(context, "Loại hàng:", "Chất thải sinh hoạt"),
                      const SizedBox(height: 6),
                      _list(context, "Biển số xe:", "29H1-456213"),
                      const SizedBox(height: 6),
                      _list(context, "Tài xế:", "Nguyễn Văn A"),
                    ],
                  ),
                ));
          }),
        ),
      ],
    ));
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

Widget statusBadge(String status, BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(
      color: Colors.green,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      status,
      style: AppTextStyles.bodyMedium(context)
          .copyWith(color: AppColors.whiteColor),
    ),
  );
}
