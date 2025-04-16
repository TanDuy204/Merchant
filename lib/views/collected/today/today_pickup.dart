import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../common/app_style.dart';
import '../../../controllers/collected_controller.dart';
import '../../../models/schedule_model.dart';
import '../completed/completed_pickup_detail.dart';

class TodayPickupScreen extends StatelessWidget {
  final List<Schedule> schedules;
  const TodayPickupScreen({super.key, required this.schedules});

  @override
  Widget build(BuildContext context) {
    final collectedController = Get.find<CollectedController>();

    collectedController.filterByDate(DateTime.now());

    return CustomScrollView(
      slivers: [
        Obx(() => SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: collectedController.filteredSchedulesByDay.length,
                (context, index) {
                  final task =
                      collectedController.filteredSchedulesByDay[index];
                  String formattedDate =
                      DateFormat('dd-MM-yyyy').format(task.datetime);

                  return GestureDetector(
                    onTap: () {
                      Get.to(() => const CompletedPickupDetail());
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
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
                              Text("Chuyến thu gom",
                                  style: AppTextStyles.titleSmall(context)),
                              const Spacer(),
                              Text("CTG_22223",
                                  style: AppTextStyles.titleSmall(context)),
                            ],
                          ),
                          const Divider(),
                          _list(
                              context, "Tuyến:", "${task.to} => ${task.from}"),
                          const SizedBox(height: 6),
                          _list(context, "Loại hàng:", task.cargoType),
                          const SizedBox(height: 6),
                          _list(context, "Ngày gom hàng:", formattedDate),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              Text("Trạng thái:",
                                  style: AppTextStyles.bodyMedium(context)),
                              const Spacer(),
                              statusBadge(task.status, context),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )),
      ],
    );
  }
}

Widget _list(BuildContext context, String title, String value) {
  return Row(
    children: [
      Text(title, style: AppTextStyles.bodyMedium(context)),
      const Spacer(),
      Text(value, style: AppTextStyles.bodyMedium(context)),
    ],
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
      style: AppTextStyles.titleSmall(context)
          .copyWith(fontSize: 14)
          .copyWith(color: AppColors.whiteColor),
    ),
  );
}
