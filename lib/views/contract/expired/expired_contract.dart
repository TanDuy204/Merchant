import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:merchant/common/bordered_container.dart';

import '../../../common/app_format.dart';
import '../../../common/app_style.dart';
import '../../../common/custom_info_row.dart';
import '../../../common/custom_status_badge.dart';
import '../../../controllers/contract_controller.dart';

class ExpiredContract extends StatelessWidget {
  const ExpiredContract({super.key});

  @override
  Widget build(BuildContext context) {
    final ContractController contractController = Get.put(ContractController());

    WidgetsBinding.instance
        .addPostFrameCallback((_) => contractController.getExpiredContracts());

    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: Obx(
          () {
            if (contractController.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (contractController.contracts.isEmpty) {
              return Center(
                child: Text(
                  "Không có hợp đồng",
                  style: AppTextStyles.bodyMedium().copyWith(
                    color: Colors.grey.shade600,
                  ),
                ),
              );
            }

            return CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: contractController.contracts.length,
                    (context, index) {
                      final contract = contractController.contracts[index];
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed('/expiredContract',
                              arguments: contract.id);
                        },
                        child: BorderedContainer(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                        "Số hợp đồng:${contract.contractNumber}",
                                        style: AppTextStyles.titleXSmall()),
                                  ),
                                  CustomStatusBadge(
                                        status: "${contract.status}",
                                      color: Colors.red)
                                ],
                              ),
                              SizedBox(height: 3.h),
                              const Divider(),
                              CustomInfoRow(
                                  title: 'Nhà cung cấp:',
                                  value: '${contract.supplierName}'),
                              SizedBox(height: 7.h),
                              CustomInfoRow(
                                  title: "Ngày hiệu lực:",
                                  value: contract.signedDate != null
                                      ? FormatHelper.formatDate(
                                          contract.signedDate!)
                                      : "Chưa có thông tin"),
                              SizedBox(height: 7.h),
                              CustomInfoRow(
                                  title: "Ngày hết hạn:",
                                  value: contract.endDate != null
                                      ? FormatHelper.formatDate(
                                          contract.endDate!)
                                      : "Chưa có thông tin"),
                              SizedBox(height: 7.h),
                              CustomInfoRow(
                                  title: "Nhóm dịch vụ:",
                                  value: "${contract.serviceGroup}"),
                              SizedBox(height: 7.h),
                              CustomInfoRow(
                                  title: "Loại dịch vụ:",
                                  value: "${contract.serviceType}"),
                              SizedBox(height: 7.h),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ));
  }
}
