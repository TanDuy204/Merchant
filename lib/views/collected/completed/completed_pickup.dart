import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:merchant/common/bordered_container.dart';
import 'package:merchant/controllers/collected_controller.dart';
import 'package:merchant/models/schedule_model.dart';
import 'package:merchant/routes/app_route.dart';

import '../../../common/app_style.dart';

class CompletedPickupScreen extends StatelessWidget {
  final List<Schedule> schedules;
  const CompletedPickupScreen({super.key, required this.schedules});

  @override
  Widget build(BuildContext context) {
    final collectedController = Get.put(CollectedController());
    collectedController.setSchedules(schedules);
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 16),
          Obx(() {
            final selected = collectedController.selectedStatus.value;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _statusToggle(
                    context, "Đã thu gom", selected, collectedController),
                _statusToggle(
                    context, "Chưa thu gom", selected, collectedController),
              ],
            );
          }),
          const SizedBox(height: 10),
          Expanded(
            child: Obx(() => ListView.builder(
                  padding: const EdgeInsets.only(bottom: 16),
                  itemCount: collectedController.filteredSchedules.length,
                  itemBuilder: (context, index) {
                    final task = collectedController.filteredSchedules[index];
                    String formattedDate =
                        DateFormat('dd-MM-yyyy').format(task.datetime);

                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.completedCollected);
                      },
                      child: BorderedContainer(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
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
                            _list(context, "Tuyến:",
                                "${task.to} => ${task.from}"),
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
                )),
          ),
        ],
      ),
    );
  }
}

Widget _statusToggle(BuildContext context, String status, String selectedStatus,
    CollectedController collectedController) {
  final isSelected = selectedStatus == status;
  return Expanded(
    child: GestureDetector(
      onTap: () => collectedController.filterByStatus(status),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.lightBlue : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            status,
            style: isSelected
                ? AppTextStyles.titleSmall(context)
                    .copyWith(color: AppColors.whiteColor)
                : AppTextStyles.bodyMedium(context)
                    .copyWith(color: Colors.grey),
          ),
        ),
      ),
    ),
  );
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
