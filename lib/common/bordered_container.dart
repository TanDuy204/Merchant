import 'package:flutter/material.dart';
import 'package:merchant/common/styles.dart';

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
      width: width,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.lightBlueColor),
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
