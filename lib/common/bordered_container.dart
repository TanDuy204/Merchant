import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:merchant/common/app_style.dart';

class BorderedContainer extends StatelessWidget {
  final Widget child;

  final double? width;

  const BorderedContainer({
    super.key,
    required this.child,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10.h, 10.h, 10.h, 0.h),
      width: width,
      constraints: const BoxConstraints(),
      padding: EdgeInsets.all(10.h),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }
}
