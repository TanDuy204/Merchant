import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:merchant/common/app_dimensions.dart';
import 'package:merchant/common/app_style.dart';
import 'package:merchant/common/bordered_container.dart';
import 'package:merchant/common/custom_status_badge.dart';
import 'package:merchant/models/debt_model.dart';

import '../../service/uidata.dart';

class DebtScreen extends StatefulWidget {
  const DebtScreen({super.key});

  @override
  State<DebtScreen> createState() => _DebtScreenState();
}

class _DebtScreenState extends State<DebtScreen> {
  String selectedValue = 'Tất cả';

  final List<String> debtTypes = [
    'Tất cả',
    'Đã thanh toán',
    'Chưa thanh toán',
    'Thanh toán một phần',
    'Hết hạn',
  ];

  Color getStatusColor(String status) {
    switch (status) {
      case 'Đã thanh toán':
        return Colors.green.shade100;
      case 'Chưa thanh toán':
        return Colors.red.shade100;
      case 'Hết hạn':
        return Colors.grey.shade300;
      case 'Thanh toán một phần':
        return Colors.orange.shade100;
      default:
        return Colors.grey.shade200;
    }
  }

  Color getStatusTextColor(String status) {
    switch (status) {
      case 'Đã thanh toán':
        return Colors.green;
      case 'Chưa thanh toán':
        return Colors.red;
      case 'Hết hạn':
        return Colors.black;
      case 'Thanh toán một phần':
        return Colors.orange;
      default:
        return Colors.black;
    }
  }

  List<DebtModel> get filteredDebts {
    if (selectedValue == 'Tất cả') return mockDebts;
    return mockDebts.where((d) => d.status == selectedValue).toList();
  }

  int get totalAmount =>
      filteredDebts.fold(0, (sum, item) => sum + item.amount);

  String formatCurrency(int amount) {
    return NumberFormat.currency(locale: 'vi_VN', symbol: 'đ').format(amount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        centerTitle: true,
        title: Text(
          "Công nợ",
          style: AppTextStyles.titleMedium(context),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(AppDimensions.heightMedium(context)),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.all(AppDimensions.paddingTiny(context)),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.wallet_outlined,
                        color: AppColors.blueColor,
                        size: AppDimensions.iconLarge(context),
                      ),
                    ),
                    SizedBox(width: AppDimensions.paddingSmall(context)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Tổng công nợ:",
                            style: AppTextStyles.bodyMedium(context)),
                        Text(formatCurrency(totalAmount),
                            style: AppTextStyles.titleLarge(context)),
                      ],
                    ),
                    const Spacer(),
                    CustomStatusBadge(
                      status: "${filteredDebts.length} công nợ",
                      color: AppColors.redColor,
                    ),
                  ],
                ),
                SizedBox(height: AppDimensions.paddingSmall(context)),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                      horizontal: AppDimensions.paddingTiny(context)),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.greyColor, width: 1),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      value: selectedValue,
                      items: debtTypes.map((status) {
                        return DropdownMenuItem(
                          value: status,
                          child: Text(status),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value!;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: filteredDebts.length,
        itemBuilder: (context, index) {
          final debt = filteredDebts[index];
          return BorderedContainer(
            margin: EdgeInsets.all(AppDimensions.paddingSmall(context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(debt.code,
                          style: AppTextStyles.titleXSmall(context)),
                    ),
                    CustomStatusBadge(
                      status: debt.status,
                      color: getStatusTextColor(debt.status),
                    )
                  ],
                ),
                Text(
                  debt.title,
                  style: AppTextStyles.bodyMedium(context),
                ),
                SizedBox(height: AppDimensions.paddingXTiny(context)),
                Text(
                  debt.date,
                  style: AppTextStyles.bodyMedium(context),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        formatCurrency(debt.amount),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        debt.progress,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.blue.shade700,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
