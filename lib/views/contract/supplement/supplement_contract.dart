import 'package:flutter/material.dart';
import 'package:merchant/common/app_dimensions.dart';
import 'package:merchant/common/bordered_container.dart';

import '../../../common/app_style.dart';

class SupplementContract extends StatelessWidget {
  const SupplementContract({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 4,
            (context, index) {
              return GestureDetector(
                onTap: () {},
                child: BorderedContainer(
                  margin: EdgeInsets.all(AppDimensions.paddingSmall(context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Số hợp đồng: HDNCC.2024_7",
                          style: AppTextStyles.titleXSmall(context)),
                      const Divider(),
                      _list(context, "Mã số thuế:", "055488742"),
                      SizedBox(height: AppDimensions.paddingTiny(context)),
                      _list(context, "Ngày hiệu lực:", "20-2-2025"),
                      SizedBox(height: AppDimensions.paddingTiny(context)),
                      _list(context, "Ngày hết hạn:", "20-8-2025"),
                      SizedBox(height: AppDimensions.paddingTiny(context)),
                      _list(context, "Số hợp đồng khác:", "5885698"),
                      SizedBox(height: AppDimensions.paddingTiny(context)),
                      _list(context, "Mã phụ lục:",
                          "joboko/MOITRUONGACHAU/54702"),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

Widget _list(BuildContext context, String title, String value) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        flex: 2,
        child: Text(
          title,
          style: AppTextStyles.bodyMedium(context),
        ),
      ),
      Expanded(
        flex: 3,
        child: Text(
          value,
          style: AppTextStyles.bodyMedium(context),
        ),
      ),
    ],
  );
}

Widget statusBadge(String status, BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(
      color: AppColors.redColor,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(status, style: AppTextStyles.buttonLabel(context)),
  );
}
