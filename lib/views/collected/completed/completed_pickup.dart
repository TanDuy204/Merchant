import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:merchant/common/app_format.dart';
import 'package:merchant/common/custom_info_row.dart';
import 'package:merchant/common/custom_status_badge.dart';

import '../../../common/app_style.dart';
import '../../../common/bordered_container.dart';
import '../../../controllers/date_filter_controller.dart';
import '../../../controllers/point_controller.dart';

class CompletedPickupScreen extends StatefulWidget {
  const CompletedPickupScreen({super.key});

  @override
  State<CompletedPickupScreen> createState() => _CompletedPickupScreenState();
}

class _CompletedPickupScreenState extends State<CompletedPickupScreen> {
  final dateFilterController = Get.find<DateFilterController>();
  final pointController = Get.find<PointController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      pointController.getArrangedSchedule();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.1),
      body: Obx(() {
        if (pointController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final fromDate = dateFilterController.fromDate.value;
        final toDate = dateFilterController.toDate.value;
        DateTime onlyDate(DateTime dt) => DateTime(dt.year, dt.month, dt.day);

        final completedPoints = pointController.points.where((p) {
          if (p.collectionDate == null) return false;
          final pointDate = onlyDate(p.collectionDate!);
          return (fromDate == null ||
                  !pointDate.isBefore(onlyDate(fromDate))) &&
              (toDate == null || !pointDate.isAfter(onlyDate(toDate)));
        }).toList()
          ..sort((a, b) => b.collectionDate!.compareTo(a.collectionDate!));

        if (completedPoints.isEmpty) {
          return Center(
            child: Text(
              "Không có lịch gom",
              style: AppTextStyles.bodyMedium().copyWith(
                color: Colors.grey.shade600,
              ),
            ),
          );
        }

        return CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: completedPoints.length,
                (context, index) {
                  final point = completedPoints[index];
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
                                  "Mã thu gom: ${point.code ?? 'N/A'}",
                                  style: AppTextStyles.titleXSmall(),
                                ),
                              ),
                              CustomStatusBadge(
                                status: point.status ?? 'N/A',
                                color: Colors.green,
                              ),
                            ],
                          ),
                          SizedBox(height: 3.h),
                          const Divider(),
                          CustomInfoRow(
                            title: "Tên công ty: ",
                            value: point.companyName ?? 'N/A',
                          ),
                          SizedBox(height: 7.h),
                          CustomInfoRow(
                            title: "Địa chỉ gom: ",
                            value: point.locationDetails ?? 'N/A',
                          ),
                          SizedBox(height: 7.h),
                          CustomInfoRow(
                            title: "Ngày gom: ",
                            value: point.collectionDate != null
                                ? FormatHelper.formatDate(point.collectionDate!)
                                : 'N/A',
                          ),
                          SizedBox(height: 7.h),
                          CustomInfoRow(
                            title: "Tài xế: ",
                            value: point.driver?.name ?? "Chưa có",
                          ),
                          SizedBox(height: 7.h),
                          CustomInfoRow(
                            title: "Biển số xe: ",
                            value: point.truck?.plateNumber ?? "Chưa có",
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 10.h),
            )
          ],
        );
      }),
    );
  }
}
