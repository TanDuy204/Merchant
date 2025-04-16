import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:merchant/common/app_dimensions.dart';
import 'package:merchant/common/app_style.dart';

class CustomDatePickerField extends StatelessWidget {
  final String label;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final TextEditingController controller;
  final Function(DateTime) onDatePicked;

  const CustomDatePickerField({
    super.key,
    required this.label,
    required this.controller,
    required this.onDatePicked,
    this.initialDate,
    this.firstDate,
    this.lastDate,
  });

  Future<void> _pickDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(2000),
      lastDate: lastDate ?? DateTime(2050),
    );

    if (picked != null) {
      onDatePicked(picked);
      controller.text = DateFormat('dd/MM/yyyy').format(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: AppTextStyles.bodyMedium(context)
                .copyWith(color: AppColors.greyColor)),
        const SizedBox(height: 6),
        Container(
          height: AppDimensions.heightTiny(context),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller,
                  readOnly: true,
                  onTap: () => _pickDate(context),
                  style: AppTextStyles.bodySmall(context),
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(vertical: 8),
                    hintText: 'dd/MM/yyyy',
                    border: InputBorder.none,
                    hintStyle: AppTextStyles.bodySmall(context)
                        .copyWith(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Icon(
                Icons.calendar_today,
                size: AppDimensions.iconSmall(context),
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
