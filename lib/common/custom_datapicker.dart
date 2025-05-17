import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'app_style.dart';

class CustomDataPicker extends StatefulWidget {
  final void Function(DateTime? from, DateTime? to)? onConfirm;
  final VoidCallback? onCancel;
  final DateTime? initialFromDate;
  final DateTime? initialToDate;

  const CustomDataPicker({
    super.key,
    this.onConfirm,
    this.onCancel,
    this.initialFromDate,
    this.initialToDate,
  });

  @override
  State<CustomDataPicker> createState() => _CustomDataPickerState();
}

class _CustomDataPickerState extends State<CustomDataPicker> {
  late DateTime? fromDate;
  late DateTime? toDate;

  final dateFormat = DateFormat('dd/MM/yyyy');

  @override
  void initState() {
    super.initState();
    fromDate = widget.initialFromDate;
    toDate = widget.initialToDate;
  }

  Future<void> _pickDate({required bool isFrom}) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
      confirmText: "Xác nhận",
      locale: const Locale('vi', 'VN'),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(primary: AppColors.blueColor),
            datePickerTheme: const DatePickerThemeData(
              headerBackgroundColor: AppColors.blueColor,
              headerForegroundColor: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        if (isFrom) {
          fromDate = picked;
          if (toDate != null && picked.isAfter(toDate!)) {
            toDate = null;
          }
        } else {
          toDate = picked;
          if (fromDate != null && picked.isBefore(fromDate!)) {
            fromDate = null;
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Lọc theo ngày", style: AppTextStyles.titleMedium()),
          SizedBox(height: 10.h),
          const Divider(),
          SizedBox(height: 15.h),
          Row(
            children: [
              Expanded(
                child: _buildDateField(
                  label: "Từ ngày",
                  date: fromDate,
                  onTap: () => _pickDate(isFrom: true),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: _buildDateField(
                  label: "Đến ngày",
                  date: toDate,
                  onTap: () => _pickDate(isFrom: false),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          const Divider(),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  widget.onCancel?.call();
                },
                child: Text(
                  "Hủy",
                  style: AppTextStyles.titleXSmall()
                      .copyWith(color: AppColors.blueColor),
                ),
              ),
              TextButton(
                onPressed: () {
                  widget.onConfirm?.call(fromDate, toDate);
                },
                child: Text(
                  "Hoàn tất",
                  style: AppTextStyles.titleXSmall()
                      .copyWith(color: AppColors.blueColor),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }

  Widget _buildDateField({
    required String label,
    required DateTime? date,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          date != null ? dateFormat.format(date) : 'Chọn ngày',
          style: AppTextStyles.bodyMedium(),
        ),
      ),
    );
  }
}
