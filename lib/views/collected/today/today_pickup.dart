import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:merchant/controllers/point_controller.dart';

import '../../../common/app_format.dart';
import '../../../common/app_style.dart';
import '../../../common/bordered_container.dart';
import '../../../common/custom_info_row.dart';
import '../../../common/custom_status_badge.dart';

class TodayPickupScreen extends StatelessWidget {
  const TodayPickupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pointController = Get.find<PointController>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      pointController.getTodaySchedule();
    });

    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.1),
      body: Obx(() {
        if (pointController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (pointController.points.isEmpty) {
          return Center(
            child: Text(
              "Không có lịch gom",
              style: AppTextStyles.bodyMedium(),
            ),
          );
        }

        return CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: pointController.points.length,
                (context, index) {
                  final point = pointController.points[index];
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed('/completedCollected', arguments: point.id);
                    },
                    child: BorderedContainer(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  "Mã thu gom: ${point.code}",
                                  style: AppTextStyles.titleXSmall(),
                                ),
                              ),
                              CustomStatusBadge(
                                status: "${point.status}",
                                color: Colors.green,
                              ),
                            ],
                          ),
                          SizedBox(height: 3.h),
                          const Divider(),
                          CustomInfoRow(
                            title: "Tên công ty:",
                            value: "${point.companyName}",
                          ),
                          SizedBox(height: 7.h),
                          CustomInfoRow(
                            title: "Địa chỉ gom:",
                            value: "${point.locationDetails}",
                          ),
                          SizedBox(height: 7.h),
                          CustomInfoRow(
                            title: "Ngày gom:",
                            value:
                                FormatHelper.formatDate(point.collectionDate!),
                          ),
                          SizedBox(height: 7.h),
                          CustomInfoRow(
                            title: "Tài xế:",
                            value: point.driver?.name ?? "Chưa có",
                          ),
                          SizedBox(height: 7.h),
                          CustomInfoRow(
                            title: "Biển số xe:",
                            value: point.truck?.plateNumber ?? "Chưa có",
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
