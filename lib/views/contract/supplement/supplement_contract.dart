import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:merchant/common/bordered_container.dart';

import '../../../common/app_style.dart';
import '../../../common/custom_info_row.dart';

class SupplementContract extends StatelessWidget {
  const SupplementContract({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 4,
              (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: BorderedContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Số hợp đồng: HDNCC.202454",
                            style: AppTextStyles.titleXSmall()),
                        const Divider(),
                        const CustomInfoRow(
                            title: 'Nhà cung cấp:',
                            value: 'Doanh nghiệp tư nhân Minh Hoàng'),
                        SizedBox(height: 7.h),
                        const CustomInfoRow(
                            title: "Ngày hiệu lực:", value: "20-2-2025"),
                        SizedBox(height: 7.h),
                        const CustomInfoRow(
                            title: "Ngày hết hạn:", value: "20-8-2025"),
                        SizedBox(height: 7.h),
                        const CustomInfoRow(
                            title: "Số hợp đồng khác:", value: "5885698"),
                        SizedBox(height: 7.h),
                        const CustomInfoRow(
                            title: "Mã phụ lục:",
                            value: "joboko/MOITRUONGACHAU/54702"),
                        SizedBox(height: 7.h),
                      ],
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
}
