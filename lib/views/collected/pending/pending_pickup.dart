import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:merchant/common/app_dimensions.dart';
import 'package:merchant/common/app_style.dart';
import 'package:merchant/models/pending_schedule_model.dart';
import 'package:merchant/routes/app_route.dart';

import '../../../common/custom_datapicker.dart';
import '../../../common/custom_search.dart';

class PendingPickupScreen extends StatefulWidget {
  final List<PendingScheduleModel> pendingSchedule;

  const PendingPickupScreen({super.key, required this.pendingSchedule});

  @override
  State<PendingPickupScreen> createState() => _PendingPickupScreenState();
}

class _PendingPickupScreenState extends State<PendingPickupScreen> {
  final TextEditingController fromDateController = TextEditingController();
  final TextEditingController toDateController = TextEditingController();
  final TextEditingController searchController = TextEditingController();

  DateTime? fromDate;
  DateTime? toDate;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    fromDate = now.subtract(const Duration(days: 30));
    toDate = now;

    final formatter = DateFormat('dd/MM/yyyy');
    fromDateController.text = formatter.format(fromDate!);
    toDateController.text = formatter.format(toDate!);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(
                    child: CustomDatePickerField(
                      label: "Từ Ngày:",
                      controller: fromDateController,
                      initialDate: fromDate,
                      lastDate: toDate,
                      onDatePicked: (picked) {
                        setState(() {
                          fromDate = picked;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: CustomDatePickerField(
                      label: "Đến Ngày:",
                      controller: toDateController,
                      initialDate: toDate,
                      firstDate: fromDate,
                      onDatePicked: (picked) {
                        setState(() {
                          toDate = picked;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      CustomSearch(controller: searchController),
                      const SizedBox(height: 10),
                      LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          final totalWidth = constraints.maxWidth;
                          final dateWidth = totalWidth * 0.23;
                          final typeWidth = totalWidth * 0.25;
                          final weightWidth = totalWidth * 0.20;
                          final workerWidth = totalWidth * 0.20;

                          return DataTable(
                            showCheckboxColumn: false,
                            dataTextStyle: AppTextStyles.bodySmall(context),
                            headingTextStyle: AppTextStyles.titleSmall(context),
                            columnSpacing: 0,
                            dataRowHeight: AppDimensions.heightSmall(context),
                            columns: [
                              DataColumn(
                                  label: SizedBox(
                                      width: dateWidth,
                                      child: const Text('Ngày'))),
                              DataColumn(
                                  label: SizedBox(
                                      width: typeWidth,
                                      child: const Text('Loại hàng'))),
                              DataColumn(
                                  label: SizedBox(
                                      width: weightWidth,
                                      child: const Text('Trọng tải'))),
                              DataColumn(
                                  label: SizedBox(
                                      width: workerWidth,
                                      child: const Text('Nhân công'))),
                            ],
                            rows: widget.pendingSchedule.map((item) {
                              return DataRow(
                                onSelectChanged: (_) {
                                  Get.toNamed(AppRoutes.pendingCollected,
                                      arguments: item);
                                },
                                cells: [
                                  DataCell(Text(item.date)),
                                  DataCell(Text(item.wasteType)),
                                  DataCell(Text(item.weight)),
                                  DataCell(Text(item.worker)),
                                ],
                              );
                            }).toList(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
