import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:merchant/common/app_format.dart';
import 'package:merchant/common/app_style.dart';
import 'package:merchant/common/bordered_container.dart';
import 'package:merchant/common/custom_status_badge.dart';
import 'package:merchant/controllers/contract_controller.dart';

import '../../../common/custom_info_row.dart';
import '../../../common/custom_timeline.dart';

class ActiveContractDetail extends StatefulWidget {
  const ActiveContractDetail({super.key});

  @override
  State<ActiveContractDetail> createState() => _ActiveContractDetailState();
}

class _ActiveContractDetailState extends State<ActiveContractDetail> {
  final contractController = Get.find<ContractController>();
  int? openIndex;
  int? contractId;

  @override
  void initState() {
    super.initState();
    contractId = Get.arguments;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      contractController.getContractDetail(contractId!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
            backgroundColor: AppColors.whiteColor,
            centerTitle: true,
            title: Text(
              'Chi tiết hợp đồng',
              style: AppTextStyles.titleMedium(),
            )),
        body: Obx(
          () {
            if (contractController.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final contract = contractController.contract.value;

            return CustomScrollView(
              slivers: [
                ///Thông tin hợp đồng
                SliverToBoxAdapter(
                  child: BorderedContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Thông tin hợp đồng",
                            style: AppTextStyles.titleXSmall()),
                        const Divider(),
                        CustomInfoRow(
                            title: "Số hợp đồng:",
                            value: contract!.contractNumber ?? 'N/A'),
                        SizedBox(height: 7.h),
                        CustomInfoRow(
                            title: "Nhà cung cấp:",
                            value: contract.supplierName ?? 'N/A'),
                        SizedBox(height: 7.h),
                        CustomInfoRow(
                            title: "Người tạo:",
                            value: contract.responsiblePersonName ?? "N/A"),
                        SizedBox(height: 7.h),
                        CustomInfoRow(
                            title: "Khu vực:", value: contract.region ?? "N/A"),
                        SizedBox(height: 7.h),
                        CustomInfoRow(
                            title: "Nội dung:",
                            value: contract.content ?? "N/A"),
                      ],
                    ),
                  ),
                ),

                ///Nội dung hợp đồng
                SliverToBoxAdapter(
                  child: BorderedContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Nội dung hợp đồng",
                                style: AppTextStyles.titleXSmall()),
                            CustomStatusBadge(
                                status: contract.status ?? 'N/A',
                                color: Colors.green)
                          ],
                        ),
                        SizedBox(height: 3.h),
                        const Divider(),
                        CustomInfoRow(
                            title: 'Loại dịch vụ:',
                            value: contract.serviceType ?? 'N/A'),
                        SizedBox(height: 7.h),
                        CustomInfoRow(
                            title: 'Nhóm dịch vụ:',
                            value: contract.serviceGroup ?? 'N/A'),
                        SizedBox(height: 7.h),
                        CustomInfoRow(
                            title: 'Số hợp đồng khách hàng:',
                            value: contract.customerContractNumber ?? 'N/A'),
                        SizedBox(height: 7.h),
                      ],
                    ),
                  ),
                ),

                ///Thông tin liên hệ
                SliverToBoxAdapter(
                  child: BorderedContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Thông tin liên hệ",
                            style: AppTextStyles.titleXSmall()),
                        const Divider(),
                        CustomInfoRow(
                            title: 'Địa chỉ gửi thư:',
                            value: contract.mailingAddress ?? 'N/A'),
                        SizedBox(height: 7.h),
                        CustomInfoRow(
                            title: 'Người liên hệ:',
                            value: contract.contactName ?? 'N/A'),
                        SizedBox(height: 7.h),
                        CustomInfoRow(
                            title: 'Số điện thoại:',
                            value: contract.contactPhone ?? 'N/A'),
                        SizedBox(height: 7.h),
                      ],
                    ),
                  ),
                ),

                ///Thời gian hợp đồng
                SliverToBoxAdapter(
                  child: BorderedContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Thời gian hợp đồng',
                          style: AppTextStyles.titleXSmall(),
                        ),
                        const Divider(),
                        Column(
                          children: [
                            CustomTimeline(
                                isFirst: true,
                                isLast: false,
                                isPast: true,
                                icon: Icons.edit_document,
                                title: "Ngày ký hợp đồng",
                                value: contract.signedDate != null
                                    ? FormatHelper.formatDate(
                                        contract.signedDate!)
                                    : "Chưa có thông tin",
                                tileColor: AppColors.redColor),
                            CustomTimeline(
                                isFirst: false,
                                isLast: false,
                                isPast: true,
                                icon: Icons.check_circle,
                                title: "Ngày hiệu lực",
                                value: contract.effectiveDate != null
                                    ? FormatHelper.formatDate(
                                        contract.effectiveDate!)
                                    : "Chưa có thông tin",
                                tileColor: AppColors.redColor),
                            CustomTimeline(
                                isFirst: false,
                                isLast: true,
                                isPast: false,
                                icon: Icons.flag,
                                title: "Ngày kết thúc",
                                value: contract.endDate != null
                                    ? FormatHelper.formatDate(contract.endDate!)
                                    : "Chưa có thông tin",
                                tileColor: AppColors.redColor),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                /// File hợp đồng
                SliverToBoxAdapter(
                  child: BorderedContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("File hợp đồng",
                            style: AppTextStyles.titleXSmall()),
                        const Divider(),
                        Row(
                          children: [
                            Icon(
                              Icons.insert_drive_file,
                              color: AppColors.blueColor,
                              size: 25.sp,
                            ),
                            SizedBox(width: 10.h),
                            Expanded(
                              child: Text(
                                contract.filePath ?? 'N/A',
                                style: AppTextStyles.bodyMedium(),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                ///Phụ lục hợp đồng
                SliverToBoxAdapter(
                  child: BorderedContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Phụ lục hợp đồng',
                          style: AppTextStyles.titleXSmall(),
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
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                      child: ListTile(
                                        title: Text('Mã phụ lục: PL-01-2025',
                                            style: AppTextStyles.titleSmall()),
                                      ),
                                    ),
                                    AnimatedSize(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                      child: openIndex == index
                                          ? Padding(
                                              padding: EdgeInsets.all(10.h),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const CustomInfoRow(
                                                      title: "Tên phụ lục:",
                                                      value:
                                                          "Phụ lục giá vận chuyển"),
                                                  SizedBox(height: 7.h),
                                                  const CustomInfoRow(
                                                      title: "Ngày tạo:",
                                                      value: "01-01-2024"),
                                                  SizedBox(height: 7.h),
                                                  const CustomInfoRow(
                                                      title: "Ngày hiệu lục:",
                                                      value: "01-01-2024"),
                                                  SizedBox(height: 7.h),
                                                  statusBadge(
                                                      context, "Chờ hiệu lực"),
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
            );
          },
        ));
  }

  ///Widget build status
  Widget statusBadge(BuildContext context, String status) {
    Color badgeColor;
    switch (status) {
      case "Hiệu lực":
        badgeColor = Colors.green;
        break;
      case "Chờ hiệu lực":
        badgeColor = Colors.orange;
        break;
      default:
        badgeColor = Colors.green;
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
            style: AppTextStyles.bodyMedium()
                .copyWith(color: AppColors.whiteColor),
          ),
        ),
      ],
    );
  }
}
