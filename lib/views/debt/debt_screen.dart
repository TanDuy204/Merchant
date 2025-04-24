import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:merchant/common/app_dimensions.dart';
import 'package:merchant/common/app_style.dart';
import 'package:merchant/common/bordered_container.dart';
import 'package:merchant/controllers/debt_controller.dart';
import 'package:merchant/models/debt_model.dart';

import '../../common/custom_datapicker.dart';
import '../../common/sliver_header.dart';

class DebtScreen extends StatefulWidget {
  final List<DebtModel> debt;
  const DebtScreen({super.key, required this.debt});

  @override
  State<DebtScreen> createState() => _DebtScreenState();
}

class _DebtScreenState extends State<DebtScreen> {
  final TextEditingController fromDateController = TextEditingController();
  final TextEditingController toDateController = TextEditingController();
  final controller = Get.put(DebtController());
  String selectedValue = 'Loại công nợ';
  DateTime? fromDate;
  DateTime? toDate;

  final List<String> debtTypes = [
    'Tất cả',
    'Chưa thanh toán',
    'Đã thanh toán',
    'Quá hạn',
  ];

  @override
  void initState() {
    super.initState();
    controller.setDebts(widget.debt);
    final now = DateTime.now();
    fromDate = now.subtract(const Duration(days: 7));
    toDate = now;

    final formatter = DateFormat('dd/MM/yyyy');
    fromDateController.text = formatter.format(fromDate!);
    toDateController.text = formatter.format(toDate!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        centerTitle: true,
        title: Text("Công nợ", style: AppTextStyles.titleMedium(context)),
      ),
      body: Obx(() => CustomScrollView(
            slivers: [
              ///Lọc theo trang thái
              SliverPersistentHeader(
                pinned: true,
                floating: false,
                delegate: SliverHeader(
                  maxHeight: AppDimensions.heightSmallMedium(context),
                  minHeight: AppDimensions.heightSmallMedium(context),
                  child: Container(
                    color: AppColors.whiteColor,
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: AppColors.greyColor, width: 1),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          )
                        ],
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedValue,
                          icon: const Icon(Icons.arrow_drop_down),
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              setState(() {
                                selectedValue = newValue;
                              });
                            }
                          },
                          items: [
                            const DropdownMenuItem(
                              value: 'Loại công nợ',
                              enabled: false,
                              child: Row(
                                children: [
                                  Icon(Icons.filter_list, size: 18),
                                  SizedBox(width: 8),
                                  Text('Loại công nợ'),
                                ],
                              ),
                            ),
                            ...debtTypes.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              /// Lọc theo ngày
              SliverPersistentHeader(
                pinned: true,
                floating: false,
                delegate: SliverHeader(
                  maxHeight: AppDimensions.heightMediumLarge(context),
                  minHeight: AppDimensions.heightMediumLarge(context),
                  child: Container(
                    padding:
                        EdgeInsets.all(AppDimensions.paddingMedium(context)),
                    color: AppColors.whiteColor,
                    child: BorderedContainer(
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
              ),

              /// Danh sách công nợ theo ngày
              ...controller.groupDates.map((date) {
                final formattedDate =
                    DateFormat("dd 'thg' M, yyyy").format(date);
                return SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(formattedDate,
                            style: AppTextStyles.titleMedium(context)),
                        const SizedBox(height: 8),
                        ...controller.groupedDebts[date]!.map((debt) {
                          final isPaid = debt.status == 'Đã thanh toán';
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: BorderedContainer(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.event_note_outlined,
                                    size: AppDimensions.iconMedium(context),
                                    color: AppColors.greyColor,
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(debt.title,
                                            style: AppTextStyles.titleMedium(
                                                context)),
                                        const SizedBox(height: 4),
                                        Text(
                                          debt.description,
                                          style:
                                              AppTextStyles.bodyMedium(context)
                                                  .copyWith(
                                            color: AppColors.greyColor,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          children: [
                                            Text(
                                              "${NumberFormat("#,###", "vi_VN").format(debt.amount)} VND",
                                              style: AppTextStyles.titleSmall(
                                                  context),
                                            ),
                                            const Spacer(),
                                            statusBadge(isPaid, context),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                );
              }),
            ],
          )),
    );
  }
}

/// Badge hiển thị trạng thái
Widget statusBadge(bool isPaid, BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      color: isPaid ? Colors.green.shade100 : Colors.red.shade100,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          isPaid ? Icons.check_circle : Icons.cancel,
          color: isPaid ? Colors.green.shade700 : Colors.red.shade700,
          size: 16,
        ),
        const SizedBox(width: 4),
        Text(
          isPaid ? 'Đã thanh toán' : 'Chưa thanh toán',
          style: TextStyle(
            color: isPaid ? Colors.green.shade700 : Colors.red.shade700,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}
