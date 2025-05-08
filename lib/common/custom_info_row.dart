import 'package:flutter/material.dart';

import 'app_style.dart';

class CustomInfoRow extends StatelessWidget {
  final String title;
  final String value;
  final bool isBold;
  final Color? valueColor;
  final bool useExpanded;
  const CustomInfoRow(
      {super.key,
      required this.title,
      required this.value,
      this.isBold = false,
      this.valueColor,
      this.useExpanded = false});

  @override
  Widget build(BuildContext context) {
    final titleText = Text(title, style: AppTextStyles.bodyMedium(context));
    final valueText = Text(
      value,
      style: AppTextStyles.bodyMedium(context).copyWith(
        color: valueColor,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      ),
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: useExpanded
          ? [
              Expanded(flex: 2, child: titleText),
              Expanded(flex: 5, child: valueText),
            ]
          : [
              titleText,
              const Spacer(),
              valueText,
            ],
    );
  }
}
