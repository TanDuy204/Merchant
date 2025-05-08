import 'package:flutter/material.dart';
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
      height: AppDimensions.heightSmallMedium(context),
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle: LineStyle(
            color: isPast ? AppColors.blueColor : Colors.grey.shade200),
        afterLineStyle: LineStyle(
            color: isPast ? AppColors.blueColor : Colors.grey.shade200),
        indicatorStyle: IndicatorStyle(
          width: AppDimensions.heightTiny(context),
          color: isReturn
              ? Colors.red
              : (isPast ? AppColors.blueColor : Colors.grey.shade200),
          iconStyle: IconStyle(
            iconData: icon,
            color: isReturn
                ? Colors.white
                : (isPast ? AppColors.whiteColor : AppColors.greyColor),
            fontSize: AppDimensions.iconSmall(context),
          ),
        ),
        endChild: Padding(
          padding: EdgeInsets.only(left: AppDimensions.paddingMedium(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title, style: AppTextStyles.titleSmall(context)),
              Text(value, style: AppTextStyles.bodyMedium(context)),
            ],
          ),
        ),
      ),
    );
  }
}
