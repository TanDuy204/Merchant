import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:merchant/common/app_dimensions.dart';

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
              padding: EdgeInsets.symmetric(
                  vertical: AppDimensions.paddingSmall(context)),
              child: Card(
                color: AppColors.whiteColor,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
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
                                style: AppTextStyles.buttonLabel(context)),
                          ),
                        ],
                      ),
                      _detailRow(
                          context, "Ngày MTAC nhận bảng kê:", "17-1-2025"),
                      _detailRow(context, "Ngày MTAC phản hồi:", "19-1-2025"),
                      _detailRow(context, "Tổng số tiền:", "3.000.000đ"),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Card(
              color: AppColors.whiteColor,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Thông tin chung",
                            style: AppTextStyles.titleMedium(context)),
                      ],
                    ),
                    _detailRow(context, "Mã bản kê", "MBK-3837"),
                    _detailRow(context, "Ngày gửi bản kê", "15-1-2025"),
                    _detailRow(context, "Nội dung bản kê:", "Vận chuyển"),
                    _detailRow(context, "Ghi chú bảng kê:", "Bổ sung chi phí"),
                    _detailRow(context, "Loại hàng:", "Chất thải nguy hại"),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
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
                          _detailRow(context, "Tên công ty:",
                              "TNHH Jones Lang Lasalle (Việt Nam)"),
                          _detailRow(context, "Nội dung:", "Vận chuyển"),
                          _detailRow(context, "Biển số xe:", "50h-10869"),
                          _detailRow(context, "Khối lượng:", "1"),
                          _detailRow(context, "Thành tiền:", "3.000.000"),
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
        Text(title,
            style: AppTextStyles.bodySmall(context)
                .copyWith(color: AppColors.greyColor)),
        Text(
          value,
          style: AppTextStyles.titleSmall(context),
        ),
      ],
    ),
  );
}
