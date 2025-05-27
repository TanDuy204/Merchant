import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_style.dart';

class CustomInfoRow extends StatelessWidget {
  final String title;
  final String value;
  final bool isBold;
  final Color? valueColor;

  const CustomInfoRow(
      {super.key,
      required this.title,
      required this.value,
      this.isBold = false,
      this.valueColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyles.bodyMedium()),
        SizedBox(
          width: 8.w,
        ),
        Flexible(
          child: Text(
            value,
            style: AppTextStyles.bodyMedium().copyWith(
              color: valueColor,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
