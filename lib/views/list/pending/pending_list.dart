import 'package:flutter/material.dart';
import 'package:merchant/models/schedule_model.dart';

import '../../../common/app_style.dart';

class PendingList extends StatelessWidget {
  final List<Schedule> schedules;
  const PendingList({super.key, required this.schedules});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: schedules.length,
            (context, index) {
              final schedule = schedules[index];
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
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
                        Image.asset(
                          "assets/icons/car_icon.png",
                          width: 30,
                          height: 30,
                        ),
                        const SizedBox(width: 8),
                        Text("Thu gom",
                            style: AppTextStyles.titleSmall(context)),
                        const Spacer(),
                        Text("CTG_22223",
                            style: AppTextStyles.titleSmall(context)),
                      ],
                    ),
                    const Divider(),
                    const SizedBox(height: 6),
                    _list(context, "Tên công ty:", schedule.companyName),
                    _list(context, "Khu vực vận chuyển:", schedule.to),
                    _list(context, "Loại hàng:", schedule.cargoType),
                    _list(context, "Biển số xe:", "51-C 033755"),
                    _list(context, "Trạng thái:", "Đã thu gom")
                  ],
                ),
              );
            },
          ),
        )
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
