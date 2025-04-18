import 'package:flutter/material.dart';
import 'package:merchant/common/app_style.dart';

class BorderedContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final double? width;

  const BorderedContainer({
    super.key,
    required this.child,
    this.width,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
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
