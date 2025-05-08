import 'package:flutter/material.dart';
import 'package:merchant/common/app_dimensions.dart';
import 'package:merchant/common/bordered_container.dart';
import 'package:merchant/common/custom_info_row.dart';
import 'package:merchant/common/custom_timeline.dart';

import '../../../common/app_style.dart';

class ReturnListDetail extends StatefulWidget {
  const ReturnListDetail({super.key});

  @override
  State<ReturnListDetail> createState() => _ReturnListDetailState();
}

class _ReturnListDetailState extends State<ReturnListDetail> {
  int? openIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        centerTitle: true,
        title: Text(
          "Chi tiết bảng kê",
          style: AppTextStyles.titleMedium(context),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          ///Thông tin bản kê
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(AppDimensions.paddingSmall(context)),
              child: BorderedContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Thông tin bảng kê",
                        style: AppTextStyles.titleMedium(context)),
                    const Divider(),
                    const CustomInfoRow(title: "Mã bảng kê:", value: "BK-3837"),
                    SizedBox(height: AppDimensions.paddingTiny(context)),
                    const CustomInfoRow(title: "Ngày gửi:", value: "15-1-2025"),
                    SizedBox(height: AppDimensions.paddingTiny(context)),
                    const CustomInfoRow(
                        title: "Nội dung:", value: "Vận chuyển"),
                    SizedBox(height: AppDimensions.paddingTiny(context)),
                    const CustomInfoRow(
                        title: "Ghi chú:", value: "Bổ sung chi phí"),
                    SizedBox(height: AppDimensions.paddingTiny(context)),
                    const CustomInfoRow(
                        title: "Loại hàng:", value: "Chất thải nguy hại"),
                  ],
                ),
              ),
            ),
          ),

          ///Tổng quan bảng kê
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(AppDimensions.paddingSmall(context)),
              child: BorderedContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Tổng quan",
                        style: AppTextStyles.titleMedium(context)),
                    const Divider(),
                    statusBadge("Đã trả lại", context),
                    SizedBox(height: AppDimensions.paddingTiny(context)),
                    const CustomInfoRow(
                        title: "Ngày MTAC nhận bảng kê:", value: "17-1-2025"),
                    SizedBox(height: AppDimensions.paddingTiny(context)),
                    const CustomInfoRow(
                        title: "Ngày MATC phản hồi:", value: "19-1-2025"),
                    SizedBox(height: AppDimensions.paddingTiny(context)),
                    const CustomInfoRow(
                        title: "Số chuyến lỗi:",
                        value: "0",
                        isBold: true,
                        valueColor: AppColors.redColor),
                    SizedBox(height: AppDimensions.paddingTiny(context)),
                    const CustomInfoRow(
                        title: "Tổng số chuyến:",
                        value: "1",
                        isBold: true,
                        valueColor: AppColors.redColor),
                    SizedBox(height: AppDimensions.paddingTiny(context)),
                    const CustomInfoRow(
                        title: "Tổng số tiền:",
                        value: "3.000.000đ",
                        isBold: true,
                        valueColor: AppColors.lightBlueColor),
                  ],
                ),
              ),
            ),
          ),

          ///Tiến độ xử lý
          SliverToBoxAdapter(
            child: BorderedContainer(
              margin: EdgeInsets.all(AppDimensions.paddingSmall(context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tiến độ xử lý',
                    style: AppTextStyles.titleMedium(context),
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
                          value: "25/12/2025",
                          tileColor: AppColors.redColor),
                      CustomTimeline(
                          isFirst: false,
                          isLast: false,
                          isPast: true,
                          icon: Icons.inbox,
                          title: "MTAC nhận bản kê",
                          value: "25/12/2025",
                          tileColor: AppColors.redColor),
                      CustomTimeline(
                          isFirst: false,
                          isLast: false,
                          isPast: true,
                          icon: Icons.reply,
                          title: "MTAC phản hồi",
                          value: "25/12/2025",
                          tileColor: AppColors.redColor),
                      CustomTimeline(
                          isFirst: false,
                          isLast: true,
                          isPast: true,
                          isReturn: true,
                          icon: Icons.error,
                          title: "Bảng kê trả lại",
                          value: "Cần chỉnh sửa",
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
              margin: EdgeInsets.all(AppDimensions.paddingSmall(context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Danh sách chuyến thu gom',
                    style: AppTextStyles.titleMedium(context),
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
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: ListTile(
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Mã thu gom: CTG-456450',
                                          style: AppTextStyles.titleSmall(
                                              context)),
                                      Text('25-7-2025',
                                          style: AppTextStyles.titleSmall(
                                              context)),
                                    ],
                                  ),
                                ),
                              ),
                              AnimatedSize(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                                child: openIndex == index
                                    ? Padding(
                                        padding: EdgeInsets.all(
                                            AppDimensions.paddingSmall(
                                                context)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const CustomInfoRow(
                                                useExpanded: true,
                                                title: "Tên công ty:",
                                                value:
                                                    "TNHH Jones Lang Lasalle (Việt Nam)"),
                                            SizedBox(
                                                height:
                                                    AppDimensions.paddingTiny(
                                                        context)),
                                            const CustomInfoRow(
                                                useExpanded: true,
                                                title: "Nội dung:",
                                                value: "Vận chuyển"),
                                            SizedBox(
                                                height:
                                                    AppDimensions.paddingTiny(
                                                        context)),
                                            const CustomInfoRow(
                                                useExpanded: true,
                                                title: "Biển số xe:",
                                                value: "50h-10869"),
                                            SizedBox(
                                                height:
                                                    AppDimensions.paddingTiny(
                                                        context)),
                                            const CustomInfoRow(
                                                useExpanded: true,
                                                title: "Khối lượng:",
                                                value: "1",
                                                isBold: true,
                                                valueColor: AppColors.redColor),
                                            SizedBox(
                                                height:
                                                    AppDimensions.paddingTiny(
                                                        context)),
                                            const CustomInfoRow(
                                                useExpanded: true,
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

///Widget build status
Widget statusBadge(String status, BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text("Trạng thái:", style: AppTextStyles.bodyMedium(context)),
      Container(
        padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.paddingSmall(context),
            vertical: AppDimensions.paddingXTiny(context)),
        decoration: BoxDecoration(
          color: AppColors.redColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          status,
          style: AppTextStyles.bodyMedium(context)
              .copyWith(color: AppColors.whiteColor),
        ),
      ),
    ],
  );
}
