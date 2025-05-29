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

  DateTime onlyDate(DateTime dt) => DateTime(dt.year, dt.month, dt.day);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.1),
      body: Obx(() {
        if (pointController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final fromDate = dateFilterController.fromDate.value;
        final toDate = dateFilterController.toDate.value;

        final allPoints = pointController.points.where((p) {
          if (p.collectionDate == null) return false;
          final pointDate = onlyDate(p.collectionDate!);
          return (fromDate == null ||
                  !pointDate.isBefore(onlyDate(fromDate))) &&
              (toDate == null || !pointDate.isAfter(onlyDate(toDate)));
        }).toList();

        if (allPoints.isEmpty) {
          return Center(
            child: Text("Không có lịch gom", style: AppTextStyles.bodyMedium()),
          );
        }

        /// Nhóm các điểm gom theo ngày và loại rác
        final Map<String, List<dynamic>> groupedSchedules = {};
        for (var point in allPoints) {
          final dateStr =
              DateFormat('dd/MM/yyyy').format(point.collectionDate!);
          final wasteType = point.wasteType?.isNotEmpty == true
              ? point.wasteType
              : 'Chưa phân loại';
          final key = '$dateStr|$wasteType';
          groupedSchedules.putIfAbsent(key, () => []).add(point);
        }

        /// Sắp xếp nhóm theo ngày giảm dần
        final sortedGroups = groupedSchedules.entries.toList()
          ..sort((a, b) => b.key.split('|')[0].compareTo(a.key.split('|')[0]));

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
                        final isOpen = openIndex == index;

                        final keyParts = group.key.split('|');
                        final displayDate = keyParts[0];
                        final wasteType = keyParts[1];
                        final points = group.value;

                        double totalWeight = 0;
                        for (var p in points) {
                          final rawWeight = p.weight ?? '';
                          final match = RegExp(r'[\d.]+').firstMatch(rawWeight);
                          final weight =
                              double.tryParse(match?.group(0) ?? '0') ?? 0;
                          totalWeight += weight;
                        }

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              openIndex = isOpen ? null : index;
                            });
                          },
                          child: Card(
                            margin: EdgeInsets.only(bottom: 8.h),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: isOpen
                                        ? Colors.blue.shade100
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
                                                      .titleXSmall()),
                                            ],
                                          ),
                                          Text(
                                            wasteType,
                                            style: AppTextStyles.titleXSmall()
                                                .copyWith(
                                              color: AppColors.blueColor,
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
                                                      .titleXSmall()),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(Icons.person_outline,
                                                  size: 19.sp,
                                                  color: AppColors.blueColor),
                                              SizedBox(width: 6.w),
                                              Text('${points.length} nhân công',
                                                  style: AppTextStyles
                                                      .titleXSmall()),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
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
                                              }),
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style:
              AppTextStyles.bodySmall().copyWith(color: Colors.grey.shade600),
        ),
        Flexible(
          child: Text(
            value,
            style: AppTextStyles.bodySmall(),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    ),
  );
}
