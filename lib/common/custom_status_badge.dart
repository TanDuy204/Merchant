import 'package:flutter/material.dart';

import 'app_dimensions.dart';
import 'app_style.dart';

class CustomStatusBadge extends StatelessWidget {
  final String status;
  final Color color;
  const CustomStatusBadge(
      {super.key, required this.status, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingSmall(context),
          vertical: AppDimensions.paddingXTiny(context)),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        status,
        style: AppTextStyles.bodyMedium(context)
            .copyWith(color: AppColors.whiteColor),
      ),
    );
  }
}
