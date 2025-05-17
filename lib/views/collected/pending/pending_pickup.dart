import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:merchant/common/app_style.dart';
import 'package:merchant/common/bordered_container.dart';
import 'package:merchant/models/point.dart';

import '../../../common/app_format.dart';
import '../../../controllers/date_filter_controller.dart';

class PendingPickupScreen extends StatefulWidget {
  final List<point> points;

  const PendingPickupScreen({super.key, required this.points});

  @override
  State<PendingPickupScreen> createState() => _PendingPickupScreenState();
}

class _PendingPickupScreenState extends State<PendingPickupScreen> {
  int? openIndex;

  @override
  Widget build(BuildContext context) {
    final dateFilterController = Get.find<DateFilterController>();

    return Scaffold(
        backgroundColor: Colors.grey.withOpacity(0.1),
        body: Obx(
          () {
            final fromDate = dateFilterController.fromDate.value;
            final toDate = dateFilterController.toDate.value;
            DateTime onlyDate(DateTime dt) =>
                DateTime(dt.year, dt.month, dt.day);

            final pendingPoints = widget.points.where((p) {
              if (p.collectionDate == null) return false;
              final pointDate = onlyDate(p.collectionDate!);
              return p.status == 'Chưa sắp' &&
                  (fromDate == null ||
                      !pointDate.isBefore(onlyDate(fromDate))) &&
                  (toDate == null || !pointDate.isAfter(onlyDate(toDate)));
            }).toList()
              ..sort((a, b) => b.collectionDate!.compareTo(a.collectionDate!));
            if (pendingPoints.isEmpty) {
              return Center(
                  child: Text(
                "Không có lịch gom",
                style: AppTextStyles.bodyMedium(),
              ));
            }
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                    child: BorderedContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Danh sách chuyến thu gom chưa sắp:',
                        style: AppTextStyles.titleMedium(),
                      ),
                      const Divider(),
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: pendingPoints.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final point = pendingPoints[index];
                          final isOpen = openIndex == index;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                if (isOpen) {
                                  openIndex = null;
                                } else {
                                  openIndex = index;
                                }
                              });
                            },
                            child: Card(
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
                                      vertical: 15.h,
                                      horizontal: 10.w,
                                    ),
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
                                                    size: 22.sp,
                                                    color: AppColors.blueColor),
                                                const SizedBox(width: 5),
                                                Text(
                                                  FormatHelper.formatDate(
                                                      point.collectionDate!),
                                                  style: AppTextStyles
                                                      .titleXSmall(),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              'Chất thải công nghiệp',
                                              style: AppTextStyles.titleSmall(),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "${point.weight} Kg",
                                              style: AppTextStyles.titleSmall(),
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.person,
                                                    size: 22.sp,
                                                    color: AppColors.blueColor),
                                                const SizedBox(width: 5),
                                                Text(
                                                  "3 Nhân công",
                                                  style: AppTextStyles
                                                      .titleSmall(),
                                                ),
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
                                        ? Padding(
                                            padding: EdgeInsets.all(10.h),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                _detailRowH(
                                                    context,
                                                    "Tên công ty: ",
                                                    point.companyName ??
                                                        "Chưa có"),
                                                _detailRowH(
                                                    context,
                                                    "Địa điểm: ",
                                                    point.locationDetails ??
                                                        "Chưa có"),
                                                _detailRowH(
                                                    context,
                                                    "Khối lượng: ",
                                                    point.weight.toString()),
                                                const Divider(),
                                              ],
                                            ),
                                          )
                                        : const SizedBox.shrink(),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                )),
              ],
            );
          },
        ));
  }
}

Widget _detailRowH(BuildContext context, String title, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            title,
            style: AppTextStyles.bodySmall(),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            value,
            style: AppTextStyles.titleSmall(),
            softWrap: true,
            overflow: TextOverflow.visible,
          ),
        ),
      ],
    ),
  );
}
