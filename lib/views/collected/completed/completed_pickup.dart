import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:merchant/common/app_format.dart';
import 'package:merchant/common/custom_info_row.dart';
import 'package:merchant/common/custom_status_badge.dart';
import 'package:merchant/models/point.dart';

import '../../../common/app_style.dart';
import '../../../common/bordered_container.dart';
import '../../../controllers/date_filter_controller.dart';

class CompletedPickupScreen extends StatelessWidget {
  final List<point> points;
  const CompletedPickupScreen({super.key, required this.points});

  @override
  Widget build(BuildContext context) {
    final dateFilterController = Get.find<DateFilterController>();

    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.1),
      body: Obx(() {
        final fromDate = dateFilterController.fromDate.value;
        final toDate = dateFilterController.toDate.value;
        DateTime onlyDate(DateTime dt) => DateTime(dt.year, dt.month, dt.day);

        final completedPoints = points.where((p) {
          if (p.collectionDate == null) return false;
          final pointDate = onlyDate(p.collectionDate!);
          return p.status == 'Đã sắp' &&
              (fromDate == null || !pointDate.isBefore(onlyDate(fromDate))) &&
              (toDate == null || !pointDate.isAfter(onlyDate(toDate)));
        }).toList()
          ..sort((a, b) => b.collectionDate!.compareTo(a.collectionDate!));
        if (completedPoints.isEmpty) {
          return Center(
              child: Text(
            "Không có lịch gom",
            style: AppTextStyles.bodyMedium(),
          ));
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
                      Get.toNamed('/completedCollected');
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
                            title: "Tên công ty: ",
                            value: "${point.companyName}",
                          ),
                          SizedBox(height: 7.h),
                          CustomInfoRow(
                            title: "Địa chỉ gom: ",
                            value: "${point.locationDetails}",
                          ),
                          SizedBox(height: 7.h),
                          CustomInfoRow(
                            title: "Ngày gom: ",
                            value:
                                FormatHelper.formatDate(point.collectionDate!),
                          ),
                          SizedBox(height: 7.h),
                          CustomInfoRow(
                            title: "Tài xế: ",
                            value: point.driver?.name ?? "Chưa có",
                          ),
                          SizedBox(height: 7.h),
                          CustomInfoRow(
                            title: "Biển số xe: ",
                            value: point.vehicle?.plateNumber ?? "Chưa có",
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
