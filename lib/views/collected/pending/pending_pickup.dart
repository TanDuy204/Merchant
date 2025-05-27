import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:merchant/common/app_style.dart';
import 'package:merchant/common/bordered_container.dart';

import '../../../controllers/date_filter_controller.dart';
import '../../../controllers/point_controller.dart';

class PendingPickupScreen extends StatefulWidget {
  const PendingPickupScreen({super.key});

  @override
  State<PendingPickupScreen> createState() => _PendingPickupScreenState();
}

class _PendingPickupScreenState extends State<PendingPickupScreen> {
  final dateFilterController = Get.find<DateFilterController>();
  final pointController = Get.find<PointController>();
  int? openIndex;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      pointController.getNotyetSchedule();
    });
  }

  String getGroupKey(dynamic point) {
    if (point.collectionDate == null) return 'unknown_date|unknown_type';
    final date = DateFormat('dd/MM/yyyy').format(point.collectionDate);
    final wasteType = point.wasteType ?? 'unknown_type';
    return '$date|$wasteType';
  }

  double extractWeight(String? weightStr) {
    if (weightStr == null || weightStr.isEmpty) return 0;
    final match = RegExp(r'[\d.]+').firstMatch(weightStr);
    return double.tryParse(match?.group(0) ?? '0') ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.1),
      body: Obx(() {
        if (pointController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final allPoints = pointController.points;
        if (allPoints.isEmpty) {
          return Center(
            child: Text("Không có lịch gom", style: AppTextStyles.bodyMedium()),
          );
        }

        final Map<String, List<dynamic>> groupedSchedules = {};
        for (var point in allPoints) {
          final key = getGroupKey(point);
          groupedSchedules.putIfAbsent(key, () => []).add(point);
        }

        final sortedGroups = groupedSchedules.entries.toList()
          ..sort((a, b) {
            final dateA = a.key.split('|')[0];
            final dateB = b.key.split('|')[0];
            return dateB.compareTo(dateA);
          });

        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: BorderedContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Danh sách chuyến thu gom chưa sắp:',
                        style: AppTextStyles.titleMedium()),
                    const Divider(),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: sortedGroups.length,
                      itemBuilder: (context, index) {
                        final group = sortedGroups[index];
                        final points = group.value;
                        final isOpen = openIndex == index;

                        final keyParts = group.key.split('|');
                        final displayDate = keyParts[0];
                        final wasteType = keyParts[1];

                        final totalWeight = points
                            .map((p) => extractWeight(p.weight))
                            .fold(0.0, (sum, w) => sum + w);

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              openIndex = isOpen ? null : index;
                            });
                          },

                          /// Thẻ danh sách lịch gom
                          child: Card(
                            margin: EdgeInsets.only(bottom: 8.h),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: isOpen
                                        ? AppColors.lightBlue
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15.h, horizontal: 15.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.date_range,
                                                  size: 19.sp,
                                                  color: AppColors.blueColor),
                                              SizedBox(width: 8.w),
                                              Text(displayDate,
                                                  style: AppTextStyles
                                                      .titleSmall()),
                                            ],
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 12.w,
                                                vertical: 4.h),
                                            decoration: BoxDecoration(
                                              color: AppColors.blueColor
                                                  .withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(12.r),
                                            ),
                                            child: Text(
                                              wasteType,
                                              style: AppTextStyles.bodySmall()
                                                  .copyWith(
                                                color: AppColors.blueColor,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.scale,
                                                  size: 19.sp,
                                                  color: AppColors.blueColor),
                                              SizedBox(width: 6.w),
                                              Text(
                                                  '${totalWeight.toStringAsFixed(1)} KG',
                                                  style: AppTextStyles
                                                      .titleSmall()),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(Icons.business,
                                                  size: 19.sp,
                                                  color: AppColors.blueColor),
                                              SizedBox(width: 6.w),
                                              Text('${points.length} nhân công',
                                                  style: AppTextStyles
                                                      .titleSmall()),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                ///Chi tiết các điểm gom
                                AnimatedSize(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                  child: isOpen
                                      ? Container(
                                          width: double.infinity,
                                          padding: EdgeInsets.all(15.w),
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade50,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10.r),
                                              bottomRight:
                                                  Radius.circular(10.r),
                                            ),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Chi tiết điểm gom:",
                                                  style: AppTextStyles
                                                      .titleXSmall()),
                                              SizedBox(height: 12.h),
                                              ...points
                                                  .asMap()
                                                  .entries
                                                  .map((entry) {
                                                final idx = entry.key;
                                                final point = entry.value;
                                                return Container(
                                                  margin: EdgeInsets.only(
                                                      bottom: 12.h),
                                                  padding: EdgeInsets.all(12.w),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.r),
                                                    border: Border.all(
                                                        color: Colors
                                                            .grey.shade200,
                                                        width: 1),
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Container(
                                                            width: 24.w,
                                                            height: 24.w,
                                                            decoration:
                                                                const BoxDecoration(
                                                              color: AppColors
                                                                  .blueColor,
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                '${idx + 1}',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      12.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(width: 8.w),
                                                          Expanded(
                                                            child: Text(
                                                              point.companyName ??
                                                                  "Chưa có tên",
                                                              style: AppTextStyles
                                                                  .titleSmall(),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 8.h),
                                                      _detailRowH(
                                                          context,
                                                          "Địa điểm:",
                                                          point.locationDetails ??
                                                              "Chưa có"),
                                                      _detailRowH(
                                                          context,
                                                          "Khối lượng:",
                                                          point.weight ??
                                                              "0 KG"),
                                                    ],
                                                  ),
                                                );
                                              }).toList(),
                                            ],
                                          ),
                                        )
                                      : const SizedBox.shrink(),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

Widget _detailRowH(BuildContext context, String title, String value) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 2.h),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 80.w,
          child: Text(
            title,
            style:
                AppTextStyles.bodySmall().copyWith(color: Colors.grey.shade600),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: AppTextStyles.bodySmall(),
            softWrap: true,
          ),
        ),
      ],
    ),
  );
}
