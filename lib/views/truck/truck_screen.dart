import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merchant/common/app_dimensions.dart';
import 'package:merchant/common/app_style.dart';
import 'package:merchant/controllers/truck_controller.dart';

import '../../models/truck_model.dart';

class TruckScreen extends StatelessWidget {
  final List<TruckModel> trucks;
  const TruckScreen({super.key, required this.trucks});

  @override
  Widget build(BuildContext context) {
    final TruckController truckController = Get.put(TruckController());

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildStatisticCard(
                  context: context,
                  icon: Icons.local_shipping,
                  label: "Tổng xe",
                  color: Colors.blue,
                ),
                buildStatisticCard(
                  context: context,
                  icon: Icons.check_circle,
                  label: "Đã sắp",
                  color: Colors.green,
                ),
                buildStatisticCard(
                  context: context,
                  icon: Icons.access_time,
                  label: "Chưa sắp",
                  color: Colors.orange,
                ),
              ],
            ),
            const SizedBox(height: 24),

            /// Danh sách xe
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: trucks.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.9,
              ),
              itemBuilder: (context, index) {
                final truck = trucks[index];
                return GestureDetector(
                  onTap: () {
                    Get.toNamed('/truckDetail', arguments: truck);
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
                                shape: BoxShape.circle,
                                color: truckController
                                    .getStatusColor(truck.status),
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
            )
          ],
        ),
      ),
    );
  }

  Widget buildStatisticCard({
    required BuildContext context,
    required IconData icon,
    required String label,
    required Color color,
  }) {
    final truckController = Get.find<TruckController>();

    return Expanded(
      child: Obx(
        () => GestureDetector(
          onTap: () => truckController.setFilter(label),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            margin: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              color: truckController.getCardColor(label, color),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.2),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
              border: Border.all(
                color: truckController.isSelected(label)
                    ? color.withOpacity(0.7)
                    : Colors.transparent,
                width: 0.5,
              ),
            ),
            child: Column(
              children: [
                Icon(icon,
                    color: color, size: AppDimensions.iconLarge(context)),
                const SizedBox(height: 8),
                Text(
                  label,
                  style: AppTextStyles.bodySmall(context),
                ),
                const SizedBox(height: 4),
                Text(
                  '2',
                  style: AppTextStyles.titleMedium(context)
                      .copyWith(color: color, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
