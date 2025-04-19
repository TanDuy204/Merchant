import 'package:flutter/material.dart';
import 'package:merchant/common/app_dimensions.dart';
import 'package:merchant/common/app_style.dart';

class ConfirmContractDetail extends StatelessWidget {
  const ConfirmContractDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> _timelineItems = [
      {
        'label': 'Ngày tạo',
        'date': '28/03/2025',
        'color': Colors.blue,
      },
      {
        'label': 'Ngày ký',
        'date': '28/03/2025',
        'color': Colors.orange,
      },
      {
        'label': 'Ngày hiệu lực',
        'date': '24/03/2025',
        'color': Colors.green,
      },
      {
        'label': 'Ngày kết thúc',
        'date': '24/04/2025',
        'color': Colors.red,
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Chi tiết hợp đồng')),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Thông tin chung",
                      style: AppTextStyles.titleMedium(context)),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: Offset(0, 2))
                        ]),
                    child: Column(
                      children: [
                        _infoRow(context, 'Số hợp đồng:', 'HĐKHĐC.2024.8'),
                        _infoRow(context, 'Nhà cung cấp:', 'DNTN Minh Hoàng'),
                        _infoRow(context, 'Người phụ trách:',
                            'Nguyễn Thị Cẩm Tuyền'),
                        _infoRow(context, 'Khu vực:', 'Miền Đông'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nội dung hợp đồng",
                      style: AppTextStyles.titleMedium(context)),
                  const SizedBox(height: 5),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: Offset(0, 2))
                        ]),
                    child: Column(
                      children: [
                        _infoRow(context, 'Loại dịch vụ:', 'Thuê nhân công'),
                        _infoRow(
                            context, 'Nội dung:', 'Cung cấp vệ sinh nhà máy'),
                        _infoRow(context, 'Địa chỉ gửi rác:',
                            '12 Lê Lai, Quận 1, HCM'),
                        _infoRow(context, 'Trạng thái:', 'Ký kết hoàn tất'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Thông tin liên hệ",
                      style: AppTextStyles.titleMedium(context)),
                  const SizedBox(height: 5),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: Offset(0, 2))
                        ]),
                    child: Column(
                      children: [
                        _infoRow(context, 'Người liên hệ:', 'Chị Thiên'),
                        _infoRow(context, 'Số điện thoại:', '0971188322'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Thời gian hợp đồng",
                      style: AppTextStyles.titleMedium(context)),
                  const SizedBox(height: 5),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: List.generate(_timelineItems.length, (index) {
                        final item = _timelineItems[index];
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                    height: AppDimensions.paddingTiny(context)),
                                Container(
                                  width: AppDimensions.paddingMedium(context),
                                  height: AppDimensions.paddingMedium(context),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: item['color'] as Color,
                                  ),
                                ),
                                if (index != _timelineItems.length - 1)
                                  Container(
                                    width: AppDimensions.paddingXTiny(context),
                                    height: AppDimensions.heightSmall(context),
                                    color: Colors.grey.shade300,
                                  ),
                              ],
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['label'] as String,
                                    style: AppTextStyles.bodySmall(context)
                                        .copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    item['date'] as String,
                                    style: AppTextStyles.bodySmall(context)
                                        .copyWith(
                                      color: AppColors.greyColor,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                ],
                              ),
                            ),
                          ],
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("File hợp đồng",
                      style: AppTextStyles.titleMedium(context)),
                  const SizedBox(height: 5),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.insert_drive_file,
                            color: AppColors.lightBlueColor),
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
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Phụ lục hợp đồng",
                      style: AppTextStyles.titleMedium(context)),
                  const SizedBox(height: 10),
                  buildAnnexItem(
                    context,
                    code: 'PL-01-2024',
                    name: 'Phụ lục giá vận chuyển',
                    createdDate: '01-01-2024',
                    effectiveDate: '01-01-2024',
                    status: 'Hiệu lực',
                    statusColor: Colors.green,
                  ),
                  buildAnnexItem(
                    context,
                    code: 'PL-02-2024',
                    name: 'Phụ lục đơn giá nhân công',
                    createdDate: '01-02-2024',
                    effectiveDate: '15-02-2024',
                    status: 'Hiệu lực',
                    statusColor: Colors.green,
                  ),
                  buildAnnexItem(
                    context,
                    code: 'PL-03-2024',
                    name: 'Phụ lục điều chỉnh thời gian làm việc',
                    createdDate: '15-03-2024',
                    effectiveDate: '01-04-2024',
                    status: 'Chờ hiệu lực',
                    statusColor: Colors.orange,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _infoRow(BuildContext context, String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 4,
            child: Text(title, style: AppTextStyles.titleSmall(context))),
        Expanded(
            flex: 6,
            child: Text(
              value,
              style: AppTextStyles.bodyMedium(context),
            )),
      ],
    );
  }
}

Widget buildAnnexItem(
  BuildContext context, {
  required String code,
  required String name,
  required String createdDate,
  required String effectiveDate,
  required String status,
  required Color statusColor,
}) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.only(bottom: 12),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: AppColors.whiteColor,
      borderRadius: BorderRadius.circular(10),
      boxShadow: const [
        BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Mã phụ lục: $code", style: AppTextStyles.titleSmall(context)),
        Text("Tên phụ lục: $name", style: AppTextStyles.bodyMedium(context)),
        Text("Ngày tạo: $createdDate",
            style: AppTextStyles.bodyMedium(context)),
        Text("Ngày hiệu lực: $effectiveDate",
            style: AppTextStyles.bodyMedium(context)),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: statusColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            status,
            style: AppTextStyles.bodySmall(context).copyWith(
              color: statusColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    ),
  );
}
