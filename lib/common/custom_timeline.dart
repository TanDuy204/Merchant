import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:merchant/common/app_dimensions.dart';
import 'package:merchant/common/app_style.dart';
import 'package:timeline_tile/timeline_tile.dart';

class CustomTimeline extends StatelessWidget {
  final String title;
  final String value;
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final bool isReturn;
  final Color tileColor;
  final IconData icon;

  const CustomTimeline({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.isPast,
    required this.icon,
    required this.title,
    required this.value,
    required this.tileColor,
    this.isReturn = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.heightSmallMedium(),
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle: LineStyle(
            color: isPast ? AppColors.blueColor : Colors.grey.shade200),
        afterLineStyle: LineStyle(
            color: isPast ? AppColors.blueColor : Colors.grey.shade200),
        indicatorStyle: IndicatorStyle(
          width: 35.w,
          color: isReturn
              ? Colors.red
              : (isPast ? AppColors.blueColor : Colors.grey.shade200),
          iconStyle: IconStyle(
            iconData: icon,
            color: isReturn
                ? Colors.white
                : (isPast ? AppColors.whiteColor : AppColors.greyColor),
            fontSize: 18.h,
          ),
        ),
        endChild: Padding(
          padding: EdgeInsets.only(left: 15.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title, style: AppTextStyles.titleXSmall()),
              Text(value, style: AppTextStyles.bodyMedium()),
            ],
          ),
        ),
      ),
    );
  }
}
