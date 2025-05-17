import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:merchant/common/app_style.dart';
import 'package:merchant/common/bordered_container.dart';
import 'package:merchant/common/custom_status_badge.dart';
import 'package:merchant/controllers/truck_controller.dart';
import 'package:merchant/models/truck.dart';
import 'package:merchant/views/truck/truck_detail.dart';

class TruckScreen extends StatelessWidget {
  final List<truck> trucks;

  const TruckScreen({super.key, required this.trucks});

  @override
  Widget build(BuildContext context) {
    final TruckController truckController = Get.put(TruckController());
    truckController.allTrucks = trucks;
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          centerTitle: true,
          title: Text("Danh sách xe", style: AppTextStyles.titleMedium()),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(180.h),
            child: Column(
              children: [
                Obx(() => BorderedContainer(
                      child: Row(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                width: 70.h,
                                height: 70.h,
                                child: CircularProgressIndicator(
                                  value: truckController.progressValue,
                                  strokeWidth: 8,
                                  backgroundColor: Colors.grey[200],
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    truckController.filter.value == 'Đã sắp'
                                        ? const Color(0xFF4CAF50)
                                        : truckController.filter.value ==
                                                'Chưa sắp'
                                            ? const Color(0xFFFFA726)
                                            : AppColors.lightBlueColor,
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    truckController.displayCount.toString(),
                                    style: AppTextStyles.titleMedium(),
                                  ),
                                  Text(
                                    truckController.countLabel,
                                    style: AppTextStyles.bodyXSmall().copyWith(
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(width: 40.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Tình trạng đội xe',
                                  style: AppTextStyles.titleXSmall(),
                                ),
                                SizedBox(height: 10.h),
                                _buildStatusItem(
                                  color: const Color(0xFF4CAF50),
                                  label: 'Đã sắp lịch',
                                  count: truckController.assignedCount,
                                ),
                                SizedBox(height: 10.h),
                                _buildStatusItem(
                                  color: const Color(0xFFFFA726),
                                  label: 'Chưa sắp lịch',
                                  count: truckController.unassignedCount,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
                SizedBox(height: 10.h),
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildFilterTab(truckController, 'Tổng xe'),
                      SizedBox(width: 12.w),
                      _buildFilterTab(truckController, 'Đã sắp'),
                      SizedBox(width: 12.w),
                      _buildFilterTab(truckController, 'Chưa sắp'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                )
              ],
            ),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            ///Danh sách xe
            Obx(
              () {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final truck = truckController.filteredTrucks[index];

                      return BorderedContainer(
                        child: Row(
                          children: [
                            Container(
                              width: 6.w,
                              height: 130.h,
                              decoration: BoxDecoration(
                                color: truckController
                                    .getStatusColor(truck.status!),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.r),
                                  bottomLeft: Radius.circular(10.r),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5.w),
                              decoration: BoxDecoration(
                                color: truckController
                                    .getBackgroundTintColor(truck.status!),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Image.asset(
                                "assets/images/slipping.png",
                                height: 130.h,
                                width: 120.w,
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${truck.name}",
                                          style: AppTextStyles.titleMedium(),
                                        ),
                                        SizedBox(height: 10.h),
                                        Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 12.w,
                                                vertical: 5.h,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade300,
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                              ),
                                              child: Text(
                                                  '${truck.capacity} tấn',
                                                  style:
                                                      AppTextStyles.bodySmall()
                                                          .copyWith(
                                                    color: Colors.black,
                                                  )),
                                            ),
                                            SizedBox(width: 8.w),
                                            CustomStatusBadge(
                                                status: "${truck.status}",
                                                color: truckController
                                                    .getStatusColor(
                                                        truck.status!)),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10.h),
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(() => const TruckDetail());
                                      },
                                      child: const Align(
                                        alignment: Alignment.bottomRight,
                                        child: CustomStatusBadge(
                                            status: "Chi tiết",
                                            color: AppColors.lightBlueColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 5.w),
                          ],
                        ),
                      );
                    },
                    childCount: truckController.filteredTrucks.length,
                  ),
                );
              },
            )
          ],
        ));
  }

  Widget _buildStatusItem({
    required Color color,
    required String label,
    required int count,
  }) {
    return Row(
      children: [
        Container(
          width: 16.w,
          height: 16.h,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 8.h),
        Text(label, style: AppTextStyles.bodyMedium()),
        Expanded(
          child: Text(
            count.toString(),
            style: AppTextStyles.titleXSmall(),
            textAlign: TextAlign.right,
          ),
        ),
        SizedBox(
          width: 50.w,
        )
      ],
    );
  }

  Widget _buildFilterTab(TruckController controller, String filterName) {
    final isSelected = controller.filter.value == filterName;

    return GestureDetector(
      onTap: () => controller.setFilter(filterName),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF1976D2) : Colors.white,
          borderRadius: BorderRadius.circular(25.r),
          border: isSelected
              ? null
              : Border.all(
                  color: const Color(0xFFE0E0E0),
                  width: 1,
                ),
        ),
        child: Text(
          filterName,
          style: AppTextStyles.bodySmall().copyWith(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
