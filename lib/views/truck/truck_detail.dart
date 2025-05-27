import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:merchant/common/app_dimensions.dart';
import 'package:merchant/common/custom_status_badge.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../common/app_style.dart';
import '../../common/bordered_container.dart';
import '../../common/custom_info_row.dart';

class TruckDetail extends StatefulWidget {
  const TruckDetail({super.key});

  @override
  State<TruckDetail> createState() => _TruckDetailState();
}

class _TruckDetailState extends State<TruckDetail> {
  int? openIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          "Chi tiết xe",
          style: AppTextStyles.titleMedium(),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          ///Hình ảnh xe
          SliverToBoxAdapter(
            child: BorderedContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/truck.png',
                    height: AppDimensions.heightMediumLarge(),
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Hino-0123",
                                style: AppTextStyles.bodyMedium()),
                            Text("51H1-24680",
                                style: AppTextStyles.titleXSmall()),
                          ],
                        ),
                      ),
                      const CustomStatusBadge(
                          status: "Đã sắp lịch", color: Colors.green)
                    ],
                  ),
                ],
              ),
            ),
          ),

          ///Thông tin xe
          SliverToBoxAdapter(
            child: BorderedContainer(
              child: Column(
                children: [
                  _infoRow(context, Icons.local_shipping, "Loại xe",
                      "Xe tải lớn", Icons.scale, "Trọng tải", "15 tấn"),
                  SizedBox(height: 12.h),
                  _infoRow(
                      context,
                      Icons.calendar_today,
                      "Ngày đăng kiểm",
                      "14/06/2023",
                      Icons.build,
                      "Bảo dưỡng gần nhất",
                      "28/01/2024"),
                  SizedBox(height: 12.h),
                  _infoRow(context, Icons.alt_route, "Quãng đường đã đi",
                      "245.630 km", Icons.access_time, "Tuổi xe", "3 năm"),
                ],
              ),
            ),
          ),

          ///Thông số xe
          SliverToBoxAdapter(
            child: Row(
              children: [
                Expanded(
                    child: buildPieCard(
                  context: context,
                  title: "Nhiên liệu hiện có",
                  percent: 0.6,
                  color: const Color(0xFFA162F7),
                )),
                Expanded(
                    child: buildPieCard(
                        context: context,
                        title: "Trọng tải hiện thời",
                        percent: 0.25,
                        color: const Color(0xFFF6CC0D))),
              ],
            ),
          ),

          ///Lịch sử vi phạm
          SliverToBoxAdapter(
            child: BorderedContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Lịch sử vi phạm",
                    style: AppTextStyles.titleXSmall(),
                  ),
                  const Divider(),
                  Row(
                    children: [
                      Container(
                        width: AppDimensions.heightTiny(),
                        height: AppDimensions.heightTiny(),
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.error_outline,
                            color: Colors.red,
                            size: 24,
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Thứ 2, ngày 06 tháng 02 năm 2025",
                            style: AppTextStyles.bodyMedium(),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 6.h),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Text("14:07 -21/11/2011",
                                style: AppTextStyles.bodyMedium()),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),

          ///Lịch sử thu gom
          SliverToBoxAdapter(
            child: BorderedContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lịch sử thu gom',
                    style: AppTextStyles.titleXSmall(),
                  ),
                  const Divider(),
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (openIndex == index) {
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
                                  color: openIndex == index
                                      ? AppColors.lightBlue
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: ListTile(
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Mã thu gom: CTG-456450',
                                          style: AppTextStyles.titleSmall()),
                                      Text('25-7-2025',
                                          style: AppTextStyles.titleSmall()),
                                    ],
                                  ),
                                ),
                              ),
                              AnimatedSize(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                                child: openIndex == index
                                    ? Padding(
                                        padding: EdgeInsets.all(10.h),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const CustomInfoRow(
                                                title: "Tên công ty:",
                                                value:
                                                    "TNHH Jones Lang Lasalle (Việt Nam)"),
                                            SizedBox(height: 7.h),
                                            const CustomInfoRow(
                                                title: "Địa điểm:",
                                                value:
                                                    "KCN Quang Minh, Hà Nội"),
                                            SizedBox(height: 7.h),
                                            const CustomInfoRow(
                                                title: "Tài xế",
                                                value: "Taixe1-034567567"),
                                            SizedBox(height: 7.h),
                                            statusBadge(context, "Đã sắp"),
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
      ),
    );
  }

  Widget _infoRow(BuildContext context, IconData icon1, String label1,
      String value1, IconData icon2, String label2, String value2) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Icon(icon1, size: 22.sp, color: AppColors.blueColor),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label1, style: AppTextStyles.titleSmall()),
                  Text(value1, style: AppTextStyles.bodySmall()),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Icon(icon2, size: 22.sp, color: AppColors.blueColor),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label2, style: AppTextStyles.titleSmall()),
                  Text(value2, style: AppTextStyles.bodySmall()),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildPieCard({
    required BuildContext context,
    required String title,
    required double percent,
    required Color color,
  }) {
    return BorderedContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: AppTextStyles.titleSmall()),
          const SizedBox(height: 10),
          CircularPercentIndicator(
            radius: 40,
            lineWidth: 8,
            animation: true,
            percent: percent,
            center: Text(
              "${(percent * 100).toInt()}%",
              style: AppTextStyles.titleSmall(),
            ),
            circularStrokeCap: CircularStrokeCap.round,
            backgroundColor: Colors.grey.shade200,
            progressColor: color,
          ),
        ],
      ),
    );
  }
}

Widget statusBadge(BuildContext context, String status) {
  Color badgeColor;
  switch (status) {
    case "Đã sắp":
      badgeColor = Colors.green;
      break;
    case "Chưa sắp":
      badgeColor = Colors.orange;
      break;
    default:
      badgeColor = AppColors.redColor;
  }
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text("Trạng thái:", style: AppTextStyles.bodyMedium()),
      Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 3.h,
        ),
        decoration: BoxDecoration(
          color: badgeColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Text(
          status,
          style:
              AppTextStyles.bodyMedium().copyWith(color: AppColors.whiteColor),
        ),
      ),
    ],
  );
}
