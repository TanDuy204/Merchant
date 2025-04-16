import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merchant/common/app_dimensions.dart';
import 'package:merchant/common/app_style.dart';
import 'package:merchant/models/pending_schedule_model.dart';

class PendingPickupDetail extends StatelessWidget {
  const PendingPickupDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final PendingScheduleModel pendingSchedule = Get.arguments;
    return Scaffold(
      appBar: AppBar(title: Text('Chi tiết ngày ${pendingSchedule.date}')),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(AppDimensions.paddingSmall(context)),
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: Colors.blue[800],
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _infoText(context, pendingSchedule.date),
                      _infoText(context, pendingSchedule.wasteType),
                      _infoText(context, pendingSchedule.weight),
                      _infoText(context, pendingSchedule.worker),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'Danh sách chi tiết:',
                style: AppTextStyles.titleMedium(context),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: pendingSchedule.companyDetails.length,
              (context, index) {
                final detail = pendingSchedule.companyDetails[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _detailRow(
                              context, "Tên công ty:", detail.companyName),
                          _detailRow(context, "Địa điểm:", detail.address),
                          _detailRow(
                              context, "Người liên hệ:", detail.contactName),
                          _detailRow(context, "Số lượng:", detail.quantity),
                          _detailRow(context, "Ghi chú:", detail.note),
                        ],
                      ),
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

  ///widget header
  Widget _infoText(BuildContext context, String value) {
    return Text(
      value,
      style: AppTextStyles.titleSmall(context)
          .copyWith(color: AppColors.whiteColor),
    );
  }
}

Widget _detailRow(BuildContext context, String title, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            width: AppDimensions.heightMedium(context),
            child: Text(title, style: AppTextStyles.titleSmall(context))),
        Expanded(
            child: Text(
          value,
          style: AppTextStyles.bodySmall(context),
        )),
      ],
    ),
  );
}
