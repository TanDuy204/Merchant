import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:merchant/common/app_dimensions.dart';
import 'package:merchant/common/bordered_container.dart';

import '../../../common/app_style.dart';

class PendingListDetail extends StatelessWidget {
  const PendingListDetail({super.key});

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
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(AppDimensions.paddingSmall(context)),
              child: BorderedContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Thông tin chung",
                        style: AppTextStyles.titleMedium(context)),
                    const SizedBox(height: 10),
                    _detailRowIcon(context, Icons.description_outlined,
                        "Mã bảng kê:", "BK-3837"),
                    _detailRowIcon(context, Icons.calendar_today_outlined,
                        "Ngày gửi:", "15-1-2025"),
                    _detailRowIcon(context, Icons.article_outlined, "Nội dung:",
                        "Vận chuyển"),
                    _detailRowIcon(context, Icons.note_alt_outlined, "Ghi chú:",
                        "Bổ sung chi phí"),
                    _detailRowIcon(context, Icons.info_outline, "Loại hàng:",
                        "Chất thải nguy hại"),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(AppDimensions.paddingSmall(context)),
              child: BorderedContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Tổng quan",
                            style: AppTextStyles.titleMedium(context)),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text("Chưa gửi",
                              style: AppTextStyles.bodySmall(context)
                                  .copyWith(color: AppColors.whiteColor)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    _detailRow(context, "Ngày MTAC nhận bảng kê:", "17-1-2025"),
                    _detailRow(context, "Ngày MTAC phản hồi:", "19-1-2025"),
                    const Divider(),
                    _detailRow(context, "Tổng số tiền:", "3.000.000đ"),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingLarge(context),
                  vertical: AppDimensions.paddingSmall(context)),
              child: Text(
                'Danh sách chuyến thu gom:',
                style: AppTextStyles.titleMedium(context),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 2,
              (context, index) {
                return Accordion(
                  contentBorderColor: Colors.transparent,
                  rightIcon: const SizedBox.shrink(),
                  paddingListBottom: 0,
                  paddingListTop: 0,
                  headerPadding: EdgeInsets.symmetric(
                      vertical: AppDimensions.paddingMedium(context),
                      horizontal: AppDimensions.paddingSmall(context)),
                  headerBackgroundColorOpened: AppColors.lightBlue,
                  headerBackgroundColor: Colors.white,
                  children: [
                    AccordionSection(
                      header: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Mã thu gom: CTG-456450',
                              style: AppTextStyles.titleSmall(context)),
                          Text('25-7-2025',
                              style: AppTextStyles.titleSmall(context)),
                        ],
                      ),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _detailRowH(context, "Tên công ty:",
                              "TNHH Jones Lang Lasalle (Việt Nam)"),
                          _detailRowH(context, "Nội dung:", "Vận chuyển"),
                          _detailRowH(context, "Biển số xe:", "50h-10869"),
                          _detailRowH(context, "Khối lượng:", "1"),
                          _detailRowH(context, "Thành tiền:", "3.000.000"),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget _detailRow(BuildContext context, String title, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyles.bodySmall(context)),
        Text(
          value,
          style: AppTextStyles.titleSmall(context),
        ),
      ],
    ),
  );
}

Widget _detailRowH(BuildContext context, String title, String value) {
  return Padding(
    padding:
        EdgeInsets.symmetric(horizontal: AppDimensions.paddingSmall(context)),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: AppDimensions.heightMedium(context),
          child: Text(
            title,
            style: AppTextStyles.titleSmall(context),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: AppTextStyles.bodyMedium(context),
            softWrap: true,
            overflow: TextOverflow.visible,
          ),
        ),
      ],
    ),
  );
}

Widget _detailRowIcon(
    BuildContext context, IconData icon, String title, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: AppDimensions.iconMedium(context),
          color: AppColors.lightBlueColor,
        ),
        SizedBox(width: AppDimensions.paddingSmall(context)),
        Text(title, style: AppTextStyles.titleSmall(context)),
        const Spacer(),
        Text(
          value,
          style: AppTextStyles.bodyMedium(context),
        ),
      ],
    ),
  );
}
