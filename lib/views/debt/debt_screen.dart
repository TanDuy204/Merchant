import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:merchant/common/app_format.dart';
import 'package:merchant/common/app_style.dart';
import 'package:merchant/common/bordered_container.dart';
import 'package:merchant/common/custom_status_badge.dart';
import 'package:merchant/controllers/date_filter_controller.dart';
import 'package:merchant/controllers/debt_controller.dart';

import '../../common/custom_datapicker.dart';

class DebtScreen extends StatelessWidget {
  DebtScreen({super.key});

  final DebtController debtController = Get.put(DebtController());
  final DateFilterController dateFilterController =
      Get.put(DateFilterController());

  final List<String> debtTypes = [
    'Tất cả',
    'Đã thanh toán',
    'Chưa thanh toán',
    'Thanh toán một phần',
    'Hết hạn',
  ];

  Color getStatusColor(String status) {
    switch (status) {
      case 'Đã thanh toán':
        return Colors.green;
      case 'Chưa thanh toán':
        return Colors.red;
      case 'Hết hạn':
        return Colors.black54;
      case 'Thanh toán một phần':
        return Colors.orange;
      default:
        return Colors.black54;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Công nợ",
            style: AppTextStyles.titleMedium(),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.filter_alt_outlined,
                size: 23.sp,
                color: AppColors.blueColor,
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  builder: (_) => Obx(() => CustomDataPicker(
                        initialFromDate: debtController.fromDate.value,
                        initialToDate: debtController.toDate.value,
                        onConfirm: (DateTime? from, DateTime? to) {
                          if (from != null && to != null) {
                            debtController.setDateRange(from, to);
                            Get.back();
                          }
                        },
                        onCancel: () {
                          debtController.resetDateRange();
                          Get.back();
                        },
                      )),
                );
              },
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(155.h),
            child: Obx(() {
              final totalAmount = debtController.totalAmount;
              final filteredDebts = debtController.filteredDebts;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BorderedContainer(
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10.h),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.wallet_outlined,
                            color: AppColors.blueColor,
                            size: 32.sp,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Tổng công nợ:",
                                style: AppTextStyles.bodySmall()
                                    .copyWith(color: Colors.grey.shade600),
                              ),
                              Text(
                                FormatHelper.formatCurrency(totalAmount),
                                style: AppTextStyles.titleMedium()
                                    .copyWith(color: AppColors.blueColor),
                              ),
                            ],
                          ),
                        ),
                        CustomStatusBadge(
                          status: "${filteredDebts.length} công nợ",
                          color: AppColors.redColor,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(10.h, 0.h, 10.h, 10.h),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(10.r),
                      border:
                          Border.all(color: Colors.grey.shade300, width: 0.5),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        value: debtController.selectedStatus.value,
                        items: debtTypes.map((status) {
                          return DropdownMenuItem(
                            value: status,
                            child: Text(
                              status,
                              style: AppTextStyles.bodyMedium(),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          debtController.setStatus(value!);
                        },
                        dropdownStyleData: DropdownStyleData(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            Obx(() {
              final filteredDebts = debtController.filteredDebts;

              if (filteredDebts.isEmpty) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 100.h),
                        Icon(
                          Icons.account_balance_wallet_outlined,
                          size: 60.sp,
                          color: Colors.grey.shade400,
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          'Không có công nợ nào',
                          style: AppTextStyles.titleSmall().copyWith(
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }

              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final debt = filteredDebts[index];
                    return BorderedContainer(
                        child: Row(
                      children: [
                        Container(
                          width: 6.w,
                          height: 100.h,
                          decoration: BoxDecoration(
                            color: getStatusColor(debt.status),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.r),
                              bottomLeft: Radius.circular(10.r),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              debt.code,
                              style: AppTextStyles.titleXSmall().copyWith(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 3.h),
                            Text(
                              debt.title,
                              style: AppTextStyles.bodyMedium().copyWith(
                                color: Colors.grey.shade700,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              FormatHelper.formatDate(debt.date),
                              style: AppTextStyles.bodyMedium().copyWith(
                                color: Colors.grey.shade600,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              FormatHelper.formatCurrency(debt.amount),
                              style: AppTextStyles.bodyMedium().copyWith(
                                color: AppColors.blueColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5.h),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CustomStatusBadge(
                              status: debt.status,
                              color: getStatusColor(debt.status),
                            ),
                            SizedBox(
                              height: 45.h,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 6.h,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.blue.shade50,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Text(
                                debt.progress,
                                style: AppTextStyles.titleSmall().copyWith(
                                  color: AppColors.blueColor,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ));
                  },
                  childCount: filteredDebts.length,
                ),
              );
            })
          ],
        ));
  }
}
