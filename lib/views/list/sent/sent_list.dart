import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merchant/common/app_dimensions.dart';
import 'package:merchant/views/list/sent/sent_list_detail.dart';

import '../../../common/app_style.dart';

class SentList extends StatelessWidget {
  const SentList({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.to(() => const SentListDetail());
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Mã bảng kê",
                              style: AppTextStyles.titleSmall(context)),
                          const Spacer(),
                          Text("MBK-293",
                              style: AppTextStyles.titleSmall(context)),
                        ],
                      ),
                      const Divider(),
                      _list(context, "Ngày gửi bảng kê:", "25-06-2025"),
                      const SizedBox(height: 6),
                      _list(context, "Nội dung bảng kê", "Vận chuyển"),
                      const SizedBox(height: 6),
                      _list(context, "Ghi chú bảng kê:", "Bổ sung chi phí"),
                      const SizedBox(height: 6),
                      _list(context, "Tổng số tiền:", "6.000.000đ"),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Text("Trạng thái:",
                              style: AppTextStyles.bodyMedium(context)),
                          const Spacer(),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      AppDimensions.paddingSmall(context),
                                  vertical: AppDimensions.paddingTiny(context)),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text('Đã gửi',
                                  style: AppTextStyles.buttonLabel(context)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            childCount: 2, // Adjust the number of items here
          ),
        ),
      ],
    );
  }
}

Widget _list(BuildContext context, String title, String value) {
  return Row(
    children: [
      Text(title, style: AppTextStyles.bodyMedium(context)),
      const Spacer(),
      Text(value, style: AppTextStyles.bodyMedium(context)),
    ],
  );
}
