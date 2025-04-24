import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merchant/common/app_dimensions.dart';
import 'package:merchant/common/app_style.dart';
import 'package:merchant/common/bordered_container.dart';
import 'package:merchant/models/truck_model.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TruckDetail extends StatelessWidget {
  const TruckDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final TruckModel truck = Get.arguments;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          centerTitle: true,
          title: Text(
            truck.name,
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
                      Text(
                        "Thông tin xe",
                        style: AppTextStyles.titleMedium(context),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text("Biển số xe:",
                              style: AppTextStyles.bodyMedium(context)),
                          const Spacer(),
                          Text(truck.licensePlate,
                              style: AppTextStyles.bodyMedium(context)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text("Nhãn hiệu:",
                              style: AppTextStyles.bodyMedium(context)),
                          const Spacer(),
                          Text(truck.brand,
                              style: AppTextStyles.bodyMedium(context)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text("Mã số xe:",
                              style: AppTextStyles.bodyMedium(context)),
                          const Spacer(),
                          Text(truck.code,
                              style: AppTextStyles.bodyMedium(context)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text("Loại xe:",
                              style: AppTextStyles.bodyMedium(context)),
                          const Spacer(),
                          Text(truck.type,
                              style: AppTextStyles.bodyMedium(context)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(AppDimensions.paddingSmall(context)),
                child: Row(
                  children: [
                    Expanded(
                        child: buildPieCard(
                      context: context,
                      title: "Nhiên liệu hiện có",
                      percent: 0.6,
                      color: const Color(0xFFA162F7),
                    )),
                    const SizedBox(width: 20),
                    Expanded(
                        child: buildPieCard(
                            context: context,
                            title: "Trọng tải hiện thời",
                            percent: 0.25,
                            color: const Color(0xFFF6CC0D))),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(AppDimensions.paddingSmall(context)),
              sliver: SliverToBoxAdapter(
                child: BorderedContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Lịch sử vi phạm",
                        style: AppTextStyles.titleMedium(context),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Container(
                            width: AppDimensions.heightTiny(context),
                            height: AppDimensions.heightTiny(context),
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
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Thứ 2, ngày 06 tháng 02 năm 2025",
                                style: AppTextStyles.bodyLarge(context),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 6),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text("14:07 -21/11/2011",
                                    style: AppTextStyles.bodyMedium(context)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  'Lịch sử thu gom:',
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
                            Text('Đã thu gom',
                                style: AppTextStyles.titleSmall(context)
                                    .copyWith(color: AppColors.blueColor)),
                          ],
                        ),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _detailRowH(context, "Mã thu gom:", "CTG-456450"),
                            _detailRowH(context, "Tên công ty:",
                                "TNHH Jones Lang Lasalle (Việt Nam)"),
                            _detailRowH(context, "Tài xế phụ trách:",
                                "Nguyễn Minh Thái"),
                            _detailRowH(context, "Trạng thái:", "Đã thu gom"),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ));
  }
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
        Text(title, style: AppTextStyles.titleSmall(context)),
        const SizedBox(height: 10),
        CircularPercentIndicator(
          radius: 40,
          lineWidth: 8,
          animation: true,
          percent: percent,
          center: Text(
            "${(percent * 100).toInt()}%",
            style: AppTextStyles.titleSmall(context),
          ),
          circularStrokeCap: CircularStrokeCap.round,
          backgroundColor: Colors.grey.shade200,
          progressColor: color,
        ),
      ],
    ),
  );
}

Widget _detailRowH(BuildContext context, String title, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: AppDimensions.heightMedium(context),
          child: Text(
            title,
            style: AppTextStyles.bodySmall(context),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: AppTextStyles.titleSmall(context),
            softWrap: true,
            overflow: TextOverflow.visible,
          ),
        ),
      ],
    ),
  );
}
