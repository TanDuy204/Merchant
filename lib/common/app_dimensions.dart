import 'package:flutter/material.dart';

class AppDimensions {
  static double _getResponsiveSize(BuildContext context, double baseSize) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < 400) {
      return baseSize * 0.75;
    } else if (screenWidth < 480) {
      return baseSize * 0.85;
    } else if (screenWidth < 600) {
      return baseSize;
    } else if (screenWidth < 850) {
      return baseSize * 1.4;
    } else {
      return baseSize * 1.8;
    }
  }

  static double iconSmall(BuildContext context) =>
      _getResponsiveSize(context, 20);
  static double iconMedium(BuildContext context) =>
      _getResponsiveSize(context, 28);
  static double iconLarge(BuildContext context) =>
      _getResponsiveSize(context, 36);

  static double heightTiny(BuildContext context) =>
      _getResponsiveSize(context, 40);
  static double heightSmall(BuildContext context) =>
      _getResponsiveSize(context, 50);
  static double heightMediumSmall(BuildContext context) =>
      _getResponsiveSize(context, 100);
  static double heightMedium(BuildContext context) =>
      _getResponsiveSize(context, 120);
  static double heightLarge(BuildContext context) =>
      _getResponsiveSize(context, 200);

  static double paddingSmall(BuildContext context) =>
      _getResponsiveSize(context, 10);
  static double paddingMedium(BuildContext context) =>
      _getResponsiveSize(context, 15);
  static double paddingLarge(BuildContext context) =>
      _getResponsiveSize(context, 20);
}
