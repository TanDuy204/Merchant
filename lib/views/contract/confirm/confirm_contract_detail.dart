import 'package:flutter/material.dart';
import 'package:merchant/common/app_dimensions.dart';
import 'package:merchant/common/app_style.dart';

import '../../../common/bordered_container.dart';
import '../../../common/custom_info_row.dart';
import '../../../common/custom_timeline.dart';

class ConfirmContractDetail extends StatefulWidget {
  const ConfirmContractDetail({super.key});

  @override
  State<ConfirmContractDetail> createState() => _ConfirmContractDetailState();
}

class _ConfirmContractDetailState extends State<ConfirmContractDetail> {
  int? openIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          centerTitle: true,
          title: Text(
            'Chi tiết hợp đồng',
            style: AppTextStyles.titleMedium(context),
          )),
      body: CustomScrollView(
        slivers: [
          ///Thông tin hợp đồng
          SliverToBoxAdapter(
            child: BorderedContainer(
              margin: EdgeInsets.all(AppDimensions.paddingSmall(context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Thông tin hợp đồng",
                      style: AppTextStyles.titleXSmall(context)),
                  const Divider(),
                  const CustomInfoRow(
                      useExpanded: true,
                      title: "Số hợp đồng:",
                      value: "HĐKHĐC.2024.8"),
                  SizedBox(height: AppDimensions.paddingTiny(context)),
                  const CustomInfoRow(
                      useExpanded: true,
                      title: "Nhà cung cấp:",
                      value: "Doanh nghiệp tư nhân Minh Hoàng"),
                  SizedBox(height: AppDimensions.paddingTiny(context)),
                  const CustomInfoRow(
                      useExpanded: true,
                      title: "Người tạo:",
                      value: "Nguyễn Thị Cẩm Tuyền"),
                  SizedBox(height: AppDimensions.paddingTiny(context)),
                  const CustomInfoRow(
                      useExpanded: true, title: "Khu vực:", value: "Miền Đông"),
                  SizedBox(height: AppDimensions.paddingTiny(context)),
                  const CustomInfoRow(
                      useExpanded: true,
                      title: "Nội dung:",
                      value: "Cung ứng lao động làm việc tại kho"),
                ],
              ),
            ),
          ),

          ///Nội dung hợp đồng
          SliverToBoxAdapter(
            child: BorderedContainer(
              margin: EdgeInsets.all(AppDimensions.paddingSmall(context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nội dung hợp đồng",
                      style: AppTextStyles.titleXSmall(context)),
                  const Divider(),
                  statusBadge(context, "Ký kết hoàn tất"),
                  SizedBox(height: AppDimensions.paddingTiny(context)),
                  const CustomInfoRow(
                      title: 'Loại dịch vụ:',
                      value: 'Vận chuyển, xử lý chất thải'),
                  SizedBox(height: AppDimensions.paddingTiny(context)),
                  const CustomInfoRow(
                      title: 'Nhóm dịch vụ:', value: 'Nhóm nhân lực'),
                  SizedBox(height: AppDimensions.paddingTiny(context)),
                  const CustomInfoRow(
                      title: 'Số hợp đồng khách hàng:', value: 'KH5055'),
                  SizedBox(height: AppDimensions.paddingTiny(context)),
                ],
              ),
            ),
          ),

          ///Thông tin liên hệ
          SliverToBoxAdapter(
            child: BorderedContainer(
              margin: EdgeInsets.all(AppDimensions.paddingSmall(context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Thông tin liên hệ",
                      style: AppTextStyles.titleMedium(context)),
                  const Divider(),
                  const CustomInfoRow(
                      useExpanded: true,
                      title: 'Địa chỉ gửi thư:',
                      value: '789 Điện Biên Phủ, Quận Bình Thạnh, TP HCM'),
                  SizedBox(height: AppDimensions.paddingTiny(context)),
                  const CustomInfoRow(
                      useExpanded: true,
                      title: 'Người liên hệ:',
                      value: 'Chị Thiên'),
                  SizedBox(height: AppDimensions.paddingTiny(context)),
                  const CustomInfoRow(
                      useExpanded: true,
                      title: 'Số điện thoại:',
                      value: '0971188322'),
                  SizedBox(height: AppDimensions.paddingTiny(context)),
                ],
              ),
            ),
          ),

          ///Thời gian hợp đồng
          SliverToBoxAdapter(
            child: BorderedContainer(
              margin: EdgeInsets.all(AppDimensions.paddingSmall(context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Thời gian hợp đồng',
                    style: AppTextStyles.titleMedium(context),
                  ),
                  const Divider(),
                  const Column(
                    children: [
                      CustomTimeline(
                          isFirst: true,
                          isLast: false,
                          isPast: true,
                          icon: Icons.edit_document,
                          title: "Ngày ký hợp đồng",
                          value: "25/12/2025",
                          tileColor: AppColors.redColor),
                      CustomTimeline(
                          isFirst: false,
                          isLast: false,
                          isPast: true,
                          icon: Icons.check_circle,
                          title: "Ngày hiệu lực",
                          value: "1/1/2026",
                          tileColor: AppColors.redColor),
                      CustomTimeline(
                          isFirst: false,
                          isLast: true,
                          isPast: true,
                          icon: Icons.flag,
                          title: "Ngày kết thúc",
                          value: "25/12/2026",
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
              margin: EdgeInsets.all(AppDimensions.paddingSmall(context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("File hợp đồng",
                      style: AppTextStyles.titleMedium(context)),
                  const Divider(),
                  Row(
                    children: [
                      const Icon(Icons.insert_drive_file,
                          color: AppColors.blueColor),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "HĐKHĐC.2024.8.pdf",
                          style: AppTextStyles.bodyMedium(context),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          ///Phụ lục hơp đồng
          SliverToBoxAdapter(
            child: BorderedContainer(
              margin: EdgeInsets.all(AppDimensions.paddingSmall(context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Phụ lục hợp đồng',
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
                                  title: Text('Mã phụ lục: PL-01-2025',
                                      style: AppTextStyles.titleSmall(context)),
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
                                                title: "Tên phụ lục:",
                                                value:
                                                    "Phụ lục giá vận chuyển"),
                                            SizedBox(
                                                height:
                                                    AppDimensions.paddingTiny(
                                                        context)),
                                            const CustomInfoRow(
                                                title: "Ngày tạo:",
                                                value: "01-01-2024"),
                                            SizedBox(
                                                height:
                                                    AppDimensions.paddingTiny(
                                                        context)),
                                            const CustomInfoRow(
                                                title: "Ngày hiệu lục:",
                                                value: "01-01-2024"),
                                            SizedBox(
                                                height:
                                                    AppDimensions.paddingTiny(
                                                        context)),
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
      ),
    );
  }
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
      Text("Trạng thái:", style: AppTextStyles.bodyMedium(context)),
      Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingSmall(context),
          vertical: AppDimensions.paddingXTiny(context),
        ),
        decoration: BoxDecoration(
          color: badgeColor,
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
