import 'package:flutter/material.dart';

class AppDimensions {
  static double _getResponsiveSize(BuildContext context, double baseSize) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < 375) return baseSize * 0.75;
    if (screenWidth < 400) return baseSize * 0.85;
    if (screenWidth < 480) return baseSize;
    if (screenWidth < 600) return baseSize * 1.1;
    if (screenWidth < 850) return baseSize * 1.3;
    return baseSize * 1.6;
  }

  static double iconSmall(BuildContext context) =>
      _getResponsiveSize(context, 22);
  static double iconSmallMedium(BuildContext context) =>
      _getResponsiveSize(context, 25);
  static double iconMedium(BuildContext context) =>
      _getResponsiveSize(context, 28);
  static double iconLarge(BuildContext context) =>
      _getResponsiveSize(context, 32);

  static double heightTiny(BuildContext context) =>
      _getResponsiveSize(context, 40);
  static double heightSmall(BuildContext context) =>
      _getResponsiveSize(context, 50);
  static double heightSmallMedium(BuildContext context) =>
      _getResponsiveSize(context, 70);
  static double heightMediumSmall(BuildContext context) =>
      _getResponsiveSize(context, 100);
  static double heightMedium(BuildContext context) =>
      _getResponsiveSize(context, 120);
  static double heightMediumLarge(BuildContext context) =>
      _getResponsiveSize(context, 160);
  static double heightLarge(BuildContext context) =>
      _getResponsiveSize(context, 200);

  static double paddingXXTiny(BuildContext context) =>
      _getResponsiveSize(context, 1);
  static double paddingXTiny(BuildContext context) =>
      _getResponsiveSize(context, 3);
  static double paddingTiny(BuildContext context) =>
      _getResponsiveSize(context, 7);
  static double paddingSmall(BuildContext context) =>
      _getResponsiveSize(context, 10);
  static double paddingMedium(BuildContext context) =>
      _getResponsiveSize(context, 15);
  static double paddingLarge(BuildContext context) =>
      _getResponsiveSize(context, 25);
}
