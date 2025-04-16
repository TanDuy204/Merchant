import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merchant/common/app_style.dart';
import 'package:merchant/common/bordered_container.dart';
import 'package:merchant/models/truck_model.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../service/uidata.dart';

class TruckDetail extends StatelessWidget {
  const TruckDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final TruckModel truck = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        centerTitle: true,
        title: Text(
          truck.name,
          style: AppTextStyles.titleMedium(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Thông tin xe", style: AppTextStyles.bodyLarge(context)),
              const SizedBox(height: 10),
              BorderedContainer(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Biển số xe:",
                            style: AppTextStyles.titleSmall(context)),
                        const Spacer(),
                        Text(truck.licensePlate,
                            style: AppTextStyles.titleSmall(context)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text("Nhãn hiệu:",
                            style: AppTextStyles.titleSmall(context)),
                        const Spacer(),
                        Text(truck.brand,
                            style: AppTextStyles.titleSmall(context)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text("Mã số xe:",
                            style: AppTextStyles.titleSmall(context)),
                        const Spacer(),
                        Text(truck.code,
                            style: AppTextStyles.titleSmall(context)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text("Loại xe:",
                            style: AppTextStyles.titleSmall(context)),
                        const Spacer(),
                        Text(truck.type,
                            style: AppTextStyles.titleSmall(context)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                      child: buildPieCard(
                    context: context,
                    title: "Nhiên liệu hiện có",
                    percent: 0.6,
                    color: const Color(0xFFA162F7),
                  )),
                  const SizedBox(width: 20),
                  Expanded(
                      child: buildPieCard(
                          context: context,
                          title: "trọng tải hiện thời",
                          percent: 0.25,
                          color: const Color(0xFFF6CC0D))),
                ],
              ),
              const SizedBox(height: 20),
              Text("Lịch sử vi phạm", style: AppTextStyles.bodyLarge(context)),
              const SizedBox(height: 10),
              BorderedContainer(
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.error_outline,
                          color: Colors.red,
                          size: 24,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Thứ 2, ngày 06 tháng 02 năm 2025",
                          style: AppTextStyles.bodyLarge(context),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text("14:07 -21/11/2011",
                              style: AppTextStyles.bodyMedium(context)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text("Lịch sử thu gom", style: AppTextStyles.bodyLarge(context)),
              const SizedBox(height: 10),
              BorderedContainer(
                width: double.infinity,
                child: DataTable(
                  columnSpacing: 15,
                  dataRowHeight: 65,
                  columns: [
                    DataColumn(
                      label: Text(
                        'Mã',
                        style: AppTextStyles.titleSmall(context),
                      ),
                    ),
                    DataColumn(
                      label: Text('Công ty',
                          style: AppTextStyles.titleSmall(context)),
                    ),
                    DataColumn(
                      label: Text('Tài xế',
                          style: AppTextStyles.titleSmall(context)),
                    ),
                    DataColumn(
                      label: Text('Trạng thái',
                          style: AppTextStyles.titleSmall(context)),
                    ),
                  ],
                  rows: truckData.map((item) {
                    return DataRow(
                      cells: [
                        DataCell(
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 100),
                            child: Text(
                              item['code']!,
                              style: AppTextStyles.bodySmall(context),
                            ),
                          ),
                        ),
                        DataCell(
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 100),
                            child: Text(item['company']!,
                                style: AppTextStyles.bodySmall(context),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3),
                          ),
                        ),
                        DataCell(
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 100),
                            child: Text(item['driver']!,
                                style: AppTextStyles.bodySmall(context),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2),
                          ),
                        ),
                        DataCell(
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade100,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              item['status']!,
                              style: AppTextStyles.bodySmall(context),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildPieCard({
  required BuildContext context,
  required String title,
  required double percent,
  required Color color,
}) {
  return BorderedContainer(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title, style: AppTextStyles.titleSmall(context)),
        const SizedBox(height: 10),
        CircularPercentIndicator(
          radius: 40,
          lineWidth: 8,
          animation: true,
          percent: percent,
          center: Text(
            "${(percent * 100).toInt()}%",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          circularStrokeCap: CircularStrokeCap.round,
          backgroundColor: Colors.grey.shade200,
          progressColor: color,
        ),
      ],
    ),
  );
}
