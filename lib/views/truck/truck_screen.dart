import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merchant/common/styles.dart';
import 'package:merchant/controllers/truck_controller.dart';
import 'package:merchant/routes/app_route.dart';

import '../../models/truck_model.dart';

class TruckScreen extends StatelessWidget {
  final List<TruckModel> trucks;
  const TruckScreen({super.key, required this.trucks});

  @override
  Widget build(BuildContext context) {
    final TruckController truckController = Get.put(TruckController());
    truckController.setTrucks(trucks);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        centerTitle: true,
        title: Text("Danh sách xe", style: AppTextStyles.titleMedium(context)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// Thống kê
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  buildTruckStatisticCard(
                    context: context,
                    title: "Tổng xe:",
                    count: truckController.countAll(),
                    color: const Color(0xFF007AFF),
                    onTap: () => truckController.filterByStatus(""),
                  ),
                  buildTruckStatisticCard(
                    context: context,
                    title: "Có chuyến:",
                    count: truckController.countByStatus("có chuyến"),
                    color: const Color(0xFF70CF97),
                    onTap: () => truckController.filterByStatus('có chuyến'),
                  ),
                  buildTruckStatisticCard(
                    context: context,
                    title: "Chờ chuyến:",
                    count: truckController.countByStatus("chờ chuyến"),
                    color: const Color(0xFF62D2FF),
                    onTap: () => truckController.filterByStatus('chờ chuyến'),
                  ),
                  buildTruckStatisticCard(
                    context: context,
                    title: "Bảo trì:",
                    count: truckController.countByStatus("bảo trì"),
                    color: const Color(0xFFFEE690),
                    onTap: () => truckController.filterByStatus('bảo trì'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            /// Danh sách xe
            Obx(() {
              final filtered = truckController.filteredTrucks;
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filtered.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) {
                  final truck = filtered[index];
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.truckDetail, arguments: truck);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 2),
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  truck.name,
                                  style: AppTextStyles.titleSmall(context),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: truckController
                                      .getStatusColor(truck.status),
                                  shape: BoxShape.circle,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text('${truck.loadCapacity} tấn',
                              style: AppTextStyles.bodySmall(context)
                                  .copyWith(color: Colors.grey)),
                          const SizedBox(height: 8),
                          Expanded(
                            child: Image.asset(
                              truck.type == "Container"
                                  ? 'assets/images/truck.png'
                                  : 'assets/images/car.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget buildTruckStatisticCard({
    required BuildContext context,
    required String title,
    required int count,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 3),
                color: Colors.transparent,
              ),
            ),
            const SizedBox(width: 12),
            Row(
              children: [
                Text(
                  title,
                  style: AppTextStyles.bodyMedium(context)
                      .copyWith(color: AppColors.whiteColor),
                ),
                const SizedBox(width: 4),
                Text(
                  '$count',
                  style: AppTextStyles.titleSmall(context)
                      .copyWith(color: AppColors.whiteColor),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
