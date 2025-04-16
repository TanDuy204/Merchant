import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:merchant/common/app_dimensions.dart';
import 'package:merchant/common/app_style.dart';
import 'package:merchant/models/debt_model.dart';

class DebtScreen extends StatefulWidget {
  final List<DebtModel> debt;
  const DebtScreen({super.key, required this.debt});

  @override
  State<DebtScreen> createState() => _DebtScreenState();
}

class _DebtScreenState extends State<DebtScreen> {
  String selectedValue = 'Loại công nợ';

  final List<String> debtTypes = [
    'Tất cả',
    'Chưa thanh toán',
    'Đã thanh toán',
    'Quá hạn'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        centerTitle: true,
        title: Text("Công nợ", style: AppTextStyles.titleMedium(context)),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  color: const Color(0xEAF1FAFF),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.greyColor, width: 1),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: Offset(0, 2))
                  ]),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedValue,
                  icon: const Icon(Icons.arrow_drop_down),
                  isExpanded: true,
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
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: widget.debt.length,
              (context, index) {
                String formatDate(DateTime date) => DateFormat("d 'Thg' M yyyy")
                    .format(DateTime.parse(date.toString()));

                final debt = widget.debt[index];
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.calendar_today,
                              size: AppDimensions.iconMedium(context),
                              color: AppColors.greyColor),
                          const SizedBox(width: 6),
                          Text(
                            formatDate(debt.day),
                            style: AppTextStyles.titleMedium(context)
                                .copyWith(color: AppColors.greyColor),
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            decoration: BoxDecoration(
                              color: debt.isPaid
                                  ? AppColors.lightBlueColor
                                  : AppColors.redColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              debt.isPaid ? 'Đã thanh toán' : 'Chưa thanh toán',
                              style: AppTextStyles.bodyMedium(context)
                                  .copyWith(color: AppColors.whiteColor),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        debt.title,
                        style: AppTextStyles.titleMedium(context),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        debt.description,
                        style: AppTextStyles.bodyMedium(context)
                            .copyWith(color: AppColors.greyColor),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const Spacer(),
                          Text(
                            'Thành tiền:',
                            style: AppTextStyles.titleMedium(context),
                          ),
                          const SizedBox(width: 20),
                          Text(
                            '${debt.amount.toString()} VND',
                            style: AppTextStyles.bodyMedium(context)
                                .copyWith(color: AppColors.greyColor),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                    ],
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
