import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:merchant/models/point.dart';

import '../../../common/app_format.dart';
import '../../../common/app_style.dart';
import '../../../common/bordered_container.dart';
import '../../../common/custom_info_row.dart';
import '../../../common/custom_status_badge.dart';

class TodayPickupScreen extends StatelessWidget {
  final List<point> points;
  const TodayPickupScreen({super.key, required this.points});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    final todayPoints = points
        .where((p) =>
            p.status == 'Đã sắp' &&
            p.collectionDate != null &&
            DateTime(p.collectionDate!.year, p.collectionDate!.month,
                    p.collectionDate!.day) ==
                today)
        .toList()
      ..sort((a, b) => b.collectionDate!.compareTo(a.collectionDate!));

    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.1),
      body: CustomScrollView(
        slivers: [
          todayPoints.isEmpty
              ? SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 40.h),
                    child: Center(
                      child: Text(
                        "Hôm nay không có lịch gom",
                        style: AppTextStyles.titleSmall()
                            .copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                )
              : SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: todayPoints.length,
                    (context, index) {
                      final point = todayPoints[index];
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed('/completedCollected');
                        },
                        child: BorderedContainer(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                value: FormatHelper.formatDate(
                                    point.collectionDate!),
                              ),
                              SizedBox(height: 7.h),
                              CustomInfoRow(
                                title: "Tài xế:",
                                value: point.driver?.name ?? "Chưa có",
                              ),
                              SizedBox(height: 7.h),
                              CustomInfoRow(
                                title: "Biển số xe:",
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
      ),
    );
  }
}
