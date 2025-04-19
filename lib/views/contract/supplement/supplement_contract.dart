import 'package:flutter/material.dart';

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
                      Text("Số hợp đồng: HDNCC.2024_7",
                          style: AppTextStyles.titleSmall(context)),
                      const Divider(),
                      _list(context, "Mã số thuế:", "055488742"),
                      const SizedBox(height: 6),
                      _list(context, "Ngày hiệu lực:", "20-2-2025"),
                      const SizedBox(height: 6),
                      _list(context, "Ngày hết hạn:", "20-8-2025"),
                      const SizedBox(height: 6),
                      _list(context, "Số hợp đồng khác:", "5885698"),
                      const SizedBox(height: 6),
                      _list(context, "Mã phụ lục:",
                          "joboko/MOITRUONGACHAU/54702"),
                      const SizedBox(height: 6),
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
