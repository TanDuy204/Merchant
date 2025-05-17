import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:merchant/common/bordered_container.dart';
import 'package:merchant/common/custom_status_badge.dart';

import '../../../common/app_style.dart';
import '../../../common/custom_info_row.dart';
import '../../../common/custom_timeline.dart';

class PendingListDetail extends StatefulWidget {
  const PendingListDetail({super.key});

  @override
  State<PendingListDetail> createState() => _PendingListDetailState();
}

class _PendingListDetailState extends State<PendingListDetail> {
  int? openIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        centerTitle: true,
        title: Text(
          "Chi tiết bảng kê",
          style: AppTextStyles.titleMedium(),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          ///Thông tin bản kê
          SliverToBoxAdapter(
            child: BorderedContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Thông tin bảng kê", style: AppTextStyles.titleMedium()),
                  const Divider(),
                  const CustomInfoRow(title: "Mã bảng kê:", value: "BK-3837"),
                  SizedBox(height: 7.h),
                  const CustomInfoRow(title: "Ngày gửi:", value: "-"),
                  SizedBox(height: 7.h),
                  const CustomInfoRow(title: "Nội dung:", value: "-"),
                  SizedBox(height: 7.h),
                  const CustomInfoRow(title: "Ghi chú:", value: "-"),
                  SizedBox(height: 7.h),
                  const CustomInfoRow(
                      title: "Loại hàng:", value: "Chất thải nguy hại"),
                ],
              ),
            ),
          ),

          ///Tổng quan bảng kê
          SliverToBoxAdapter(
            child: BorderedContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Tổng quan", style: AppTextStyles.titleMedium()),
                      const CustomStatusBadge(
                          status: "Bảng kê chưa gửi", color: Colors.orange)
                    ],
                  ),
                  SizedBox(height: 3.h),
                  const Divider(),
                  const CustomInfoRow(
                      title: "Ngày MTAC nhận bảng kê:", value: "-"),
                  SizedBox(height: 7.h),
                  const CustomInfoRow(title: "Ngày MATC phản hồi:", value: "-"),
                  SizedBox(height: 7.h),
                  const CustomInfoRow(
                      title: "Tổng số chuyến:",
                      value: "1",
                      isBold: true,
                      valueColor: AppColors.redColor),
                  SizedBox(height: 7.h),
                  const CustomInfoRow(
                      title: "Tổng số tiền:",
                      value: "3.000.000đ",
                      isBold: true,
                      valueColor: AppColors.lightBlueColor),
                ],
              ),
            ),
          ),

          ///Tiến độ xử lý
          SliverToBoxAdapter(
            child: BorderedContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tiến độ xử lý',
                    style: AppTextStyles.titleMedium(),
                  ),
                  const Divider(),
                  const Column(
                    children: [
                      CustomTimeline(
                          isFirst: true,
                          isLast: false,
                          isPast: true,
                          icon: Icons.send_rounded,
                          title: "Gửi bảng kê",
                          value: "chưa gửi",
                          tileColor: AppColors.redColor),
                      CustomTimeline(
                          isFirst: false,
                          isLast: false,
                          isPast: false,
                          icon: Icons.inbox,
                          title: "MTAC nhận bản kê",
                          value: "chưa nhận",
                          tileColor: AppColors.redColor),
                      CustomTimeline(
                          isFirst: false,
                          isLast: true,
                          isPast: false,
                          icon: Icons.reply,
                          title: "MTAC phản hồi",
                          value: "chưa phản hồi",
                          tileColor: AppColors.redColor),
                    ],
                  ),
                ],
              ),
            ),
          ),

          ///Danh sách chuyến thu gom
          SliverToBoxAdapter(
            child: BorderedContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Danh sách chuyến thu gom',
                    style: AppTextStyles.titleMedium(),
                  ),
                  const Divider(),
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: 1,
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
                                                title: "Nội dung:",
                                                value: "Vận chuyển"),
                                            SizedBox(height: 7.h),
                                            const CustomInfoRow(
                                                title: "Biển số xe:",
                                                value: "50h-10869"),
                                            SizedBox(height: 7.h),
                                            const CustomInfoRow(
                                                title: "Khối lượng:",
                                                value: "1",
                                                isBold: true,
                                                valueColor: AppColors.redColor),
                                            SizedBox(height: 7.h),
                                            const CustomInfoRow(
                                                title: "Số tiền:",
                                                value: "3.000.000đ",
                                                isBold: true,
                                                valueColor:
                                                    AppColors.lightBlueColor),
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
}
