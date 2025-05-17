import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_style.dart';

class CustomStatusBadge extends StatelessWidget {
  final String status;
  final Color color;
  const CustomStatusBadge(
      {super.key, required this.status, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Text(
        status,
        style: AppTextStyles.bodyMedium().copyWith(color: AppColors.whiteColor),
      ),
    );
  }
}
